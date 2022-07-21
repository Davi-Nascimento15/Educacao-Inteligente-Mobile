import 'dart:async';
import 'package:educacao_inteligente_mobile/model/falta.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllerfalta.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Faltas extends StatefulWidget {
  final Usuario usuario;
  int atualiza = 0;
  Faltas({Key key, this.usuario}) : super(key: key);

  @override
  State<Faltas> createState() => _FaltasState();
}

class _FaltasState extends State<Faltas> {
  Map<DateTime, List<dynamic>> faltasdia;
  List<Falta> listfalta = [];
  List<String> eventos = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarController _controller;
  Timer timer;
  @override
  void initState() {
    faltasdia = {};
    super.initState();
    _controller = CalendarController();
  }

  void timerStart() {
    timer = Timer.periodic(const Duration(milliseconds: 1), (context) {
      setState(() {
        _controller.setSelectedDay(DateTime.now());
        _controller.setFocusedDay(DateTime.now());
        timer.cancel();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void daySelected(DateTime day, List events, List holidays) {
    for (int i = 0; i < events.length; i++) {
      eventos = events;
    }
    if (events.isEmpty) {
      eventos.clear();
    }
    setState(() {
      _controller.setSelectedDay(day);
      _controller.setFocusedDay(day);
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {}

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faltas'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: listfaltaaluno(widget.usuario.idaluno),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<Falta>;
                for (int i = 0; i < response.length; i++) {
                  // ignore: unused_local_variable
                  Falta falta = Falta(
                      idPresenca: response[i].idPresenca,
                      Data: response[i].Data,
                      falta: response[i].falta,
                      aluno_idaluno: response[i].aluno_idaluno);
                  selectedDay = DateTime.parse(response[i].Data);
                  if (selectedDay != null && widget.atualiza == 0) {
                    if (faltasdia[selectedDay] == null) {
                      List<String> aux = [];
                      aux.add('Falta$i');
                      faltasdia[selectedDay] = aux;
                    } else {
                      faltasdia[selectedDay].add('Falta$i');
                    }
                  }
                }
                if (widget.atualiza == 0) {
                  timerStart();
                  widget.atualiza++;
                }
                return const Padding(padding: EdgeInsets.all(0));
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
          TableCalendar(
            locale: ('pt-BR'),
            events: faltasdia,
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
              canEventMarkersOverflow: true,
              todayColor: Colors.orange,
              selectedColor: Theme.of(context).primaryColor,
              todayStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.white),
            ),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonDecoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20.0),
              ),
              formatButtonVisible: false,
              formatButtonTextStyle: const TextStyle(color: Colors.white),
              formatButtonShowsNext: false,
            ),
            startingDayOfWeek: StartingDayOfWeek.sunday,
            onDaySelected: daySelected,
            onVisibleDaysChanged: _onVisibleDaysChanged,
            onCalendarCreated: _onCalendarCreated,
            builders: CalendarBuilders(
              selectedDayBuilder: (context, date, events) => Container(
                  margin: const EdgeInsets.all(4.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Text(
                    date.day.toString(),
                    style: const TextStyle(color: Colors.white),
                  )),
              todayDayBuilder: (context, date, events) => Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Text(
                  date.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            calendarController: _controller,
          ),
          /*Expanded(
            child: ListView.builder(
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(eventos[index]),
                );
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
