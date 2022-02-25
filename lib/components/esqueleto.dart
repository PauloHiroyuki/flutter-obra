import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/centered_message.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/components/progress.dart';


class Esqueleto<T> extends StatelessWidget {
  final Future<T> pesquisa;
  final String titulo;
  final Function builder;
  final Widget bottomNavigationBar;

  Esqueleto({required this.pesquisa, required this.titulo, required this.builder, required this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titulo),
      ),
      body: FutureBuilder<T>(
          future: pesquisa,
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
                  return builder(context, snapshot.data!);
                }
                return CenteredMessage('Nenhum registro Encontrado');
            }
            return CenteredMessage('Erro desconhecido');
          }),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}