import 'dart:async';
import 'package:educacao_inteligente_mobile/model/dialetivo.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllerdialetivo.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class AnoLetivo extends StatefulWidget {
  final Usuario usuario;
  int atualiza = 0;
  AnoLetivo({Key key, this.usuario}) : super(key: key);

  @override
  State<AnoLetivo> createState() => _AnoLetivoState();
}

class _AnoLetivoState extends State<AnoLetivo> {
  Map<DateTime, List<dynamic>> diasLetivos;
  Map<DateTime, List<dynamic>> feriados;
  List<DiaLetivo> lista = [];
  List<String> dias = [];
  List<String> feriado = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarController _controller;
  Timer timer;
  @override
  void initState() {
    diasLetivos = {};
    feriados = {};
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
      dias = events;
    }
    if (events.isEmpty) {
      dias.clear();
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
        title: const Text('Ano Letivo'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: listadialetivoescola(widget.usuario.escolaID),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<DiaLetivo>;
                for (int i = 0; i < response.length; i++) {
                  // ignore: unused_local_variable
                  DiaLetivo diaLetivo = DiaLetivo(
                      id: response[i].id,
                      ano: response[i].ano,
                      data: response[i].data,
                      tipo: response[i].tipo);
                  selectedDay = DateTime.parse(response[i].data);
                  if (selectedDay != null && widget.atualiza == 0) {
                    if (diaLetivo.tipo != 2 &&
                        diaLetivo.tipo != 3 &&
                        diaLetivo.tipo != 1) {
                      if (diasLetivos[selectedDay] == null) {
                        List<String> aux = [];
                        aux.add('diaLetivo');
                        diasLetivos[selectedDay] = aux;
                      } else {
                        diasLetivos[selectedDay].add('diaLetivo');
                      }
                    } else if (diaLetivo.tipo == 1) {
                      if (feriados[selectedDay] == null) {
                        List<String> aux = [];
                        aux.add('feriado');
                        feriados[selectedDay] = aux;
                      } else {
                        feriados[selectedDay].add('feriado');
                      }
                    }
                  }
                }
                if (widget.atualiza == 0) {
                  timerStart();
                  widget.atualiza++;
                }
                return const Padding(padding: EdgeInsets.all(0));
              } else {
                return Container();
              }
            },
          ),
          TableCalendar(
            locale: ('pt-BR'),
            events: diasLetivos,
            holidays: feriados,
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
        ],
      ),
    );
  }
}
