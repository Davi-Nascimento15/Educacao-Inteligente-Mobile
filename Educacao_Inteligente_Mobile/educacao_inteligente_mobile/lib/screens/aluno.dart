import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/aviso.dart';
import 'package:educacao_inteligente_mobile/screens/faltas.dart';
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
      backgroundColor: Colors.purple[50],
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
        child: Center(
          child: ListView(
            children: [
              const Padding(padding: EdgeInsets.all(30)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white, onPrimary: Colors.purple[50]),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 40,
                        color: Colors.purple[600],
                      ),
                      const Text(
                        "Faltas",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
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
                    primary: Colors.white, onPrimary: Colors.purple[50]),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_alert,
                        size: 40,
                        color: Colors.purple[600],
                      ),
                      const Text(
                        "Avisos",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
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
                    primary: Colors.white, onPrimary: Colors.purple[50]),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.warning,
                        size: 40,
                        color: Colors.purple[600],
                      ),
                      const Text(
                        "Provas",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
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
                    primary: Colors.white, onPrimary: Colors.purple[50]),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.purple[600],
                      ),
                      const Text(
                        "Boletim",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
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
                    primary: Colors.white, onPrimary: Colors.purple[50]),
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
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.book_sharp,
                        size: 40,
                        color: Colors.purple[600],
                      ),
                      const Text(
                        "Tarefas",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.purple,
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
      ),
      bottomNavigationBar: Container(
        color: Colors.purple[400],
        child: const Text('v.1.0',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
