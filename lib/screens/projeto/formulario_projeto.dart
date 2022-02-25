import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/editor.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/models/projeto.dart';

const _tituloAppBar = 'Projeto';

const _rotuloCampoNome = 'Nome:';
const _dicaCampoNome = 'Nome do Projeto';

const _rotuloCampoUrlImagem = 'Imagem';
const _dicaCampoUrlImagem = '';

const _textoBotaoConfirmar = 'Confirmar';

class FormularioProjeto extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioProjetoState();
  }
}

class FormularioProjetoState extends State<FormularioProjeto> {
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoUrlImagem =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_tituloAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                controlador: _controladorCampoNome,
                dica: _dicaCampoNome,
                rotulo: _rotuloCampoUrlImagem,
              ),
              Editor(
                controlador: _controladorCampoUrlImagem,
                dica: _dicaCampoUrlImagem,
                rotulo: _rotuloCampoUrlImagem,
              ),
              ElevatedButton (
                child: Text(_textoBotaoConfirmar),
                onPressed: () => _criaTransferencia(context),
              ),
            ],
          ),
        ),
      bottomNavigationBar: MenuPrincipal(),
    );
  }

  void _criaTransferencia(BuildContext context) {
    if (_controladorCampoNome.text != null) {
      final projetoCriado =
          Projeto('3',_controladorCampoNome.text, _controladorCampoUrlImagem.text, "ativo");
      Navigator.pop(context, projetoCriado);
    }
  }
}
