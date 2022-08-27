import 'package:educacao_inteligente_mobile/model/disciplina.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/disciplina';

Future<List<Disciplina>> listdisciplinausuario(int id) async {
  final response = await http.get('$url/$id');
  return disciplinaFromJson(response.body);
}
