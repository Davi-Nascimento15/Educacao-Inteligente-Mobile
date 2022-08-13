import 'package:educacao_inteligente_mobile/model/aviso.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/avisos';

Future<List<Aviso>> listavisos() async {
  final response = await http.get(url);
  return avisoFromJson(response.body);
}

Future<List<Aviso>> listavisoturma(int id) async {
  final response = await http.get('$url/$id');
  return avisoFromJson(response.body);
}

Future<http.Response> createaviso(Aviso aviso) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"}, body: avisoToJson(aviso));
  return response;
}

Future<http.Response> editaviso(Aviso aviso) async {
  final response = await http.put(
    '$url/${aviso.idAvisos}',
    headers: {'content-type': 'application/json'},
    body: avisoToJson(aviso),
  );
  return response;
}

Future<http.Response> deleteaviso(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
