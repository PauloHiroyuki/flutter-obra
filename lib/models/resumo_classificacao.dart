import 'package:obra/models/classificacao.dart';

class ResumoClassificacao {
  final String nome;
  final Classificacao classificacao;
  final double valor;

  ResumoClassificacao(
      this.nome,
      this.classificacao,
      this.valor
      );

  @override
  String toString() {
    return 'ResumoClassificacao{nome: $nome, classificacao: $classificacao, valor: $valor}';
  }
}
