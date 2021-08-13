import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';
import 'package:pokemon/app/modules/main/main_controller.dart';
import 'package:pokemon/app/modules/main/pages/catch_page.dart';
import 'package:pokemon/app/modules/main/pages/details_page.dart';
import 'package:pokemon/app/modules/main/pages/discovery_page.dart';
import 'package:pokemon/app/modules/main/main_widget.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => MainController(i.get(), i.get())),
        Bind((i) => PokeApiRepository()),
        Bind((i) => FirestoreRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const MainWidget()),
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
