import 'package:educacao_inteligente_mobile/screens/sugestao/listsugestao.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/mylistsugestao.dart';
import 'package:flutter/material.dart';

class EscolhaSugestao extends StatelessWidget {
  const EscolhaSugestao({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      appBar: AppBar(
        title: const Text('Sugestão'),
        backgroundColor: Colors.purple[500],
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(60, 200, 60, 0),
        alignment: Alignment.center,
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, onPrimary: Colors.purple[50]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListSugestao()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.list,
                      size: 100,
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
                  primary: Colors.white, onPrimary: Colors.purple[50]),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyListSugestao()),
                );
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Column(
                  children: [
                    Icon(
                      Icons.my_library_books_outlined,
                      size: 100,
                      color: Colors.purple[600],
                    ),
                    const Text(
                      "Minhas Sugestões",
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
    );
  }
}
