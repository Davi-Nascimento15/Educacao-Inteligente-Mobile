import 'dart:convert';

class Usuario {
  int idmatricula;
  String nome;
  String senha;
  int tipo;
  int idaluno;
  int anoAluno;
  int matriculaAluno;
  String nomeAluno;
  int turnoAluno;
  int turmaidAluno;

  Usuario(
      {this.idmatricula,
      this.nome,
      this.senha,
      this.tipo,
      this.idaluno,
      this.anoAluno,
      this.matriculaAluno,
      this.nomeAluno,
      this.turmaidAluno,
      this.turnoAluno});

  //Json > Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        idmatricula: json['matriculaUsuario'],
        nome: json['nomeUsuario'],
        senha: json['senhaUsuario'],
        tipo: json['tipoUsuario'],
        idaluno: json['idaluno'],
        anoAluno: json['ano'],
        matriculaAluno: json['matricula'],
        nomeAluno: json['nome'],
        turnoAluno: json['turno'],
        turmaidAluno: json['turma_idTurma']);
  }

  //Usuario > Json
  Map<String, dynamic> toJson() {
    return {"nome": nome, "senha": senha, "tipo": tipo};
  }
}

//List user
List<Usuario> usuarioFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<Usuario>.from(str.map((item) {
    return Usuario.fromJson(item);
  }));
}

//Metdo Static > 1 user
String usuarioToJson(Usuario usuario) {
  final dyn = usuario.toJson();
  return json.encode(dyn);
}
