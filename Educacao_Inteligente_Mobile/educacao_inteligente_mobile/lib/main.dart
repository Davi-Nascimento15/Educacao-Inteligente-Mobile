import 'package:educacao_inteligente_mobile/screens/home.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/escolhasugestao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Educação Inteligente',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
