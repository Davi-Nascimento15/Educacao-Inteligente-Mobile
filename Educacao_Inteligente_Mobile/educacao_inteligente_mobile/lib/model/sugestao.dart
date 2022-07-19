import 'dart:convert';

class Sugestao {
  String idSugestao;
  String titulo;
  String descricao;
  int curtidas;
  int usuario_idmatricula;

  Sugestao(
      {this.idSugestao,
      this.titulo,
      this.descricao,
      this.curtidas,
      this.usuario_idmatricula});

  //Json > Sugestao
  factory Sugestao.fromJson(Map<String, dynamic> json) {
    return Sugestao(
        idSugestao: json['idSugestao'],
        titulo: json['titulo'],
        descricao: json['descricao'],
        curtidas: json['curtidas'],
        usuario_idmatricula: json['usuario_idmatricula']);
  }

  //Sugestao > Json
  Map<String, dynamic> toJson() {
    return {
      "idSugestao": idSugestao,
      "titulo": titulo,
      "descricao": descricao,
      "curtidas": curtidas,
      "usuario_idmatricula": usuario_idmatricula
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
