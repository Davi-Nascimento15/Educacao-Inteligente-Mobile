import 'dart:async';
import 'package:educacao_inteligente_mobile/model/aviso.dart';
import 'package:educacao_inteligente_mobile/model/falta.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controlleraviso.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Avisos extends StatefulWidget {
  final Usuario usuario;
  int atualiza = 0;
  Avisos({Key key, this.usuario}) : super(key: key);

  @override
  State<Avisos> createState() => _AvisosState();
}

class _AvisosState extends State<Avisos> {
  Map<DateTime, List<dynamic>> avisosdia;
  List<Falta> listavisos = [];
  List<Aviso> eventos = [];
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarController _controller;
  Timer timer;
  @override
  void initState() {
    avisosdia = {};
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
      eventos.add(events[i]);
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
        title: const Text('Avisos'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: listavisoturma(widget.usuario.turmaidAluno),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.connectionState == ConnectionState.done) {
                var response = snapshot.data as List<Aviso>;
                for (int i = 0; i < response.length; i++) {
                  if (response[i].tipoaviso == 2) {
                    // ignore: unused_local_variable
                    Aviso aviso = Aviso(
                        idAvisos: response[i].idAvisos,
                        dataEntrega: response[i].dataEntrega,
                        dataGeracao: response[i].dataGeracao,
                        descricao: response[i].descricao,
                        professor_idprofessor:
                            response[i].professor_idprofessor,
                        disciplina_iddisciplina:
                            response[i].disciplina_iddisciplina,
                        turma_idTurma: response[i].turma_idTurma,
                        tipoaviso: response[i].tipoaviso,
                        disciplinaNome: response[i].disciplinaNome,
                        professorNome: response[i].professorNome,
                        turmaNome: response[i].turmaNome,
                        observacao: response[i].observacao);
                    selectedDay = DateTime.parse(response[i].dataEntrega);
                    if (selectedDay != null && widget.atualiza == 0) {
                      if (avisosdia[selectedDay] == null) {
                        List<Aviso> aux = [];
                        aux.add(aviso);
                        avisosdia[selectedDay] = aux;
                      } else {
                        avisosdia[selectedDay].add(aviso);
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
            events: avisosdia,
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
          if (eventos.isNotEmpty) ...[
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Detalhes",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ],
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              return ListView.builder(
                itemCount: eventos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: const Text(
                      'Atenção',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    subtitle: Text(
                      eventos[index].dataEntrega,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                    leading: const Icon(
                      Icons.add_alert,
                      size: 40,
                      color: Colors.red,
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            title: Text(
                              eventos[index].descricao,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                            content: SizedBox(
                              width: constraints.maxWidth * 0.95,
                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.purple[500],
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                        ),
                                        child: const Text(
                                          "Disciplina ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            constraints.maxHeight * 0.02),
                                      ),
                                      Text(
                                        eventos[index].disciplinaNome,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            constraints.maxHeight * 0.02),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.purple[500],
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                        ),
                                        child: const Text(
                                          "Professor ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            constraints.maxHeight * 0.02),
                                      ),
                                      Text(
                                        eventos[index].professorNome,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            constraints.maxHeight * 0.02),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Colors.purple[500],
                                          borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            topLeft: Radius.circular(15.0),
                                            bottomLeft: Radius.circular(15.0),
                                            bottomRight: Radius.circular(15.0),
                                          ),
                                        ),
                                        child: const Text(
                                          "Observações ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            constraints.maxHeight * 0.02),
                                      ),
                                      Text(
                                        eventos[index].observacao,
                                        textAlign: TextAlign.justify,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text(
                                  'Voltar',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
