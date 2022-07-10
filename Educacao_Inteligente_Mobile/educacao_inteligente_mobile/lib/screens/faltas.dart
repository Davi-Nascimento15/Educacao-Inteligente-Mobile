import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Faltas extends StatefulWidget {
  const Faltas({Key key}) : super(key: key);

  @override
  State<Faltas> createState() => _FaltasState();
}

class _FaltasState extends State<Faltas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faltas'),
        backgroundColor: Colors.purple,
      ),
      body: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime(1998),
        lastDay: DateTime(2050),
      ),
    );
  }
}
