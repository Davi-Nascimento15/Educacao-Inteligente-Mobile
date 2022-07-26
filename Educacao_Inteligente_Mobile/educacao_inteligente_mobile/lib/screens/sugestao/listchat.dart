import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/chatscreen.dart';
import 'package:educacao_inteligente_mobile/services/controllerusuario.dart';
import 'package:flutter/material.dart';

class ListChat extends StatefulWidget {
  final Usuario usuario;
  const ListChat({Key key, this.usuario}) : super(key: key);

  @override
  State<ListChat> createState() => _ListChatState();
}

class _ListChatState extends State<ListChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[500], title: const Text('Chat')),
      body: FutureBuilder(
        future: listChat(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var response = snapshot.data as List<Usuario>;
            return ListView.builder(
              itemCount: response.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                  title: Text(response[index].nome),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                            usuario: widget.usuario,
                            destinatario: response[index]),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
