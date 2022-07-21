import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
import 'package:flutter/material.dart';

class EditSugestao extends StatefulWidget {
  final Usuario usuario;
  final Sugestao sugestao;
  const EditSugestao({Key key, this.sugestao, this.usuario}) : super(key: key);

  @override
  State<EditSugestao> createState() => _EditSugestaoState();
}

class _EditSugestaoState extends State<EditSugestao> {
  TextEditingController controllertitulo = TextEditingController();
  TextEditingController controllerdescricao = TextEditingController();
  TextEditingController controllerlike = TextEditingController();

  //clear
  @override
  void dispose() {
    controllertitulo.dispose();
    controllerdescricao.dispose();
    controllerlike.dispose();
    super.dispose();
  }

  //gerenciar estado
  @override
  void initState() {
    controllertitulo.text = widget.sugestao.titulo;
    controllerdescricao.text = widget.sugestao.descricao;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.purple[500],
        title: const Text("Editar Sugestão"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(60, 20, 60, 0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            ),
            TextFormField(
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
              controller: controllerdescricao,
              decoration: const InputDecoration(
                labelText: 'Descrição',
                hintText: "...",
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 60, 0, 0),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[400],
                onPrimary: Colors.purple[50],
              ),
              onPressed: () async {
                Sugestao sugestao = Sugestao(
                    idSugestao: widget.sugestao.idSugestao,
                    titulo: controllertitulo.text,
                    descricao: controllerdescricao.text,
                    curtidas: 3,
                    usuario_idmatricula: widget.sugestao.usuario_idmatricula);
                await editsugestao(sugestao);
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Salvar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
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
