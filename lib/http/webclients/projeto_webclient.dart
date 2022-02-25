import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:obra/models/pessoa.dart';

import 'package:obra/http/webclient.dart';
import 'package:obra/models/projeto.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Uri _uriAtivos = Uri.https(baseUrl, '/v3/b7c85b56-b098-4c6d-ad38-d74f3bf6efd5', { 'ativo' : 'true' });
final Uri _uriTodos = Uri.https(baseUrl, '/v3/3a923f28-31d0-4c72-8476-91e015b6f618');

class ProjetoWebClient {
  Future<List<Projeto>> ListarTodos() async {


    final prefs = await SharedPreferences.getInstance();
    final usuario = prefs.getString("usuario");
    debugPrint('listas todos com usuario logado: $usuario');

    final Response response = await client.get(_uriTodos);
    final List<dynamic> decodedJson = await jsonDecode(response.body);
    final List<Projeto> teste = await decodedJson
        .map((dynamic json) => Projeto.fromJson(json))
        .toList();
    return teste;
  }

  Future<List<Projeto>> ListarAtivos() async {
    final Response response = await client.get(_uriAtivos);
    final List<dynamic> decodedJson = await jsonDecode(response.body);
    final List<Projeto> teste = await decodedJson
        .map((dynamic json) => Projeto.fromJson(json))
        .toList();
    return teste;
  }
}