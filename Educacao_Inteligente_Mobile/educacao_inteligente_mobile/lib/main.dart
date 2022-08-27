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

/* 
  int i = 0;
  Timer timer;
  void timerStart(var context) {
    timer = Timer.periodic(const Duration(seconds: 5), (context) {});
    Provider.of<NotificationService>(context, listen: false)
        .showLocalNotification(
      CustomNotification(
        id: i,
        title: "teste",
        body: "teste",
        payload: "/",
      ),
    );
    i++;
  }
*/
  @override
  Widget build(BuildContext context) {
    //timerStart(context);
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
