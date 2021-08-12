import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pokemon/utils/texts.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        Modular.to.navigate("/home");
      }
    });
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleAccount = await googleSignIn.signIn();
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return firebaseAuth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                margin: EdgeInsets.only(bottom: 16),
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
              Container(
                width: size.width * 0.6,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red[400]),
                  child: Text("Entrar com Google"),
                  onPressed: () {
                    signInWithGoogle();
                  },
                ),
              ),
              // ElevatedButton(
              //   child: Text("Sair"),
              //   onPressed: () {
              //     firebaseAuth.signOut();
              //   },
              // )
            ],
          ),
        ));
  }
}
