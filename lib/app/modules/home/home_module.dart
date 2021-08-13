import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/details/details_controller.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_controller.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind((i) => PokeApiRepository()), Bind((i) => FirestoreRepository())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeControlller()),
        ChildRoute('/discovery',
            child: (_, args) => const DiscoveryController()),
        ChildRoute('/details',
            child: (_, args) => DetailsController(
                  pokemon: args.data,
                )),
      ];
}
