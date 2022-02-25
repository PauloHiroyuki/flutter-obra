import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/centered_message.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/components/progress.dart';
import 'package:obra/http/webclients/projeto_webclient.dart';
import 'package:obra/models/projeto.dart';
import 'package:obra/screens/projeto/formulario_projeto.dart';

const _tituloAppBar = 'Projetos';

class NovaListaProjetos extends StatelessWidget {
  final ProjetoWebClient _webClient = ProjetoWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Projeto>>(
          future: _webClient.ListarTodos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Progress();
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Projeto> _projetos = snapshot.data!;
                }
            }
            return CenteredMessage('Erro desconhecido');
          }),
      bottomNavigationBar: MenuPrincipal(),
    );
  }
}
