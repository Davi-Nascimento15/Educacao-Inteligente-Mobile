import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
import 'package:flutter/material.dart';

class CreateSugestao extends StatefulWidget {
  final Usuario usuario;
  const CreateSugestao({Key key, this.usuario}) : super(key: key);

  @override
  State<CreateSugestao> createState() => _CreateSugestaoState();
}

class _CreateSugestaoState extends State<CreateSugestao> {
  TextEditingController controllertitulo;
  TextEditingController controllerdescricao;

  //clear
  @override
  void dispose() {
    controllertitulo.dispose();
    controllerdescricao.dispose();
    super.dispose();
  }

  //gerenciar estado
  @override
  void initState() {
    super.initState();
    controllertitulo = TextEditingController();
    controllerdescricao = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: const Text("Cadastrar Sugestão"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            TextFormField(
              maxLength: 255,
              controller: controllertitulo,
              decoration: const InputDecoration(
                labelText: 'Título',
                hintText: "...",
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            TextFormField(
              maxLength: 255,
              controller: controllerdescricao,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: "...",
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[400],
                onPrimary: Colors.purple[50],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                Sugestao sugestao = Sugestao(
                  idSugestao: "1",
                  titulo: controllertitulo.text,
                  descricao: controllerdescricao.text,
                  usuario_idmatricula: widget.usuario.idmatricula,
                  escola_idEscola: widget.usuario.escolaID,
                );
                await createsugestao(sugestao);
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 10),
                child: Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
