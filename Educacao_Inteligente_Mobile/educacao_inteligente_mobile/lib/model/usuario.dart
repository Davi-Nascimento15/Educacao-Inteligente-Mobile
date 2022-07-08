import 'dart:convert';

class Usuario {
  int idmatricula;
  String nome;
  String senha;
  int tipo;

  Usuario({this.idmatricula, this.nome, this.senha, this.tipo});

  //Json > Usuario
  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
        idmatricula: json['idmatricula'],
        nome: json['nome'],
        senha: json['senha'],
        tipo: json['tipo']);
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
