import 'package:firebase_core/firebase_core.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_controller.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
import 'package:test/test.dart';

void main() {
  group('App Provider Tests', () {
    HomeRepository repository = HomeRepository();
    var controller = DiscoveryController(repository);

    test('A new item should be added', () {
      controller.search = "Arceus";
      expect(controller.pokemons.isNotEmpty, true);
    });
  });
}
