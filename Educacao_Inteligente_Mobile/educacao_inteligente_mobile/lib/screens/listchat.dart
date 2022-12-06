// // ignore_for_file: must_be_immutable

// import 'package:educacao_inteligente_mobile/model/usuario.dart';
// import 'package:educacao_inteligente_mobile/screens/chatscreen.dart';
// import 'package:educacao_inteligente_mobile/services/controllermensagemchat.dart';
// import 'package:educacao_inteligente_mobile/services/controllerusuario.dart';
// import 'package:flutter/material.dart';

// class ListChat extends StatefulWidget {
//   final Usuario usuario;
//   List<int> aux = [];
//   ListChat({Key key, this.usuario}) : super(key: key);

//   @override
//   State<ListChat> createState() => _ListChatState();
// }

// class _ListChatState extends State<ListChat> {
//   // ignore: non_constant_identifier_names
//   Future<void> Contar(int remetente) async {
//     widget.aux.add(
//         await contadorMensagemRecebidas(remetente, widget.usuario.idmatricula));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.purple[500], title: const Text('Chat')),
//       body: FutureBuilder(
//         future: listChat(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Center(
//               child: Text(snapshot.error.toString()),
//             );
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             var response = snapshot.data as List<Usuario>;
//             return ListView.builder(
//               itemCount: response.length,
//               itemBuilder: (context, index) {
//                 Contar(response[index].idmatricula);
//                 return ListTile(
//                   leading: const Icon(
//                     Icons.person,
//                     size: 40,
//                     color: Colors.purple,
//                   ),
//                   //trailing: widget.aux.isNotEmpty : Text("")?Text(""),
//                   title: Text(
//                     response[index].nome,
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                   onTap: () async {
//                     await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => ChatScreen(
//                             usuario: widget.usuario,
//                             destinatario: response[index]),
//                       ),
//                     );
//                     await editmensagemchat(widget.usuario.idmatricula,
//                         response[index].idmatricula);
//                   },
//                 );
//               },
//             );
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
