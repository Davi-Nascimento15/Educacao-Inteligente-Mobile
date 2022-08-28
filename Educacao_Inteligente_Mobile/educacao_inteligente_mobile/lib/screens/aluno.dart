import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/aviso.dart';
import 'package:educacao_inteligente_mobile/screens/faltas.dart';
import 'package:educacao_inteligente_mobile/screens/notascreen.dart';
import 'package:educacao_inteligente_mobile/screens/prova.dart';
import 'package:educacao_inteligente_mobile/screens/tarefa.dart';
import 'package:flutter/material.dart';

class Aluno extends StatefulWidget {
  final Usuario usuario;
  const Aluno({Key key, this.usuario}) : super(key: key);

  @override
  State<Aluno> createState() => _AlunoState();
}

class _AlunoState extends State<Aluno> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.usuario.nomeAluno),
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
          padding: EdgeInsets.fromLTRB(constraints.maxWidth * 0.1,
              constraints.maxHeight * 0.005, constraints.maxWidth * 0.1, 0),
          child: Center(
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.all(constraints.maxHeight * 0.03)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Faltas(
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          size: constraints.maxHeight * 0.06,
                          color: Colors.white,
                        ),
                        Text(
                          "Faltas",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Ms Madi')
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Avisos(
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.add_alert,
                          size: constraints.maxHeight * 0.06,
                          color: Colors.white,
                        ),
                        Text(
                          "Avisos",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Ms Madi')
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Provas(
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.warning,
                          size: constraints.maxHeight * 0.06,
                          color: Colors.white,
                        ),
                        Text(
                          "Provas",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Ms Madi')
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Boletim(
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          size: constraints.maxHeight * 0.06,
                          color: Colors.white,
                        ),
                        Text(
                          "Boletim",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Tarefas(
                          usuario: widget.usuario,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Column(
                      children: [
                        Icon(
                          Icons.book_sharp,
                          size: constraints.maxHeight * 0.06,
                          color: Colors.white,
                        ),
                        Text(
                          "Tarefas",
                          style: TextStyle(
                            fontSize: constraints.maxHeight * 0.03,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            // fontFamily: 'Ms Madi')
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      bottomNavigationBar: Container(
        color: Colors.purple[400],
        child: const Text('v.1.0',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
