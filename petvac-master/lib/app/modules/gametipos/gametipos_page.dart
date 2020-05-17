import 'package:flutter/material.dart';
import 'package:petvac/app/models/gametipos_model.dart';
import 'package:petvac/app/modules/gametipos/gametipos_bloc.dart';
import 'package:petvac/app/utils/main_drawer.dart';
import 'package:rxdart/rxdart.dart';

import 'gametipos_edit_page.dart';

class GameTiposPage extends StatefulWidget {
  final String title;
  static const String route = '/gameTipos';

  const GameTiposPage({Key key, this.title = "Tipos de Games"}) : super(key: key);

  @override
  _GameTiposPageState createState() => _GameTiposPageState();
}

class _GameTiposPageState extends State<GameTiposPage> {
  var _bloc = GameTiposBloc();

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
          var _gameTipos = GameTipos()..nome = "";

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameTiposEditPage(_gameTipos),
            ),
          );
        },
      ),
      body: Container(
        child: StreamBuilder<List<GameTipos>>(
          stream: _bloc.getGameTipos,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map(
                  (_gameTipos) {
                    return Dismissible(
                      key: Key(_gameTipos.documentId()),
                      onDismissed: (direction) {
                        _bloc.delete(_gameTipos.documentId());
                      },
                      child: ListTile(
                        title: Text(_gameTipos.nome),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameTiposEditPage(_gameTipos),
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
