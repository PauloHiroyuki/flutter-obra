import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/models/pessoa.dart';

class ItemLogin extends StatelessWidget {
  final Pessoa _pessoa;

  ItemLogin(this._pessoa);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Image(
          image: _montarImagem(_pessoa.urlImagem),
        ),
        subtitle: Center(
          child: Text(
            _pessoa.nome,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () => _logar(_pessoa),
      ),
    );
  }

  ImageProvider _montarImagem(String? url) {
    if (url != null && url.isEmpty == false) {
      return NetworkImage(url);
    }
    return AssetImage('assets/images/sem_foto.png');
  }

  void _logar(pessoa){

  }
}
