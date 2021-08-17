import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'splash_controller.g.dart';

class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @observable
  bool error = false;

  void checkUser() {
    if (_firebaseAuth.currentUser != null) {
      Modular.to.navigate("/home");
    } else {
      Modular.to.navigate("/auth");
    }
  }
}
