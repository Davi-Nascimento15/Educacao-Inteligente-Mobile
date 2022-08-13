import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/createsugestao.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
import 'package:flutter/material.dart';

class ListSugestao extends StatefulWidget {
  final Usuario usuario;
  const ListSugestao({Key key, this.usuario}) : super(key: key);

  @override
  State<ListSugestao> createState() => _ListSugestaoState();
}

class _ListSugestaoState extends State<ListSugestao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[500], title: const Text('Sugestões')),
      body: FutureBuilder(
        future: listsugestaoescola(widget.usuario.escolaID),
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
            MaterialPageRoute(
                builder: (context) => CreateSugestao(
                      usuario: widget.usuario,
                    )),
          );
          setState(() {});
        },
      ),
    );
  }
}
