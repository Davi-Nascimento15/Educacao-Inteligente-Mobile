// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:flutter/material.dart';

class Noticia {
  int idNoticia;
  String titulo;
  String descricao;
  String dataGeracao;
  int escola_idEscola;

  Noticia(
      {this.idNoticia,
      this.titulo,
      this.descricao,
      this.dataGeracao,
      this.escola_idEscola});

  Widget render() {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: renderContent());
  }

  Widget renderContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            titulo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        renderContent2()
      ],
    );
  }

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
      escola_idEscola: json['escola_idEscola'],
    );
  }

  //Noticia > Json
  Map<String, dynamic> toJson() {
    return {
      "idNoticia": idNoticia,
      "titulo": titulo,
      "descricao": descricao,
      "dataGeracao": dataGeracao,
      "escola_idEscola": escola_idEscola
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
