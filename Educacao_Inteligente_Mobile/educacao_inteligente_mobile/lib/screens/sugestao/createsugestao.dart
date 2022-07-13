import 'package:educacao_inteligente_mobile/screens/sugestao/mylistsugestao.dart';
import 'package:flutter/material.dart';

class CreateSugestao extends StatefulWidget {
  const CreateSugestao({Key key}) : super(key: key);

  @override
  State<CreateSugestao> createState() => _CreateSugestaoState();
}

class _CreateSugestaoState extends State<CreateSugestao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: const Text("Cadastrar Sugestão"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: "...",
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: "...",
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[400],
                onPrimary: Colors.purple[50],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyListSugestao()));
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
