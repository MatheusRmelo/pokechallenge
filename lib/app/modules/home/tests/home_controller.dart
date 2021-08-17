import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/tests/pokes_test.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

List<PokemonModel> pokedexTest = [
  PokemonModel.fromJson(jsonDecode(dittoJson)),
  PokemonModel.fromJson(jsonDecode(arcanineJson)),
  PokemonModel.fromJson(jsonDecode(charmanderJson)),
  PokemonModel.fromJson(jsonDecode(machampJson))
];
List<PokemonModel> catchesTest = [
  PokemonModel.fromJson(jsonDecode(dittoJson)),
];

abstract class _HomeControllerBase with Store {
  @observable
  List<PokemonModel> pokedex = [];
  List<PokemonModel> fullPokedex = [];
  @observable
  List<PokemonModel> catches = [];
  List<PokemonModel> fullCatches = [];
  @observable
  List<PokemonModel> favorites = [];
  @observable
  bool loading = true;

  @action
  bool getPokemons() {
    loading = true;
    List<PokemonModel> newPokedex = pokedexTest;
    List<PokemonModel> newCatches = catchesTest;
    List<PokemonModel> newFavorites = [];
    for (var element in newPokedex) {
      if (element.favorite) {
        newFavorites.add(element);
      }
    }
    pokedex = newPokedex;
    fullPokedex = newPokedex;
    catches = newCatches;
    fullCatches = newCatches;
    favorites = newFavorites;
    loading = false;
    return true;
  }

  void addPokemon() {
    Modular.to.pushNamed("discovery");
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Modular.to.navigate("/");
    });
  }

  @action
  favoritePokemon(PokemonModel pokemon) {
    bool favorite = !pokemon.favorite;
    List<PokemonModel> newCatches = catches;
    List<PokemonModel> newPokedex = pokedex;
    List<PokemonModel> newFavorites = favorites;

    for (var element in newCatches) {
      if (element.id == pokemon.id) {
        element.favorite = favorite;
      }
    }
    for (var element in newPokedex) {
      if (element.id == pokemon.id) {
        element.favorite = favorite;
      }
    }
    if (favorite) {
      newFavorites.add(pokemon);
    } else {
      newFavorites.remove(pokemon);
    }
    pokedex = newPokedex;
    catches = newCatches;
    favorites = newFavorites;
  }

  @action
  void searchPokedex(String search) {
    List<PokemonModel> newPokedex = [];
    if (search != "") {
      for (var element in fullPokedex) {
        if (element.name.contains(search)) {
          newPokedex.add(element);
        }
      }
    } else {
      newPokedex = fullPokedex;
    }

    pokedex = newPokedex;
  }

  @action
  void searchCatches(String search) {
    List<PokemonModel> newCatches = [];
    if (search != "") {
      for (var element in fullCatches) {
        if (element.name.contains(search)) {
          newCatches.add(element);
        }
      }
    } else {
      newCatches = fullCatches;
    }

    catches = newCatches;
  }

  @action
  void searchFavorites(String search) {
    List<PokemonModel> newFavorites = [];
    if (search != "") {
      for (var element in favorites) {
        if (element.name.contains(search)) {
          newFavorites.add(element);
        }
      }
    } else {
      for (var element in pokedex) {
        if (element.favorite) {
          newFavorites.add(element);
        }
      }
    }

    favorites = newFavorites;
  }
}
