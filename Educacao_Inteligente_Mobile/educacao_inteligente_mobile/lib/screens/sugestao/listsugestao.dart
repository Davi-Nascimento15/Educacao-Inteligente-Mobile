import 'package:educacao_inteligente_mobile/screens/home.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/createsugestao.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListSugestao extends StatefulWidget {
  const ListSugestao({Key key}) : super(key: key);

  @override
  State<ListSugestao> createState() => _ListSugestaoState();
}

class _ListSugestaoState extends State<ListSugestao> {
  bool _isFavorited = true;
  int _favoriteCount = 0;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited == true) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

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
          backgroundColor: Colors.purple[500], title: const Text('Sugestões')),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: ListTile(
                  title: const Text("idmatricula (nome)"),
                  subtitle: const Text("Título"),
                  trailing: Wrap(
                    spacing: 12, // space between two icons
                    children: [
                      Text('$_favoriteCount'),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        alignment: Alignment.centerRight,
                        icon: (_isFavorited
                            ? const Icon(Icons.star) //? = IF
                            : const Icon(Icons.star_border)), //: ELSE
                        color: Colors.red,
                        onPressed: () {
                          _toggleFavorite();
                        },
                      ),
                    ],
                  ),
                  onTap: () {
                    showAlertDialog(context);
                  } //alert dialog,
                  ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple[400],
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateSugestao()),
          );
        },
      ),
    );
  }
}
