import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/models/projeto.dart';

class ItemHome extends StatelessWidget {
  final Projeto _projeto;

  ItemHome(this._projeto);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Image(
          image: _montarImagem(_projeto.urlImagem),
        ),
        subtitle: Center(
          child: Text(
            _projeto.nome,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  ImageProvider _montarImagem(String? url) {
    if (url != null && url.isEmpty == false) {
      return NetworkImage(url);
    }
    return AssetImage('assets/images/sem_foto.png');
  }
}
