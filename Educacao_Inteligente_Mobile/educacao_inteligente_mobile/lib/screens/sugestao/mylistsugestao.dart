import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/createsugestao.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/editsugestao.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
import 'package:flutter/material.dart';

class MyListSugestao extends StatefulWidget {
  final Usuario usuario;
  const MyListSugestao({Key key, this.usuario}) : super(key: key);

  @override
  State<MyListSugestao> createState() => _MyListSugestaoState();
}

class _MyListSugestaoState extends State<MyListSugestao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[500],
          title: const Text('Minhas Sugestões')),
      body: FutureBuilder(
        future: listsugestaousuario(widget.usuario.idmatricula),
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
                var sugestaoItem = response[index];
                return Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: ListTile(
                    title: Text(sugestaoItem.titulo),
                    subtitle: Text(sugestaoItem.descricao),
                    trailing: Wrap(
                      spacing: 12, // space between two icons
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            Sugestao sugestao = Sugestao(
                                idSugestao: sugestaoItem.idSugestao,
                                titulo: sugestaoItem.titulo,
                                descricao: sugestaoItem.descricao,
                                curtidas: 3,
                                usuario_idmatricula:
                                    sugestaoItem.usuario_idmatricula);
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditSugestao(sugestao: sugestao),
                              ),
                            );
                            setState(() {});
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    "Atenção",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                      'Tem certeza que deseja excluir?'),
                                  actions: [
                                    TextButton(
                                      child: const Text(
                                        'Sim',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () async {
                                        await deletesugestao(
                                            sugestaoItem.idSugestao);
                                        setState(() {
                                          Navigator.pop(context);
                                        });
                                      },
                                    ),
                                    TextButton(
                                      child: const Text(
                                        'Não',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
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
                      );
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
