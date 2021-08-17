import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokeball_model.dart';
import 'package:pokemon/app/modules/home/home_controller.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
part 'catch_controller.g.dart';

class CatchController = _CatchControllerBase with _$CatchController;

abstract class _CatchControllerBase with Store {
  final controller = Modular.get<HomeController>();
  final HomeRepository repository;

  @observable
  String doc = "";
  @observable
  String obs = "";
  @observable
  PokeballModel pokeball = PokeballModel("pokeball", 100);
  @observable
  String status = "";
  @observable
  bool catchPoke = false;

  _CatchControllerBase(this.repository);

  @action
  Future<void> discoveryPokemon(PokemonModel pokemon) async {
    var result = await repository.discoveryPokemon(pokemon);
    if (result) {
      List<PokemonModel> newPokedex = controller.pokedex;
      bool exists = false;
      for (var element in controller.pokedex) {
        if (element.id == pokemon.id) {
          exists = true;
        }
      }
      if (!exists) {
        newPokedex.add(pokemon);
      }

      controller.pokedex = newPokedex;
    }
  }

  @action
  Future<void> goCatch(PokemonModel pokemon) async {
    Random random = Random();
    int randomNumber = random.nextInt(pokeball.rate);
    if (pokemon.baseExperience <= randomNumber) {
      var result = await repository.saveCatch(pokemon, pokeball.name);
      if (result != "") {
        doc = result;
        catchPoke = true;
        status = "Parabéns! Você capturou o ${pokemon.name}";
        List<PokemonModel> newCatches = controller.catches;
        pokemon.doc = doc;
        newCatches.add(pokemon);
        controller.catches = newCatches;
      } else {
        status = "Falha ao salvar o catch!";
      }
    } else {
      catchPoke = false;
      status = "Sua ${pokeball.name} quebrou 😔";
    }
  }

  @action
  Future<void> saveObs() async {
    var result = await repository.saveObs(doc, obs);
    if (result) {
      Modular.to.navigate("/home");
      reset();
    }
  }

  @action
  void reset() {
    doc = "";
    obs = "";
    pokeball = PokeballModel("pokeball", 100);
    status = "";
    catchPoke = false;
  }
}
