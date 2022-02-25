import 'package:obra/models/classificacao.dart';
import 'package:obra/models/pessoa.dart';
import 'package:obra/models/projeto.dart';

class Lancamento {
  final String id;
  final DateTime data;
  final Classificacao classificacao;
  final Pessoa pessoa;
  final double valor;
  final String? observacao;
  final String? urlComprovante;
  final Projeto projeto;

  Lancamento(
      this.id,
      this.data,
      this.classificacao,
      this.pessoa,
      this.valor,
      this.observacao,
      this.urlComprovante,
      this.projeto,
      );

  @override
  String toString() {
    return 'Lancamento{id: $id, data: $data, classificacao: $classificacao, pessoa: $pessoa, valor: $valor, observacao: $observacao, urlComprovante: $urlComprovante, projeto: $projeto}';
  }
}
