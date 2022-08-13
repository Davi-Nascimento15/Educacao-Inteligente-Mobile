// ignore_for_file: non_constant_identifier_names
import 'dart:convert';

import 'package:flutter/foundation.dart';

class MensagemChat {
  int idchat;
  String conteudo;
  String data;
  String hora;
  String visualizada;
  int destinatario_idmatricula;
  int remetente_idmatricula;

  MensagemChat(
      {this.idchat,
      this.conteudo,
      this.data,
      this.hora,
      this.visualizada,
      this.destinatario_idmatricula,
      this.remetente_idmatricula});

  //Json > Falta
  factory MensagemChat.fromJson(Map<String, dynamic> json, bool aux) {
    if (aux == true) {
      return MensagemChat(
          idchat: json['idchat'],
          conteudo: json['conteudo'],
          data: json['data'],
          hora: json['hora'],
          visualizada: json['visualizada'],
          destinatario_idmatricula: json['destinatario_idmatricula'],
          remetente_idmatricula: json['remetente_idmatricula']);
    } else {
      return MensagemChat(idchat: json['visualizou']);
    }
  }

  //Falta > Json
  Map<String, dynamic> toJson() {
    return {
      "idchat": idchat,
      "conteudo": conteudo,
      "data": data,
      "hora": hora,
      "visualizada": visualizada,
      "destinatario_idmatricula": destinatario_idmatricula,
      "remetente_idmatricula": remetente_idmatricula
    };
  }
}

int count(String strJson) {
  final str = json.decode(strJson);
  var aux = List<MensagemChat>.from(str.map((item) {
    return MensagemChat.fromJson(item, false);
  }));
  return aux.first.idchat;
}

//List user
List<MensagemChat> mensagemchatFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<MensagemChat>.from(str.map((item) {
    return MensagemChat.fromJson(item, true);
  }));
}

//Metdo Static > 1 user
String mensagemchatToJson(MensagemChat mensagemChat) {
  final dyn = mensagemChat.toJson();
  return json.encode(dyn);
}
