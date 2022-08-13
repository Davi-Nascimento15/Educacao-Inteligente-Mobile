import 'package:educacao_inteligente_mobile/model/noticia.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/noticia';

Future<List<Noticia>> listnoticia() async {
  final response = await http.get(url);
  return noticiaFromJson(response.body);
}

Future<List<Noticia>> listnoticiaescola(int id) async {
  final response = await http.get('$url/escola/$id');
  return noticiaFromJson(response.body);
}
