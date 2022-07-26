import 'dart:convert';
import 'package:flutter/material.dart';

class Noticia {
  int idNoticia;
  String titulo;
  String descricao;
  String dataGeracao;

  Noticia({
    this.idNoticia,
    this.titulo,
    this.descricao,
    this.dataGeracao,
  });

  @override
  Widget render() {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: renderContent());
  }

  @override
  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(titulo),
        ),
        renderContent2()
      ],
    );
  }

  @override
  Widget renderContent2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(descricao),
        ),
        renderBottom(),
      ],
    );
  }

  @override
  Widget renderBottom() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Enviado em ${(dataGeracao)}'),
        ),
      ],
    );
  }

  //Json > Noticia
  factory Noticia.fromJson(Map<String, dynamic> json) {
    return Noticia(
      idNoticia: json['idNoticia'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      dataGeracao: json['dataGeracao'],
    );
  }

  //Noticia > Json
  Map<String, dynamic> toJson() {
    return {
      "idNoticia": idNoticia,
      "titulo": titulo,
      "descricao": descricao,
      "dataGeracao": dataGeracao,
    };
  }
}

//List noticia
List<Noticia> noticiaFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Noticia>.from(str.map((item) {
    return Noticia.fromJson(item);
  }));
}

//Metodo Static > 1 noticia
String noticiaToJson(Noticia noticia) {
  final dyn = noticia.toJson();
  return json.encode(dyn);
}