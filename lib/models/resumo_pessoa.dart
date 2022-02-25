import 'package:obra/models/classificacao.dart';
import 'package:obra/models/pessoa.dart';

class ResumoPessoa {
  final String nome;
  final Pessoa pessoa;
  final double valor;

  ResumoPessoa(
      this.nome,
      this.pessoa,
      this.valor
      );

  @override
  String toString() {
    return 'ResumoPessoa{nome: $nome, pessoa: ${pessoa.nome}, valor: $valor}';
  }
}
