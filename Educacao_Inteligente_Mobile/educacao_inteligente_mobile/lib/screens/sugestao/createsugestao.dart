import 'package:educacao_inteligente_mobile/model/sugestao.dart';
import 'package:educacao_inteligente_mobile/screens/sugestao/mylistsugestao.dart';
import 'package:educacao_inteligente_mobile/services/controllersugestao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateSugestao extends StatefulWidget {
  const CreateSugestao({Key key}) : super(key: key);

  @override
  State<CreateSugestao> createState() => _CreateSugestaoState();
}

class _CreateSugestaoState extends State<CreateSugestao> {
  TextEditingController controllertitulo;
  TextEditingController controllerdescricao;
  TextEditingController controllerlike;

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
    super.initState();
    controllertitulo = TextEditingController();
    controllerdescricao = TextEditingController();
    controllerlike = TextEditingController();
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
                    idSugestao: "1",
                    titulo: controllertitulo.text,
                    descricao: controllerdescricao.text,
                    curtidas: 3,
                    usuario_idmatricula: 777);
                await createsugestao(sugestao);
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
