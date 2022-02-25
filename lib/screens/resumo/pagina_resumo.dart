import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/models/projeto.dart';
import 'package:obra/models/resumo.dart';
import 'package:obra/models/resumo_classificacao.dart';
import 'package:obra/models/resumo_pessoa.dart';

const _tituloAppBar = 'Resumo';

class PaginaResumo extends StatelessWidget {
  final Projeto _projeto;
  List<ResumoPessoa> _resumoPessoa = [];
  List<ResumoClassificacao> _resumoClassificacao = [];

  Resumo? _resumo;

  PaginaResumo(this._projeto) {
    this._resumoPessoa = [];
    this._resumoClassificacao = [];
    this._resumo = Resumo(_resumoPessoa, _resumoClassificacao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
    );
  }
}
