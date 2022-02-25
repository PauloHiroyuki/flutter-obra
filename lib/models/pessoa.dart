class Pessoa {
  final String id;
  final String nome;
  final String? urlImagem;

  Pessoa(
      this.id,
      this.nome,
      this.urlImagem,
      );

  @override
  String toString() {
    return 'Pessoa{id: $id, nome: $nome, urlImagem: $urlImagem}';
  }

  Pessoa.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        nome = json['nome'],
        urlImagem = json['urlImagem'];

  Map<String, dynamic> toJson() =>
      {
        'id' : id,
        'nome': nome,
        'urlImagem': urlImagem,
      };
}
