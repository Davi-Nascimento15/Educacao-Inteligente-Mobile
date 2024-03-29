import 'package:educacao_inteligente_mobile/model/falta.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/faltas';

Future<List<Falta>> listfalta() async {
  final response = await http.get(url);
  return faltaFromJson(response.body);
}

Future<List<Falta>> listfaltaaluno(int id) async {
  final response = await http.get('$url/$id');
  return faltaFromJson(response.body);
}

Future<http.Response> createfalta(Falta falta) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"}, body: faltaToJson(falta));
  return response;
}

Future<http.Response> editfalta(Falta falta) async {
  final response = await http.put(
    '$url/${falta.idPresenca}',
    headers: {'content-type': 'application/json'},
    body: faltaToJson(falta),
  );
  return response;
}

Future<http.Response> deletefalta(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
