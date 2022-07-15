import 'dart:html';

import 'package:educacao_inteligente_mobile/model/falta.dart';
import 'package:educacao_inteligente_mobile/services/controllerfalta.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:intl/intl.dart';

class Faltas extends StatefulWidget {
  const Faltas({Key key}) : super(key: key);

  @override
  State<Faltas> createState() => _FaltasState();
}

class _FaltasState extends State<Faltas> {
  List<Falta> listfalta = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  dynamic FaltasMarcadas(DateTime date) {
    Map<DateTime, String> f;
    for (int i = 0; i < listfalta.length; i++) {
      f[DateTime.parse(listfalta[i].Data)] = 'falta';
    }
    return f[date];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faltas'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future: listfaltaaluno(4),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            var response = snapshot.data as List<Falta>;
            for (int i = 0; i < response.length; i++) {
              Falta falta = Falta(
                  idPresenca: response[i].idPresenca,
                  Data: response[i].Data,
                  falta: response[i].falta,
                  aluno_idaluno: response[i].aluno_idaluno);
              selectedDay = DateTime.parse(response[i].Data);
              listfalta.add(falta);
            }
            return Column(
              children: [
                TableCalendar(
                  locale: ('pt_BR'),
                  focusedDay: DateTime.parse(listfalta[0].Data),
                  firstDay: DateTime(2010),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.sunday,
                  daysOfWeekVisible: true,
                  selectedDayPredicate: (DateTime date) {
                    return isSameDay(selectedDay, date);
                  },
                  eventLoader: FaltasMarcadas,
                  calendarStyle: CalendarStyle(
                    selectedTextStyle: const TextStyle(color: Colors.white),
                    todayDecoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    defaultDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    weekendDecoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    formatButtonShowsNext: false,
                    formatButtonDecoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    formatButtonTextStyle: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
