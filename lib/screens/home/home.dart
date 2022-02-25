import 'package:flutter/material.dart';
import 'package:obra/components/esqueleto.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/http/webclients/projeto_webclient.dart';
import 'package:obra/models/projeto.dart';
import 'package:obra/screens/home/item_home.dart';

const _tituloAppBar = 'Projetos Ativos';

class Home extends StatelessWidget {
  final ProjetoWebClient _webClient = ProjetoWebClient();
  BuildContext? _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Esqueleto<List<Projeto>>(
        bottomNavigationBar: MenuPrincipal(),
        pesquisa: _webClient.ListarAtivos(),
        titulo: _tituloAppBar,
        builder: (context, projetos) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
              ),
              itemCount: projetos.length,
              itemBuilder: (context, indice) {
                final projeto = projetos[indice];
                return ItemHome(projeto);
              });
        });
  }
}
