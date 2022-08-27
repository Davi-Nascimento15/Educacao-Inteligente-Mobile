// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

class Nota {
  int idNota;
  int anoletivo;
  double nota;
  int bimestre;
  int aluno_idaluno;
  int disciplina_iddiciplina;

  Nota(
      {this.idNota,
      this.anoletivo,
      this.bimestre,
      this.nota,
      this.aluno_idaluno,
      this.disciplina_iddiciplina});

  //Json > Nota
  factory Nota.fromJson(Map<String, dynamic> json) {
    return Nota(
      idNota: json['idNota'],
      anoletivo: json['anoLetivo'],
      bimestre: json['bimestre'],
      nota: json['nota'],
      aluno_idaluno: json['aluno_idaluno'],
      disciplina_iddiciplina: json['disciplina_iddisciplina'],
    );
  }

  //Nota > Json
  Map<String, dynamic> toJson() {
    return {
      "idNota": idNota,
      "anoLetivo": anoletivo,
      "bimestre": bimestre,
      "nota": nota,
      "aluno_idaluno": aluno_idaluno,
      "disciplina_iddisciplina": disciplina_iddiciplina
    };
  }
}

//List Nota
List<Nota> notaFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Nota>.from(str.map((item) {
    return Nota.fromJson(item);
  }));
}

//Metodo Static > 1 Nota
String notaToJson(Nota nota) {
  final dyn = nota.toJson();
  return json.encode(dyn);
}
