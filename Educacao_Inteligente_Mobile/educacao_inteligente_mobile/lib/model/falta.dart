// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Falta {
  int idPresenca;
  String Data;
  String falta;
  int aluno_idaluno;

  Falta({this.idPresenca, this.Data, this.falta, this.aluno_idaluno});

  //Json > Falta
  factory Falta.fromJson(Map<String, dynamic> json) {
    return Falta(
        idPresenca: json['idPresenca'],
        Data: json['Data'],
        falta: json['falta'],
        aluno_idaluno: json['aluno_idaluno']);
  }

  //Falta > Json
  Map<String, dynamic> toJson() {
    return {"Data": Data, "falta": falta, "aluno_idaluno": aluno_idaluno};
  }
}

//List user
List<Falta> faltaFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Falta>.from(str.map((item) {
    return Falta.fromJson(item);
  }));
}

//Metdo Static > 1 user
String faltaToJson(Falta falta) {
  final dyn = falta.toJson();
  return json.encode(dyn);
}
