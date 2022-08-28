// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

class Aviso {
  int idAvisos;
  String dataEntrega;
  String dataGeracao;
  String descricao;
  String observacao;
  int disciplina_iddisciplina;
  int professor_idprofessor;
  int turma_idTurma;
  int tipoaviso;
  String professorNome;
  String disciplinaNome;
  String turmaNome;

  Aviso(
      {this.idAvisos,
      this.dataEntrega,
      this.dataGeracao,
      this.descricao,
      this.observacao,
      this.disciplina_iddisciplina,
      this.professor_idprofessor,
      this.turma_idTurma,
      this.tipoaviso,
      this.disciplinaNome,
      this.professorNome,
      this.turmaNome});

  //Json > Falta
  factory Aviso.fromJson(Map<String, dynamic> json) {
    return Aviso(
        idAvisos: json['idAvisos'],
        dataEntrega: json['dataEntrega'],
        dataGeracao: json['datageracao'],
        descricao: json['descricao'],
        observacao: json['observacao'],
        disciplina_iddisciplina: json['disciplina_iddisciplina'],
        professor_idprofessor: json['professor_idprofessor'],
        turma_idTurma: json['turma_idTurma'],
        tipoaviso: json['tipoAviso'],
        disciplinaNome: json['disciplinaNome'],
        professorNome: json['professorNome'],
        turmaNome: json['turmaNome']);
  }

  //Falta > Json
  Map<String, dynamic> toJson() {
    return {
      "idAvisos": idAvisos,
      "dataEntrega": dataEntrega,
      "dataGeracao": dataGeracao,
      "descricao": descricao,
      "observacao": observacao,
      "disciplina_iddisciplina": disciplina_iddisciplina,
      "professor_idprofessor": professor_idprofessor,
      "turma_idTurma": turma_idTurma,
      "tipoAviso": tipoaviso,
      "disciplinaNome": disciplinaNome,
      "professorNome": professorNome,
      "turmaNome": turmaNome
    };
  }
}

//List user
List<Aviso> avisoFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Aviso>.from(str.map((item) {
    return Aviso.fromJson(item);
  }));
}

//Metdo Static > 1 user
String avisoToJson(Aviso aviso) {
  final dyn = aviso.toJson();
  return json.encode(dyn);
}
