import 'package:educacao_inteligente_mobile/model/mensagemchat.dart';
import 'package:http/http.dart' as http;

String url = 'http://localhost:3000/mensagemchat';

Future<List<MensagemChat>> listamensagemchat() async {
  final response = await http.get(url);
  return mensagemchatFromJson(response.body);
}

Future<List<MensagemChat>> listamensagemchatusuario(
    int destinatario, int remetente) async {
  final response = await http.get('$url/$destinatario/$remetente');
  return mensagemchatFromJson(response.body);
}

Future<http.Response> createmensagemchat(MensagemChat mensagemChat) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: mensagemchatToJson(mensagemChat));
  return response;
}

Future<http.Response> editmensagemchat(MensagemChat mensagemChat) async {
  final response = await http.put(
    '$url/${mensagemChat.idchat}',
    headers: {'content-type': 'application/json'},
    body: mensagemchatToJson(mensagemChat),
  );
  return response;
}

Future<http.Response> deletemensagemchat(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
