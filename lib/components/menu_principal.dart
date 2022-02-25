import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/tools/LoginTools.dart';

class MenuPrincipal extends StatelessWidget {

  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_box_rounded),
          label: 'Trocar Usuario',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.house),
          label: 'Projetos',
        ),
      ],
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }


  void _onItemTapped(int index) async {
    if (index == 0) {
      Navigator.popAndPushNamed(_context!, '/');
    }
    if (index == 1) {
      LoginTools.removeUsuario();
      Navigator.popAndPushNamed(_context!, '/login');
    }
    if (index == 2) {
      Navigator.popAndPushNamed(_context!, '/projetos');
    }
  }
}
