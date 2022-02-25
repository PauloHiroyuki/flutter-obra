import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:obra/components/menu_principal.dart';
import 'package:obra/models/projeto.dart';

const _tituloAppBar = 'Projetos';

class ListaProjetos extends StatefulWidget {
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
    return ListaProjetosState();
  }
}

class ListaProjetosState extends State<ListaProjetos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Nome',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Situação',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: const <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Sarah')),
              DataCell(Text('19')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Janine')),
              DataCell(Text('43')),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('William')),
              DataCell(Text('27')),
            ],
          ),
        ],
      ),
      bottomNavigationBar: MenuPrincipal(),
    );
  }

  void _atualiza(Projeto projeto) {
    if (projeto != null) {
      setState(() {
        widget._projetos.add(projeto);
      });
    }
  }
}
