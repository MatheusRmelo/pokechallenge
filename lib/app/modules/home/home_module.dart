import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_controller.dart';
import 'package:pokemon/app/modules/home/child/details/details_controller.dart';
import 'package:pokemon/app/modules/home/child/details/details_page.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_controller.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/home_widget.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
import 'package:pokemon/app/modules/home/child/catch/catch_page.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => DiscoveryController(i.get())),
        Bind((i) => CatchController(i.get())),
        Bind((i) => DetailsController(i.get())),
        Bind((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const HomeWidget()),
        ChildRoute('/discovery', child: (_, args) => DiscoveryPage()),
        ChildRoute('/details',
            child: (_, args) => DetailsPage(
                  pokemon: args.data['pokemon'],
                  catchPoke: args.data['catchPoke'],
                )),
        ChildRoute('/catch',
            child: (_, args) => CatchPage(
                  pokemon: args.data['pokemon'],
                )),
      ];
}
