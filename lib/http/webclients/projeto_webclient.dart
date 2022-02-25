import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:obra/http/webclient.dart';
import 'package:obra/models/projeto.dart';

final Uri _uriAtivos = Uri.https(
    baseUrl, '/v3/3a923f28-31d0-4c72-8476-91e015b6f618', {'ativo': 'true'});
final Uri _uriTodos =
    Uri.https(baseUrl, '/v3/3a923f28-31d0-4c72-8476-91e015b6f618');

class ProjetoWebClient {
  Future<List<Projeto>> ListarTodos() async {
    final Response response = await client.get(_uriTodos);
    final List<dynamic> decodedJson = await jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Projeto.fromJson(json)).toList();
  }

  Future<List<Projeto>> ListarAtivos() async {
    final Response response = await client.get(_uriAtivos);
    final List<dynamic> decodedJson = await jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Projeto.fromJson(json)).toList();
  }
}
