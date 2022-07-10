import 'dart:convert';

class Falta {
  int idpresenca;
  String data;
  bool falta;
  int idaluno;

  Falta({this.idpresenca, this.data, this.falta, this.idaluno});

  //Json > Falta
  factory Falta.fromJson(Map<String, dynamic> json) {
    return Falta(
        idpresenca: json['idpresenca'],
        data: json['data'],
        falta: json['falta'],
        idaluno: json['idaluno']);
  }

  //Falta > Json
  Map<String, dynamic> toJson() {
    return {"data": data, "falta": falta, "idaluno": idaluno};
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
