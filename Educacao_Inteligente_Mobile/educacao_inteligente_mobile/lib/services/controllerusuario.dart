import 'package:educacao_inteligente_mobile/model/usuario.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:http/http.dart' as http;

String url = 'http://localhost:3000/usuarios';

Future<List<Usuario>> listUser() async {
  final response = await http.get(url);
  return usuarioFromJson(response.body);
}

//Future<Usuario> findusuario(int id) async {
  //final response = await http.get('$url/$id');
  //Usuario usuario = Usuario.fromJson(response.body);
  //return usuario;
//}
