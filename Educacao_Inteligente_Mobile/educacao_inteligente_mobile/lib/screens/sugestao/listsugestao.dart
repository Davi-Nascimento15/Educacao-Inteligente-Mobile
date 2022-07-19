import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/createsugestao.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[500], title: const Text('Sugestões')),
      body: FutureBuilder(
        future: listsugestao(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var response = snapshot.data as List<Sugestao>;
            return ListView.builder(
              itemCount: response.length,
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
                    title: Text(response[index].usuario_idmatricula.toString()),
                    subtitle: Text(response[index].titulo),
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
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(response[index].titulo),
                            content: Text(response[index].descricao),
                            actions: [
                              TextButton(
                                child: const Text("OK"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      ); //alert dialog,
                    },
                  ),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.purple[400],
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreateSugestao()),
          );
          setState(() {});
        },
      ),
    );
  }
}
