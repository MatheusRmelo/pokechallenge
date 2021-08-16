import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/auth/auth_controller.dart';
import 'package:pokemon/app/modules/auth/auth_widget.dart';

class AuthModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => AuthWidget()),
      ];
}
