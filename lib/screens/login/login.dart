import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/centered_message.dart';
import 'package:obra/components/progress.dart';
import 'package:obra/http/webclients/pessoa_webclient.dart';
import 'package:obra/models/pessoa.dart';
import 'package:obra/screens/login/item_login.dart';
import 'package:obra/tools/LoginTools.dart';

const _tituloAppBar = 'Login';

class Login extends StatelessWidget {
  final PessoaWebClient _webClient = PessoaWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Pessoa>>(
          future: _webClient.findAll(),
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
                  final pessoas = snapshot.data!;
                  return GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: pessoas.length,
                      itemBuilder: (context, indice) {
                        final pessoa = pessoas[indice];
                        return ItemLogin(pessoa);
                      });
                }
                return CenteredMessage('Nenhum registro Encontrado');
            }
            return CenteredMessage('Erro desconhecido');
          }),
    );
  }
}
