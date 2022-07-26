import 'package:educacao_inteligente_mobile/model/usuario.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

String url = 'http://localhost:3000/usuarios';

Future<List<Usuario>> listUser() async {
  final response = await http.get(url);
  return usuarioFromJson(response.body);
}

Future<List<Usuario>> listChat() async {
  final response = await http.get('$url/chat');
  return usuarioFromJsonChat(response.body);
}
