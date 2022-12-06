// // ignore_for_file: must_be_immutable

// import 'dart:async';
// import 'package:educacao_inteligente_mobile/model/mensagemchat.dart';
// import 'package:educacao_inteligente_mobile/model/usuario.dart';
// import 'package:educacao_inteligente_mobile/services/controllermensagemchat.dart';
// import 'package:flutter/material.dart';

// class ChatScreen extends StatefulWidget {
//   final Usuario usuario;
//   final Usuario destinatario;
//   const ChatScreen({Key key, this.usuario, this.destinatario})
//       : super(key: key);

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController mensagem = TextEditingController();
//   ScrollController controller = ScrollController();
//   List<MensagemChat> listMensagemChat = [];
//   Timer timer;

//   @override
//   void initState() {
//     timerStart();
//     super.initState();
//   }

//   void timerStart() {
//     timer = Timer.periodic(const Duration(seconds: 2), (context) {
//       setState(() {});
//     });
//   }

//   void visualiza(MensagemChat mensagemChat) async {}

//   void enviarmensagem(String mensagem) async {
//     MensagemChat mensagemChat = MensagemChat(
//         conteudo: mensagem,
//         data: DateTime.now().toString(),
//         hora: '${DateTime.now().hour.toString()}:${DateTime.now().minute}',
//         visualizada: "0",
//         destinatario_idmatricula: widget.destinatario.idmatricula,
//         remetente_idmatricula: widget.usuario.idmatricula);
//     listMensagemChat.add(mensagemChat);
//     await createmensagemchat(mensagemChat);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           backgroundColor: Colors.purple[500],
//           title: Row(
//             children: [
//               const Icon(Icons.person),
//               const Padding(padding: EdgeInsets.fromLTRB(5, 0, 5, 0)),
//               Text(widget.destinatario.nome)
//             ],
//           )),
//       body: Column(
//         children: [
//           FutureBuilder(
//             future: listamensagemchatusuario(
//                 widget.usuario.idmatricula, widget.destinatario.idmatricula),
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 return Center(
//                   child: Text(snapshot.error.toString()),
//                 );
//               } else if (snapshot.connectionState == ConnectionState.done) {
//                 var response = snapshot.data as List<MensagemChat>;
//                 listMensagemChat = response;
//                 return Container();
//               } else {
//                 return Container();
//               }
//             },
//           ),
//           if (listMensagemChat.isNotEmpty) ...[
//             FutureBuilder(builder: (context, snapshot) {
//               controller.jumpTo(controller.position.maxScrollExtent);
//               return Container();
//             }),
//           ],
//           Expanded(
//             child: ListView.builder(
//               controller: controller,
//               reverse: false,
//               itemCount: listMensagemChat.length,
//               itemBuilder: (context, index) {
//                 return message(
//                     listMensagemChat[index],
//                     widget.usuario.idmatricula,
//                     widget.destinatario.idmatricula);
//               },
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0),
//             height: 70.0,
//             color: Colors.white,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     onTap: () {
//                       controller.jumpTo(controller.position.maxScrollExtent);
//                     },
//                     controller: mensagem,
//                     decoration: const InputDecoration(
//                         hintText: "Escreva a mensagem..."),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       enviarmensagem(mensagem.text);
//                       mensagem.text = "";
//                       setState(() {});
//                     },
//                     icon: const Icon(Icons.send, color: Colors.purple))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Widget message(MensagemChat mensagemChat, int remetente, int destinatario) {
//   if (mensagemChat.destinatario_idmatricula == destinatario) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       margin:
//           const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 80.0, right: 8.0),
//       child: Column(children: [
//         Row(children: [
//           const Icon(Icons.person),
//           const Padding(padding: EdgeInsets.fromLTRB(0, 0, 10, 0)),
//           Text(mensagemChat.conteudo),
//         ]),
//         Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//           Text(mensagemChat.hora),
//         ]),
//       ]),
//       decoration: BoxDecoration(
//         color: Colors.purple[300],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(15.0),
//           bottomLeft: Radius.circular(15.0),
//         ),
//       ),
//     );
//   } else {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       margin:
//           const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 8.0, right: 80.0),
//       child: Column(children: [
//         Row(children: [
//           Text(mensagemChat.conteudo),
//         ]),
//         Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//           Text(mensagemChat.hora),
//         ]),
//       ]),
//       decoration: BoxDecoration(
//         color: Colors.purple[100],
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(15.0),
//           bottomRight: Radius.circular(15.0),
//         ),
//       ),
//     );
//   }
// }
