import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @observable
  bool error = false;

  void checkUser() {
    if (_firebaseAuth.currentUser != null) {
      Modular.to.navigate("/home");
    }
  }

  @action
  Future<void> signInWithGoogle() async {
    error = false;
    // Trigger the authentication flow
    final GoogleSignInAccount? googleAccount =
        await _googleSignIn.signIn().catchError((err) {
      error = true;
    });
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleAccount!.authentication.catchError((err) {
      error = true;
    });

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential).then((value) {
      Modular.to.navigate("/home");
    }).catchError((err) {
      error = true;
    });
  }
}
