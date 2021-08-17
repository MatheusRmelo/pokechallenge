import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokemon/app/modules/auth/auth_controller.dart';
import 'package:pokemon/utils/texts.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final controller = Modular.get<AuthController>();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    "Bem vindo ao mundo Pokémon",
                    style: tsHeading1,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(
                  "assets/pikachu_auth.png",
                  width: size.width * 0.6,
                  height: size.height * 0.4,
                ),

                SizedBox(
                  width: size.width * 0.6,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                    child: const Text("Entrar com Google"),
                    onPressed: () {
                      controller.signInWithGoogle();
                    },
                  ),
                ),
                controller.error
                    ? Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: const Text(
                          "Falha ao fazer o login, verifique sua conexão",
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : Container()
                // ElevatedButton(
                //   child: Text("Sair"),
                //   onPressed: () {
                //     firebaseAuth.signOut();
                //   },
                // )
              ],
            ),
          ));
    });
  }
}
