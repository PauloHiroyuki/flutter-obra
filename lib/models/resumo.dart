import 'package:obra/models/resumo_classificacao.dart';
import 'package:obra/models/resumo_pessoa.dart';

class Resumo {
  final List<ResumoPessoa> resumoPessoa;
  final List<ResumoClassificacao> resumoClassificacao;

  Resumo(
      this.resumoPessoa,
      this.resumoClassificacao,
      );

  @override
  String toString() {
    return 'Resumo{resumoPessoa: $resumoPessoa, resumoClassificacao: $resumoClassificacao}';
  }
}
