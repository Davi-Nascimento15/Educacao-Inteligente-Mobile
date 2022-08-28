import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/screens/home.dart';
import 'package:educacao_inteligente_mobile/services/controllerusuario.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Usuario usuario;
  bool exibe = false;
  TextEditingController matricula = TextEditingController();
  TextEditingController senha = TextEditingController();
  List<Usuario> usuarios = [];

  bool _validacao(String matricula, String senha) {
    for (int i = 0; i < usuarios.length; i++) {
      if (usuarios[i].idmatricula == int.parse(matricula)) {
        if (usuarios[i].senha == senha) {
          usuario = usuarios[i];
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: ((context, constraints) {
          return Column(
            children: [
              FutureBuilder(
                  future: listUser(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      var response = snapshot.data as List<Usuario>;
                      for (int i = 0; i < response.length; i++) {
                        Usuario usuario = Usuario(
                            idmatricula: response[i].idmatricula,
                            nome: response[i].nome,
                            senha: response[i].senha,
                            tipo: response[i].tipo,
                            idaluno: response[i].idaluno,
                            nomeAluno: response[i].nomeAluno,
                            matriculaAluno: response[i].matriculaAluno,
                            anoAluno: response[i].anoAluno,
                            turmaidAluno: response[i].turmaidAluno,
                            turnoAluno: response[i].turnoAluno,
                            escolaID: response[i].escolaID);
                        usuarios.add(usuario);
                      }
                      return Container();
                    } else {
                      return Container();
                    }
                  }),
              Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight * .4,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Image.asset(
                      'images/home.png',
                      height: constraints.maxHeight * .40,
                      width: constraints.maxWidth * .40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .7,
                height: constraints.maxHeight * 0.1,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: matricula,
                  decoration: const InputDecoration(
                    labelText: 'Matricula',
                    hintText: '...',
                  ),
                ),
              ),
              SizedBox(
                width: constraints.maxWidth * .7,
                height: constraints.maxHeight * 0.1,
                child: TextFormField(
                  controller: senha,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: '...',
                    suffixIcon: GestureDetector(
                      child: Icon(
                          exibe == false
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.purple),
                      onTap: () {
                        setState(() {
                          exibe = !exibe;
                        });
                      },
                    ),
                  ),
                  obscureText: exibe == false ? true : false,
                ),
              ),
              Padding(padding: EdgeInsets.all(constraints.maxHeight * 0.03)),
              SizedBox(
                width: constraints.maxWidth * .4,
                height: constraints.maxHeight * .06,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                    onPrimary: Colors.purple[50],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    if (_validacao(matricula.text, senha.text)) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Home(
                            usuario: usuario,
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'matricula ou senha incorretos...',
                          style: TextStyle(fontSize: 16),
                        ),
                      ));
                    }
                  },
                  child: Text(
                    'Entrar',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: constraints.maxHeight * .03,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
