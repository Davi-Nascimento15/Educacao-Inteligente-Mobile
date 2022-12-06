import 'package:educacao_inteligente_mobile/model/disciplina.dart';
import 'package:educacao_inteligente_mobile/model/nota.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllerdisciplina.dart';
import 'package:educacao_inteligente_mobile/services/controllernota.dart';
import 'package:flutter/material.dart';

class Boletim extends StatefulWidget {
  final Usuario usuario;
  const Boletim({Key key, this.usuario}) : super(key: key);
  @override
  State<Boletim> createState() => _BoletimState();
}

class _BoletimState extends State<Boletim> {
  bool troca = true;
  // ignore: prefer_typing_uninitialized_variables
  var bimestreselected;
  List<Disciplina> disciplinas = [];

  @override
  Widget build(BuildContext context) {
    //List<DropdownMenuItem> anos = [];
    int anoatual = DateTime.now().year;

    List<String> bimestres = [
      "1º Bimestre",
      "2º Bimestre",
      "3º Bimestre",
      "4º Bimestre"
    ];

    if (troca == true) {
      //anoselected = anoatual;
      bimestreselected = 0;
    }
/*
    for (int i = 2010; i <= anoatual; i++) {
      anos.add(
        DropdownMenuItem(
          child: Text(i.toString()),
          value: i,
        ),
      );
    }
*/

    List<DropdownMenuItem> bimestre = [];
    for (int i = 0; i < bimestres.length; i++) {
      bimestre.add(
        DropdownMenuItem(
          child: Text(bimestres[i]),
          value: i,
        ),
      );
    }

    DataCell encontranota(List<Nota> aux, Disciplina disciplina) {
      DataCell data = const DataCell(
        Text(
          '---',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      );
      for (int k = 0; k < aux.length; k++) {
        if (aux[k].disciplina_iddiciplina == disciplina.iddisciplina) {
          data = DataCell(
            Text(
              double.parse(aux[k].nota.toString()).toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20),
            ),
          );
        }
      }
      return data;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.usuario.nomeAluno,
          style: const TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DropdownButton<dynamic>(
                  items: bimestre,
                  onChanged: (bimestresValue) {
                    setState(() {
                      bimestreselected = bimestresValue;
                    });
                  },
                  value: bimestreselected,
                  dropdownColor: Colors.purple[100],
                  isExpanded: false,
                  style: const TextStyle(fontSize: 25, color: Colors.black),
                ),
              ),
            ],
          ),
          if (troca == true) ...[
            FutureBuilder(
              future: listdisciplinausuario(widget.usuario.idaluno),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  disciplinas = snapshot.data as List<Disciplina>;
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ],
          const Padding(
            padding: EdgeInsets.all(30),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: ListView(
                children: [
                  FutureBuilder(
                    future: listnotaBimestre(
                        widget.usuario.idaluno, bimestreselected, anoatual),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        List<DataRow> dados = [];
                        var response = snapshot.data as List<Nota>;
                        for (int i = 0; i < disciplinas.length; i++) {
                          dados.add(
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    disciplinas[i].nome,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ),
                                encontranota(response, disciplinas[i]),
                              ],
                            ),
                          );
                        }
                        troca = false;
                        return DataTable(
                          headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Colors.purple),
                          columnSpacing: 50,
                          columns: const [
                            DataColumn(
                              label: Center(
                                  child: Text("Disciplina",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20))),
                            ),
                            DataColumn(
                                label: Center(
                                    child: Text('Nota',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20)))),
                          ],
                          rows: [
                            for (int j = 0; j < dados.length; j++) ...[
                              dados[j],
                            ],
                          ],
                        );
                      } else {
                        return const Center();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
