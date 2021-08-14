import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/cont/child/cont_two.dart';
import 'package:pokemon/app/modules/cont/cont_controller.dart';
import 'package:pokemon/app/modules/cont/cont_widget.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_controller.dart';
import 'package:pokemon/app/modules/home/child/details/details_controller.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_controller.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';

class ContModule extends Module {
  @override
  List<Bind> get binds => [Bind((i) => ContController())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => ContWidget()),
        ChildRoute('/two', child: (_, args) => ContTwoPage()),
      ];
}
