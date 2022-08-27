import 'package:educacao_inteligente_mobile/model/nota.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/nota';

Future<List<Nota>> listnota() async {
  final response = await http.get(url);
  return notaFromJson(response.body);
}

Future<List<Nota>> listnotausuario(int id) async {
  final response = await http.get('$url/$id');
  return notaFromJson(response.body);
}

Future<List<Nota>> listnotaBimestre(int id, int bimestre, int ano) async {
  final response = await http.get('$url/$id/$bimestre/$ano');
  return notaFromJson(response.body);
}

Future<http.Response> createNota(Nota nota) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"}, body: notaToJson(nota));
  return response;
}

Future<http.Response> editNota(Nota nota) async {
  final response = await http.patch(
    '$url/${nota.idNota}',
    headers: {'content-type': 'application/json'},
    body: notaToJson(nota),
  );
  return response;
}

Future<http.Response> deleteNota(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
