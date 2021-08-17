import 'dart:convert';

import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/tests/home_controller.dart';
import 'package:pokemon/app/modules/home/tests/pokes_test.dart';
import 'package:test/test.dart';

void main() {
  group('App Provider Tests', () {
    var controller = HomeController();

    test('Pegar todos os pokémons vistos', () {
      controller.getPokemons();
      expect(controller.pokedex.isNotEmpty, true);
    });
    test('Pegar todos os pokémons capturados', () {
      controller.getPokemons();
      expect(controller.catches.isNotEmpty, true);
    });
    test('Pegar todos os pokémons favoritos', () {
      controller.getPokemons();
      expect(controller.favorites.isNotEmpty, true);
    });
    test('Deve favoritar um pokemon', () {
      controller.favoritePokemon(PokemonModel.fromJson(jsonDecode(dittoJson)));
      expect(controller.favorites.length > 1, true);
    });
    test('Pesquisar na pokédex "cha" e encontrar o "charmander" e "machamp"',
        () {
      controller.searchPokedex("cha");
      expect(
          (controller.pokedex[0].name == "charmander" &&
                  controller.pokedex[1].name == "machamp") ||
              (controller.pokedex[1].name == "charmander" &&
                      controller.pokedex[0].name == "machamp") &&
                  controller.pokedex.length == 2,
          true);
    });
    test('Pesquisar nos capturados por "to" e encontrar o ditto', () {
      controller.searchCatches("to");
      expect(
          controller.catches[0].name == "ditto" &&
              controller.catches.length == 1,
          true);
    });
    test('Pesquisar nos favoritos por "nine" e encontrar o arcanine', () {
      controller.searchFavorites("nine");
      expect(
          controller.favorites[0].name == "arcanine" &&
              controller.favorites.length == 1,
          true);
    });
  });
}
