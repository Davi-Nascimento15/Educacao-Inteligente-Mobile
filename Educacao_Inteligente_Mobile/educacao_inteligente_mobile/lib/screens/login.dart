import 'package:educacao_inteligente_mobile/model/usuario.dart';
import 'package:educacao_inteligente_mobile/services/controllerusuario.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool exibe = false;
  TextEditingController matricula = TextEditingController();
  TextEditingController senha = TextEditingController();
  List<Usuario> usuarios = [];

  bool _validacao(String matricula, String senha) {
    for (int i = 0; i < usuarios.length; i++) {
      if (usuarios[i].idmatricula == int.parse(matricula)) {
        if (usuarios[i].senha == senha) {
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
      body: FutureBuilder(
          future: listUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              var response = snapshot.data as List<Usuario>;
              for (int i = 0; i < response.length; i++) {
                Usuario usuario = Usuario(
                    idmatricula: response[i].idmatricula,
                    nome: response[i].nome,
                    senha: response[i].senha,
                    tipo: response[i].tipo);
                usuarios.add(usuario);
              }
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(50),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'images/logo.jpg',
                      height: 150,
                      width: 300,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
                    child: TextFormField(
                      controller: matricula,
                      decoration: const InputDecoration(
                        labelText: 'Matricula',
                        hintText: '...',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(80, 10, 80, 50),
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
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      onPrimary: Colors.pink[50],
                    ),
                    onPressed: () {
                      if (_validacao(matricula.text, senha.text)) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'matricula ou senha incorretos...',
                            style: TextStyle(fontSize: 16),
                          ),
                        ));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Entrar',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
    );
  }
}
