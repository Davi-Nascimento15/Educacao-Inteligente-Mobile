import 'package:educacao_inteligente_mobile/screens/home.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/createsugestao.dart';
import 'package:flutter/material.dart';

List<String> Exemplos = [
  'Compra de ventilador',
  'Segurança',
];

class MyListSugestao extends StatelessWidget {
  const MyListSugestao({Key key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Título"),
      content: const Text("Descrição:"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: const Text('Minhas Sugestões'),
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.my_library_books_outlined,
                color: Colors.purple[300]),
            title: Text(Exemplos[index]),
            trailing: Wrap(
              spacing: 12, // space between two icons
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue[400]),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateSugestao()));
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red[400]),
                  onPressed: () {},
                ),
              ],
            ),
            onTap: () {
              showAlertDialog(context);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple[400],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateSugestao()));
        },
      ),
    );
  }
}
