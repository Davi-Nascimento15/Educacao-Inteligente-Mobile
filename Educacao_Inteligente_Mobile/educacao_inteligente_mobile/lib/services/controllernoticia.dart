import 'package:educacao_inteligente_mobile/model/noticia.dart';
import 'package:http/http.dart' as http;

String url = 'http://localhost:3000/noticia';

Future<List<Noticia>> listnoticia() async {
  final response = await http.get(url);
  return noticiaFromJson(response.body);
}
