import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeRepository repository;

  _HomeControllerBase(this.repository);
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
  Future<bool> getPokemons() async {
    loading = true;
    List<PokemonModel> newPokedex = await repository.fetchMyPokedex();
    List<PokemonModel> newCatches = await repository.fetchMyCatches();
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
      Modular.to.navigate("/auth");
    });
  }

  @action
  Future<void> favoritePokemon(PokemonModel pokemon) async {
    String docCatch = "";
    String docDex = "";
    bool favorite = !pokemon.favorite;
    List<PokemonModel> newCatches = catches;
    List<PokemonModel> newPokedex = pokedex;
    List<PokemonModel> newFavorites = favorites;

    for (var element in newCatches) {
      if (element.id == pokemon.id) {
        docCatch = element.doc;
        element.favorite = favorite;
      }
    }
    for (var element in newPokedex) {
      if (element.id == pokemon.id) {
        docDex = element.id.toString();
        element.favorite = favorite;
      }
    }
    if (favorite) {
      newFavorites.add(pokemon);
    } else {
      newFavorites = [];
      for (var element in favorites) {
        if (element.id != pokemon.id) {
          newFavorites.add(element);
        }
      }
    }
    pokedex = newPokedex;
    catches = newCatches;
    favorites = newFavorites;
    await repository.favoritePokemon(docCatch, docDex, favorite);
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
