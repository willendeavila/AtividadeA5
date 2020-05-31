
import 'package:flutter/material.dart';
import 'package:petvac/app/models/gamestatus_model.dart';
import 'package:petvac/app/modules/gamestatus/gamestatus_bloc.dart';
import 'package:petvac/app/utils/main_drawer.dart';
import 'package:rxdart/rxdart.dart';
import 'gamestatus_edit_page.dart';

class GameStatusPage extends StatefulWidget {
  final String title;
  static const String route = '/gameStatus';

  const GameStatusPage({Key key, this.title = "Tipos de Status"}) : super(key: key);

  @override
  _GameStatusPageState createState() => _GameStatusPageState();
}

class _GameStatusPageState extends State<GameStatusPage> {
  var _bloc = GameStatusBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var _gameStatus = GameStatus()..nome = "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameStatusEditPage(_gameStatus),
            ),
          );
        },
      ),
      body: Container(
        child: StreamBuilder<List<GameStatus>>(
          stream: _bloc.getGameStatus,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map(
                  (_gameStatus) {
                    return Dismissible(
                      key: Key(_gameStatus.documentId()),
                      onDismissed: (direction) {
                        _bloc.delete(_gameStatus.documentId());
                      },
                      child: ListTile(
                        title: Text(_gameStatus.nome),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameStatusEditPage(_gameStatus),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ).toList(),
              ),
            );
          },
        ),
      ),
    );
  }
}
