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
    newPokedex.forEach((element) {
      if (element.favorite) {
        newFavorites.add(element);
      }
    });
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
    print(pokemon);
    String docCatch = "";
    String docDex = "";
    bool favorite = !pokemon.favorite;
    List<PokemonModel> newCatches = catches;
    List<PokemonModel> newPokedex = pokedex;
    List<PokemonModel> newFavorites = favorites;

    newCatches.forEach((element) {
      if (element.id == pokemon.id) {
        docCatch = element.doc;
        element.favorite = favorite;
      }
    });
    newPokedex.forEach((element) {
      if (element.id == pokemon.id) {
        docDex = element.doc;
        element.favorite = favorite;
      }
    });
    if (favorite) {
      newFavorites.add(pokemon);
    } else {
      newFavorites.remove(pokemon);
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
      fullPokedex.forEach((element) {
        if (element.name.contains(search)) {
          newPokedex.add(element);
        }
      });
    } else {
      newPokedex = fullPokedex;
    }

    pokedex = newPokedex;
  }

  @action
  void searchCatches(String search) {
    List<PokemonModel> newCatches = [];
    if (search != "") {
      fullCatches.forEach((element) {
        if (element.name.contains(search)) {
          newCatches.add(element);
        }
      });
    } else {
      newCatches = fullCatches;
    }

    catches = newCatches;
  }

  @action
  void searchFavorites(String search) {
    List<PokemonModel> newFavorites = [];
    if (search != "") {
      favorites.forEach((element) {
        if (element.name.contains(search)) {
          newFavorites.add(element);
        }
      });
    } else {
      pokedex.forEach((element) {
        if (element.favorite) {
          newFavorites.add(element);
        }
      });
    }

    favorites = newFavorites;
  }
}
