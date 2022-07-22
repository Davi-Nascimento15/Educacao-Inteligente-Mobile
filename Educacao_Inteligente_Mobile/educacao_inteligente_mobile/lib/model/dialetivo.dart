import 'dart:convert';

class DiaLetivo {
  int id;
  int ano;
  String data;
  int tipo;

  DiaLetivo({this.id, this.ano, this.data, this.tipo});

  //Json > Falta
  factory DiaLetivo.fromJson(Map<String, dynamic> json) {
    return DiaLetivo(
        id: json['id'],
        ano: json['ano'],
        data: json['data'],
        tipo: json['tipo']);
  }

  //Falta > Json
  Map<String, dynamic> toJson() {
    return {"id": id, "ano": ano, "data": data, "tipo": tipo};
  }
}

//List
List<DiaLetivo> diaLetivoFromJson(String strJson) {
  final str = json.decode(strJson);
  return List<DiaLetivo>.from(str.map((item) {
    return DiaLetivo.fromJson(item);
  }));
}

//Metdo Static > 1 dialetivo
String diaLetivoToJson(DiaLetivo diaLetivo) {
  final dyn = diaLetivo.toJson();
  return json.encode(dyn);
}
