import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser();
    
    return Drawer(
      child: ListView(
        children: <Widget>[

                   

          UserAccountsDrawerHeader(
                /* não consegui pegar direto BD 
                final FirebaseUser user = await _auth.currentUser();
                final uid = user.uid;
                */
                accountName: Text('teste'),
                accountEmail: Text("teste@teste.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: 
                  
                NetworkImage('https://w0.pngwave.com/png/613/636/computer-icons-user-profile-male-avatar-avatar-png-clip-art.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),



          /*
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sonic.png')),
                color: Colors.green),
            child: Stack(
              children: <Widget>[
                Positioned(child: Text("Games Menu")),
                Positioned(
                  bottom: 0.0,
                  child: OutlineButton(
            
                    shape: StadiumBorder(),
                    textColor: Colors.blue,
                    child: Text('Sair'),
                    borderSide: BorderSide(
                        color: Colors.blue, style: BorderStyle.solid, width: 1),
                    onPressed: () {
                      FirebaseAuth.instance.signOut().then((valor) {
                        Navigator.pushReplacementNamed(context, Routes.logon);
                      });
                    },
                  ),
                )
              ],
            ),
          ),*/
          _addDrawerItem(
            Icons.home,
            'Home',
            () => Navigator.pushReplacementNamed(context, Routes.home),
          ),
          _addDrawerItem(
            Icons.grade,
            'Tipos de Games',
            () => Navigator.pushReplacementNamed(context, Routes.gameTipos),
          ),
          _addDrawerItem(
            Icons.gamepad,
            'Games',
            () => Navigator.pushReplacementNamed(context, Routes.games),
          ),
        ],
      ),
    );
  }
}

Widget _addDrawerItem(_icon, _text, _onTap) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(_icon),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(_text),
        )
      ],
    ),
    onTap: _onTap,
  );
}
