import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/sugestao';

Future<List<Sugestao>> listsugestao() async {
  final response = await http.get(url);
  return sugestaoFromJson(response.body);
}

Future<List<Sugestao>> listsugestaousuario(int id) async {
  final response = await http.get('$url/$id');
  return sugestaoFromJson(response.body);
}

Future<http.Response> createsugestao(Sugestao sugestao) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: sugestaoToJson(sugestao));
  return response;
}

Future<http.Response> editsugestao(Sugestao sugestao) async {
  final response = await http.patch(
    '$url/${sugestao.idSugestao}',
    headers: {'content-type': 'application/json'},
    body: sugestaoToJson(sugestao),
  );
  return response;
}

Future<http.Response> deletesugestao(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
