// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Sugestao {
  String idSugestao;
  String titulo;
  String descricao;
  int usuario_idmatricula;
  int escola_idEscola;

  Sugestao(
      {this.idSugestao,
      this.titulo,
      this.descricao,
      this.usuario_idmatricula,
      this.escola_idEscola});

  //Json > Sugestao
  factory Sugestao.fromJson(Map<String, dynamic> json) {
    return Sugestao(
      idSugestao: json['idSugestao'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      usuario_idmatricula: json['usuario_idmatricula'],
      escola_idEscola: json['escola_idEscola'],
    );
  }

  //Sugestao > Json
  Map<String, dynamic> toJson() {
    return {
      "idSugestao": idSugestao,
      "titulo": titulo,
      "descricao": descricao,
      "usuario_idmatricula": usuario_idmatricula,
      "escola_idEscola": escola_idEscola
    };
  }
}

//List sugestao
List<Sugestao> sugestaoFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Sugestao>.from(str.map((item) {
    return Sugestao.fromJson(item);
  }));
}

//Metodo Static > 1 sugestao
String sugestaoToJson(Sugestao sugestao) {
  final dyn = sugestao.toJson();
  return json.encode(dyn);
}
