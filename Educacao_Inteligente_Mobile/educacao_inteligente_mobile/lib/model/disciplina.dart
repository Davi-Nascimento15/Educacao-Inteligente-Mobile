// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Disciplina {
  int iddisciplina;
  String nome;
  int escola_idEscola;

  Disciplina({
    this.iddisciplina,
    this.nome,
    this.escola_idEscola,
  });

  //Json > Disciplina
  factory Disciplina.fromJson(Map<String, dynamic> json) {
    return Disciplina(
      iddisciplina: json['iddisciplina'],
      nome: json['nome'],
      escola_idEscola: json['escola_idEscola'],
    );
  }

  //Disciplina > Json
  Map<String, dynamic> toJson() {
    return {
      "iddisciplina": iddisciplina,
      "nome": nome,
      "escola_idEscola": escola_idEscola,
    };
  }
}

//List Disciplina
List<Disciplina> disciplinaFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Disciplina>.from(str.map((item) {
    return Disciplina.fromJson(item);
  }));
}

//Metodo Static > 1 Disciplina
String notaToJson(Disciplina disciplina) {
  final dyn = disciplina.toJson();
  return json.encode(dyn);
}
