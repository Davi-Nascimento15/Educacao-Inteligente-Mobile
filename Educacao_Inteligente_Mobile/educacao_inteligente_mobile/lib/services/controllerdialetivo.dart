import 'package:educacao_inteligente_mobile/model/dialetivo.dart';
import 'package:http/http.dart' as http;

String url = 'http://192.168.100.251:3000/dialetivo';

Future<List<DiaLetivo>> listdialetivo() async {
  final response = await http.get(url);
  return diaLetivoFromJson(response.body);
}

Future<List<DiaLetivo>> listadialetivoescola(int id) async {
  final response = await http.get('$url/$id');
  return diaLetivoFromJson(response.body);
}

Future<http.Response> createdialetivo(DiaLetivo diaLetivo) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: diaLetivoToJson(diaLetivo));
  return response;
}

Future<http.Response> editdialetivo(DiaLetivo diaLetivo) async {
  final response = await http.put(
    '$url/${diaLetivo.id}',
    headers: {'content-type': 'application/json'},
    body: diaLetivoToJson(diaLetivo),
  );
  return response;
}

Future<http.Response> deletediaLetivo(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
