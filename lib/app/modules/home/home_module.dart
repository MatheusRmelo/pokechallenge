import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/details_pokemon_widget.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/home_widget.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';
import 'package:pokemon/app/modules/home/child/discovery_widget.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get(), i.get())),
        Bind((i) => PokeApiRepository()),
        Bind((i) => FirestoreRepository())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeWidget()),
        ChildRoute('/discovery', child: (_, args) => const DiscoveryWidget()),
        ChildRoute('/details',
            child: (_, args) => DetailsPokemonWidget(
                  pokemon: args.data,
                )),
      ];
}
