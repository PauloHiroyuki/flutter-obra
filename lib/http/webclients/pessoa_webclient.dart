import 'dart:convert';

import 'package:http/http.dart';
import 'package:obra/models/pessoa.dart';

import 'package:obra/http/webclient.dart';

final Uri _uri = Uri.https(baseUrl, '/v3/b7c85b56-b098-4c6d-ad38-d74f3bf6efd5', { 'ativo' : 'true' });

class PessoaWebClient {
  Future<List<Pessoa>> findAll() async {

    final Response response = await client.get(_uri);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Pessoa.fromJson(json))
        .toList();
  }
}