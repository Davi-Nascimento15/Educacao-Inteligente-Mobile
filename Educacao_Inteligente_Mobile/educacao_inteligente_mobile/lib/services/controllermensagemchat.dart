import 'package:educacao_inteligente_mobile/model/mensagemchat.dart';
import 'package:educacao_inteligente_mobile/services/connectapi.dart';
import 'package:http/http.dart' as http;

ConnectApi connectApi = ConnectApi();
String url = '${connectApi.connect}/mensagemchat';

Future<List<MensagemChat>> listamensagemchat() async {
  final response = await http.get(url);
  return mensagemchatFromJson(response.body);
}

Future<List<MensagemChat>> listamensagemchatusuario(
    int destinatario, int remetente) async {
  final response = await http.get('$url/$destinatario/$remetente');
  return mensagemchatFromJson(response.body);
}

Future<int> contadorMensagemRecebidas(int destinatario, int remetente) async {
  final response = await http.get('$url/count/$remetente/$destinatario');
  return count(response.body);
}

Future<http.Response> createmensagemchat(MensagemChat mensagemChat) async {
  final response = await http.post(url,
      headers: {"content-type": "application/json"},
      body: mensagemchatToJson(mensagemChat));
  return response;
}

Future<http.Response> editmensagemchat(int usuario, int destinatario) async {
  final response = await http.patch(
    '$url/$usuario/$destinatario',
    headers: {'content-type': 'application/json'},
  );
  return response;
}

Future<http.Response> deletemensagemchat(String id) async {
  final response = await http.delete('$url/$id');
  return response;
}
