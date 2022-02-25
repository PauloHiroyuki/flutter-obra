import 'package:flutter/material.dart';
import 'package:obra/components/centered_message.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/components/progress.dart';
import 'package:obra/http/webclients/projeto_webclient.dart';
import 'package:obra/models/projeto.dart';
import 'package:obra/screens/projeto/formulario_projeto.dart';
import 'package:obra/screens/projeto/item_projeto.dart';
import 'package:obra/screens/projeto/lista_projetos.dart';

const _tituloAppBar = 'Projetos Ativos';

class NovaHome extends StatelessWidget {
  final ProjetoWebClient _webClient = ProjetoWebClient();
  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: FutureBuilder<List<Projeto>>(
          future: _webClient.ListarAtivos(),
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
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: _projetos.length,
                      itemBuilder: (context, indice) {
                        final projeto = _projetos[indice];
                        return ItemProjeto(projeto);
                      });
                }
                return CenteredMessage(
                  'Projetos não encontrados',
                  icon: Icons.warning,
                );
            }
            return CenteredMessage('Erro desconhecido');
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioProjeto();
          }));
        },
      ),
      bottomNavigationBar: MenuPrincipal(),
    );
  }

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(_context!, MaterialPageRoute(builder: (context) {
        return ListaProjetos();
      }));
    }
    if (index == 2) {
      Navigator.push(_context!, MaterialPageRoute(builder: (context) {
        return ListaProjetos();
      }));
    }
  }
}
