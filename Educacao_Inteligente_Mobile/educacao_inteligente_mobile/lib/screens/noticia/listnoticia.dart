import 'package:educacao_inteligente_mobile/model/noticia.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllernoticia.dart';
import 'package:flutter/material.dart';

class ListNoticia extends StatefulWidget {
  final Usuario usuario;
  const ListNoticia({Key key, this.usuario}) : super(key: key);

  @override
  State<ListNoticia> createState() => _ListNoticiaState();
}

class _ListNoticiaState extends State<ListNoticia> {
  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.purple[500], title: const Text('Noticías')),
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        edgeOffset: 0,
        color: Colors.white,
        backgroundColor: Colors.purple,
        onRefresh: _refresh,
        child: FutureBuilder(
          future: listnoticia(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              var response = snapshot.data as List<Noticia>;
              return ListView.builder(
                itemCount: response.length,
                itemBuilder: (context, index) => response[index].render(),
              );
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
