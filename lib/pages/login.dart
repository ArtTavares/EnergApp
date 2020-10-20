import 'package:energapp/pages/cadastroUser.dart';
import 'package:energapp/pages/tab.dart';
import 'package:energapp/shared/button.dart';
import 'package:energapp/shared/divider.dart';
import 'package:energapp/shared/input.dart';
import 'package:energapp/shared/scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _login = TextEditingController();
  var _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return scaffold(context, 'Login', body(), isVisibleOutLogin: false);
  }

  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/veloc.png', width: 300, height: 100),
        divider(context, height: MediaQuery.of(context).size.height * 0.06),
        input(context, _login, "Email", 'email'),
        input(context, _password, "Senha", 'Senha'),
        divider(context),
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.08,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Text(
                  "Cadastrar",
                  style: TextStyle(fontSize: 11),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CadastroUsuarioPage()));
                },
              ),
              InkWell(
                child: Text(
                  "Esqueceu a senha?",
                  style: TextStyle(fontSize: 11),
                ),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CadastroUsuarioPage()));
                },
              ),
            ],
          ),
        ),
        divider(context, height: MediaQuery.of(context).size.height * 0.05),
        Center(
          child: button(
              context,
              "Entrar",
              () => {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => TabPage()))
                  }),
        ),
        divider(context),
        Center(
          child: button(
              context,
              "Entrar Sem Login",
              () => {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TabPage()))
                  }),
        )
      ],
    );
  }
}