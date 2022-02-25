import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/esqueleto.dart';
import 'package:obra/http/webclients/pessoa_webclient.dart';
import 'package:obra/models/pessoa.dart';
import 'package:obra/screens/login/item_login.dart';

const _tituloAppBar = 'Login';

class Login extends StatelessWidget {
  final PessoaWebClient _webClient = PessoaWebClient();

  @override
  Widget build(BuildContext context) {
    return Esqueleto<List<Pessoa>>(
        bottomNavigationBar: Text(''),
        pesquisa: _webClient.findAll(),
        titulo: _tituloAppBar,
        builder: (context, pessoas) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pessoas.length,
              itemBuilder: (context, indice) {
                final pessoa = pessoas[indice];
                return ItemLogin(pessoa);
              });
        });
  }
}
