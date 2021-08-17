import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/splash/splash_controller.dart';
import 'package:pokemon/app/modules/splash/splash_widget.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashWidget()),
      ];
}
