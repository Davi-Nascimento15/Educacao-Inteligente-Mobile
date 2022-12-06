import 'dart:io';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/aluno.dart';
import 'package:educacao_inteligente_mobile/screens/anoletivo.dart';
import 'package:educacao_inteligente_mobile/screens/galeria/listgaleria.dart';
import 'package:educacao_inteligente_mobile/screens/login.dart';
import 'package:educacao_inteligente_mobile/screens/noticia/listnoticia.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/escolhasugestao.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  final Usuario usuario;
  const Home({Key key, this.usuario}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

// final Uri _url = Uri.parse('https://www2.educacao.mg.gov.br/');
// Future<void> _launchUrl() async {
//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    opensecretary() async {
      var urlsecretary = 'https://www2.educacao.mg.gov.br/';
      if (Platform.isAndroid) {
        if (await canLaunchUrl(Uri.parse(urlsecretary))) {
          await launch(urlsecretary,
              forceWebView: false, enableJavaScript: true);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Nenhum navegador instalado!")));
        }
      }
    }

    openwhatsapp() async {
      var whatsapp = "+5535988740169";
      var urlandroid =
          Uri.parse("whatsapp://send?phone=" + whatsapp + "&text=hello");
      if (Platform.isAndroid) {
        if (await canLaunchUrl(urlandroid)) {
          await launchUrl(urlandroid);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Whatsapp não instalado!")));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, constraints.maxHeight * 0.02, 0, 0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(constraints.maxHeight * 0.02),
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
                                height: constraints.maxHeight * 0.1,
                                width: constraints.maxWidth * 0.1,
                              ),
                              Center(
                                child: Text(
                                  '  Educação Inteligente',
                                  style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: constraints.maxHeight * 0.03,
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
                            iconSize: constraints.maxHeight * 0.04,
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
                    padding: EdgeInsets.fromLTRB(constraints.maxWidth * 0.1, 0,
                        constraints.maxWidth * 0.1, 0),
                    child: Center(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        children: [
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
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Calendário",
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              onPrimary: Colors.purple[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              openwhatsapp();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ListChat(
                              //       usuario: widget.usuario,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.chat,
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Chat",
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
                                  builder: (context) => const ListGaleria(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.photo_camera_back_rounded,
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Galeria",
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
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Aluno",
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
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Notícias",
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
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Sugestões",
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
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              onPrimary: Colors.purple[50],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {
                              //_launchUrl();
                              opensecretary();
                            },
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.web,
                                    size: constraints.maxHeight * 0.1,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Portal",
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
                  ),
                ),
                const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
              ],
            ),
          );
        }),
      ),
      bottomNavigationBar: Container(
        color: Colors.purple[200],
        child: const Text('v.1.0',
            textAlign: TextAlign.center, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
