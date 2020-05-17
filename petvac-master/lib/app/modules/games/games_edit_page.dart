import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petvac/app/models/games_model.dart';
import 'package:petvac/app/models/gametipos_model.dart';
import 'package:petvac/app/modules/games/games_bloc.dart';
import 'package:petvac/app/modules/gametipos/gametipos_bloc.dart';

class GamesEditPage extends StatefulWidget {
  final Games games;

  GamesEditPage(this.games);

  @override
  State<StatefulWidget> createState() => _GamesEditPageState();
}

class _GamesEditPageState extends State<GamesEditPage> {
  TextEditingController _nomeController;
  final _bloc = GamesBloc();
  final _blocGameTipos = GameTiposBloc();
  final _dateFormat = DateFormat("dd/MM/yyyy");

  @override
  void initState() {
    _bloc.setGames(widget.games);
    _nomeController = TextEditingController(text: widget.games.nome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição Games'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              Container(height: 6),
              StreamBuilder<DateTime>(
                stream: _bloc.outDataAtualizacao,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) return CircularProgressIndicator();

                  return InkWell(
                    onTap: () => _inputDataAtualizacao(context, snapshot.data),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Data de Atualização",
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(_dateFormat.format(snapshot.data)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(height: 6),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Tipo de Game",
                  ),
                  child: StreamBuilder<List<GameTipos>>(
                      stream: _blocGameTipos.getGameTipos,
                      builder: (context, snapshotGameTipos) {
                        var _gameTiposId = _bloc.outGameTiposIdValue == null ||
                                _bloc.outGameTiposIdValue == ""
                            ? snapshotGameTipos.data.first.documentId()
                            : _bloc.outGameTiposIdValue;

                        if (!snapshotGameTipos.hasData)
                          return CircularProgressIndicator();

                        return DropdownButton<String>(
                          value: _gameTiposId,
                          isExpanded: true,
                          items:
                              snapshotGameTipos.data.map((GameTipos _gameTipos) {
                            return DropdownMenuItem<String>(
                              value: _gameTipos.documentId(),
                              child: Text(_gameTipos.nome),
                            );
                          }).toList(),
                          onChanged: (String gameTiposId) {
                            setState(() {
                              _gameTiposId = gameTiposId;
                              _bloc.setGameTiposId(gameTiposId);
                            });
                          },
                        );
                      }),
                ),
              ),
              Container(height: 6),
              Container(
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: "Plataforma",
                  ),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text("PS4"),
                        leading: Radio(
                          value: "PS4",
                          groupValue: _bloc.outPlataformaValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setPlataforma(value);
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text("XBOX"),
                        leading: Radio(
                          value: "XBOX",
                          groupValue: _bloc.outPlataformaValue,
                          onChanged: (value) {
                            setState(() {
                              _bloc.setPlataforma(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  if (_bloc.insertOrUpdate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _inputDataAtualizacao(
      BuildContext context, DateTime initialDate) async {
    final DateTime choosedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2113));

    if (choosedDate != null) {
      _bloc.setDataAtualizacao(choosedDate);
    }
  }
}
