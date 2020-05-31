import 'package:flutter/material.dart';
import 'package:petvac/app/models/gamestatus_model.dart';
import 'package:petvac/app/modules/gamestatus/gamestatus_bloc.dart';

class GameStatusEditPage extends StatefulWidget {
  final GameStatus gameStatus;

  GameStatusEditPage(this.gameStatus);

  @override
  State<StatefulWidget> createState() => _GameStatusEditPageState();
}

class _GameStatusEditPageState extends State<GameStatusEditPage> {
  TextEditingController _nomeController;
  final _bloc = GameStatusBloc();

  @override
  void initState() {
    _bloc.setGameStatus(widget.gameStatus);
    _nomeController = TextEditingController(text: widget.gameStatus.nome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edição Tipos de Status'),
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
