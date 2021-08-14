import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home2/home_controller.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';
import 'package:pokemon/app/modules/home2/home_widget.dart';
import 'package:pokemon/app/modules/home2/repository/repository.dart';
import 'package:pokemon/app/modules/main/main_controller.dart';
import 'package:pokemon/app/modules/main/pages/catch_page.dart';
import 'package:pokemon/app/modules/main/pages/details_page.dart';
import 'package:pokemon/app/modules/main/pages/discovery_page.dart';
import 'package:pokemon/app/modules/main/main_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeWidget()),
        ChildRoute('/discovery', child: (_, args) => const DiscoveryPage()),
        ChildRoute('/details',
            child: (_, args) => DetailsPage(
                  pokemon: args.data,
                )),
        ChildRoute('/catch',
            child: (_, args) => CatchPage(
                  pokemon: args.data,
                )),
      ];
}
