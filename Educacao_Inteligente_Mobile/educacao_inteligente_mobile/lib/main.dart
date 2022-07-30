import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/home.dart';
import 'package:educacao_inteligente_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  Usuario usuario = Usuario(idmatricula: 123);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('pt', 'BR')],
      title: 'Educação Inteligente ',
      debugShowCheckedModeBanner: false,
      home: Home(usuario: usuario),
    );
  }
}
