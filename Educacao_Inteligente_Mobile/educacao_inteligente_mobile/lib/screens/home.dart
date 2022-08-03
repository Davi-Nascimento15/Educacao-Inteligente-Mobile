import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/aluno.dart';
import 'package:educacao_inteligente_mobile/screens/anoletivo.dart';
import 'package:educacao_inteligente_mobile/screens/login.dart';
import 'package:educacao_inteligente_mobile/screens/noticia/listnoticia.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/escolhasugestao.dart';
import 'package:educacao_inteligente_mobile/screens/listchat.dart';
import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final Usuario usuario;
  const Home({Key key, this.usuario}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

/*abrirUrl() async {
  const url = 'http://www.alfenas.mg.gov.br/category/noticias/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}*/

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'images/home.png',
                            height: 50,
                            width: 50,
                          ),
                          const Center(
                            child: Text(
                              '  Educação Inteligente',
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.power_settings_new_rounded),
                        color: Colors.purple[400],
                        iconSize: 30,
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
                child: Center(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AnoLetivo(
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.calendar_today_rounded,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Calendário",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListChat(
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.chat,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Chat",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.photo_camera_back_rounded,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Galeria",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Aluno(
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.person,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Aluno",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ListNoticia(
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.feed,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Notícias",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EscolhaSugestao(
                                usuario: widget.usuario,
                              ),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.question_answer,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Sugestões",
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.purple[50]),
                        onPressed: () {
                          //abrirUrl();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                          child: Column(
                            children: [
                              Icon(
                                Icons.web,
                                size: 90,
                                color: Colors.purple[600],
                              ),
                              const Text(
                                "Portal",
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
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.purple[200],
        child: const Text('v.1.0',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
