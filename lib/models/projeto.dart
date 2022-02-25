class Projeto {
  final String id;
  final String nome;
  final String? urlImagem;
  final String? situacao;

  Projeto(
      this.id,
      this.nome,
      this.urlImagem,
      this.situacao
      );

  @override
  String toString() {
    return 'Projeto{id: $id, valor: $nome, numeroConta: $urlImagem, situacao: $situacao}';
  }
  Projeto.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        nome = json['nome'],
        urlImagem = json['urlImagem'],
        situacao = json['situacao'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'nome': nome,
        'urlImagem': urlImagem,
        'situacao': situacao,
      };
}
