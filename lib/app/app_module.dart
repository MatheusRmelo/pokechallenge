import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/auth/auth_module.dart';
import 'package:pokemon/app/modules/cont/cont_module.dart';
import 'package:pokemon/app/modules/home2/home_module.dart';
import 'package:pokemon/app/modules/main/main_module.dart';

class AppModule extends Module {
  // Provide a list of dependencies to inject into your project
  @override
  List<Bind> get binds => [];

  // Provide all the routes for your module
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: AuthModule()),
        ModuleRoute("/home", module: HomeModule()),
      ];
}
