import 'package:flutter/material.dart';
import 'package:petvac/app/models/gametipos_model.dart';
import 'package:petvac/app/modules/gametipos/gametipos_bloc.dart';

class GameTiposEditPage extends StatefulWidget {
  final GameTipos gameTipos;

  GameTiposEditPage(this.gameTipos);

  @override
  State<StatefulWidget> createState() => _GameTiposEditPageState();
}

class _GameTiposEditPageState extends State<GameTiposEditPage> {
  TextEditingController _nomeController;
  final _bloc = GameTiposBloc();

  @override
  void initState() {
    _bloc.setGameTipos(widget.gameTipos);
    _nomeController = TextEditingController(text: widget.gameTipos.nome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição Tipos de Game'),
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
}
