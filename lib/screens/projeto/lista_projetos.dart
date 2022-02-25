import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/centered_message.dart';
import 'package:obra/components/esqueleto.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/components/progress.dart';
import 'package:obra/http/webclients/projeto_webclient.dart';
import 'package:obra/models/projeto.dart';

const _tituloAppBar = 'Projetos';

class ListaProjetos extends StatelessWidget {
  final ProjetoWebClient _webClient = ProjetoWebClient();

  @override
  Widget build(BuildContext context) {
    return Esqueleto<List<Projeto>>(
      bottomNavigationBar: MenuPrincipal(),
      pesquisa: _webClient.ListarTodos(),
      titulo: 'titulo',
      builder: (context, projetos) {
        debugPrint(projetos.toString());
        return ListView.builder(
          itemBuilder: (context, index) {
            final Projeto projeto = projetos[index];
            return Card(
              child: ListTile(
                leading: Image(image: _teste(projeto)),
                title: Text(
                  projeto.nome,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  projeto.situacao == null ? '' : projeto.situacao!,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            );
          },
          itemCount: projetos.length,
        );
      },
    );
  }

  ImageProvider _teste(Projeto projeto) {
    if (projeto.urlImagem == null ) {
      return AssetImage('assets/images/sem_foto.png');
    }
    return NetworkImage(projeto.urlImagem!);
  }
}


