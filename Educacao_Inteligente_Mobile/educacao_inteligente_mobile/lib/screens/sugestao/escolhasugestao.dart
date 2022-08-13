import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/listsugestao.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/mylistsugestao.dart';
import 'package:flutter/material.dart';

class EscolhaSugestao extends StatelessWidget {
  final Usuario usuario;
  const EscolhaSugestao({Key key, this.usuario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sugestão'),
        backgroundColor: Colors.purple[500],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 200, 20, 0),
        alignment: Alignment.center,
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
                      builder: (context) => ListSugestao(
                            usuario: usuario,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  children: const [
                    Icon(
                      Icons.list,
                      size: 90,
                      color: Colors.white,
                    ),
                    Text(
                      "Sugestões",
                      style: TextStyle(
                        fontSize: 15,
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
                      builder: (context) => MyListSugestao(usuario: usuario)),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  children: const [
                    Icon(
                      Icons.my_library_books_outlined,
                      size: 90,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Minhas Sugestões",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'Ms Madi')
                        ),
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
  }
}
