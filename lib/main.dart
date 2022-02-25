import 'package:flutter/material.dart';
import 'package:obra/screens/home.dart';
import 'package:obra/screens/login/login.dart';
import 'package:obra/screens/projeto/formulario_projeto.dart';
import 'package:obra/screens/projeto/nova_lista_projetos.dart';

void main() {
  runApp(ObraApp());

}

class ObraApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[900],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent[700],
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialRoute: '/projetos',
      routes: {
        '/': (context) => Home(),
        '/login': (context) => Login(),
        '/projetos': (context) => NovaListaProjetos(),
        '/projetos/form': (context) => FormularioProjeto(),
      },
    );
  }
}
