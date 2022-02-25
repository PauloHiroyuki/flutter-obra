import 'package:flutter/material.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/models/projeto.dart';
import 'package:obra/screens/projeto/formulario_projeto.dart';
import 'package:obra/screens/projeto/item_projeto.dart';
import 'package:obra/screens/projeto/lista_projetos.dart';

const _tituloAppBar = 'Projetos Ativos';

class Home extends StatefulWidget {
  final List<Projeto> _projetos = [
    Projeto(
      '1',
      'AR 13',
      'https://images.adsttc.com/media/images/5f90/e509/63c0/1779/0100/010e/slideshow/3.jpg?1603331288',
      'ativo',
    ),
    Projeto(
      '2',
      'Qd 2',
      'https://upload.wikimedia.org/wikipedia/commons/c/c9/Ranch_style_home_in_Salinas%2C_California.JPG',
      'ativo',
    ),
  ];

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: widget._projetos.length,
          itemBuilder: (context, indice) {
            final projeto = widget._projetos[indice];
            return ItemProjeto(projeto);
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioProjeto();
          })).then(
            (projeto) => _atualiza(projeto),
          );
        },
      ),
      bottomNavigationBar: MenuPrincipal(),
    );
  }

  void _onItemTapped(int index) {
    // setState(() {
    //   _selectedIndex = index;
    // });
    if (index == 2) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ListaProjetos();
      }));
    }
  }

  void _atualiza(Projeto projeto) {
    if (projeto != null) {
      setState(() {
        widget._projetos.add(projeto);
      });
    }
  }
}
