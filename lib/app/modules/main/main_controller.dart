import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';
part 'main_controller.g.dart';

class MainController = _MainControllerBase with _$MainController;

abstract class _MainControllerBase with Store {
  final FirestoreRepository firestore;
  final PokeApiRepository pokeapi;

  @observable
  ObservableFuture<List<PokemonModel>>? pokedex;
  @observable
  ObservableFuture<List<PokemonModel>>? pokemons;
  @observable
  List<PokemonModel> favorites = [];

  @observable
  bool loading = true;

  _MainControllerBase(this.firestore, this.pokeapi) {
    getPokemons();
  }

  Future<bool> getPokemons() async {
    pokedex = firestore.getMyPokedex().asObservable();
    pokemons = firestore.getMyPokemons().asObservable();
    // List<PokemonModel> newFavorites = [];
    // newPokedex.forEach((element) {
    //   if (element.favorite) {
    //     newFavorites.add(element);
    //   }
    // });
    // favorites = newFavorites;
    loading = false;

    return true;
  }

  @action
  void discoveryPokemon(PokemonModel pokemon) {
    pokedex =
        firestore.discoveryPokemon2(pokemon, pokemons!.value!).asObservable();
  }

  void favoritePokemon(PokemonModel pokemon) async {
    String docCatch = "";
    String docDex = "";
    bool favorite = pokemon.favorite;
    List<PokemonModel>? newPokemons = pokemons!.value;
    List<PokemonModel>? newPokedex = pokedex!.value;
    List<PokemonModel> newFavorites = favorites;

    newPokemons!.forEach((element) {
      if (element.id == pokemon.id) {
        docCatch = element.doc;
        element.favorite = favorite;
      }
    });
    newPokedex!.forEach((element) {
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

    favorites = newFavorites;
    await firestore.favoritePokemon(docCatch, docDex, favorite);
  }

  void setPokemons(value) => pokemons = value;
  void setPokedex(value) => pokedex = value;
  void setFavorites(value) => favorites = value;
}
