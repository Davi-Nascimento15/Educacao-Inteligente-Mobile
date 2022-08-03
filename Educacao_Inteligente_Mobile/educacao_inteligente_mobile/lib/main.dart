import 'package:educacao_inteligente_mobile/model/customnotification.dart';
import 'package:educacao_inteligente_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    Provider<NotificationService>(create: (context) => NotificationService())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('pt', 'BR')],
      title: 'Educação Inteligente ',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
