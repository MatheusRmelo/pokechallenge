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
  List<PokemonModel> pokedex = [];
  @observable
  List<PokemonModel> pokemons = [];
  @observable
  List<PokemonModel> favorites = [];

  @observable
  bool loading = true;

  _MainControllerBase(this.firestore, this.pokeapi) {
    getPokemons();
  }
  @action
  Future<bool> getPokemons() async {
    pokedex = await firestore.getMyPokedex();
    pokemons = await firestore.getMyPokemons();
    print(pokedex);
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
  Future<void> discoveryPokemon(PokemonModel pokemon) async {
    pokedex = await firestore.discoveryPokemon2(pokemon, pokedex);
  }

  void favoritePokemon(PokemonModel pokemon) async {
    // String docCatch = "";
    // String docDex = "";
    // bool favorite = pokemon.favorite;
    // List<PokemonModel>? newPokemons = pokemons.value;
    // List<PokemonModel>? newPokedex = pokedex.value;
    // List<PokemonModel> newFavorites = favorites;

    // newPokemons!.forEach((element) {
    //   if (element.id == pokemon.id) {
    //     docCatch = element.doc;
    //     element.favorite = favorite;
    //   }
    // });
    // newPokedex!.forEach((element) {
    //   if (element.id == pokemon.id) {
    //     docDex = element.doc;
    //     element.favorite = favorite;
    //   }
    // });
    // if (favorite) {
    //   newFavorites.add(pokemon);
    // } else {
    //   newFavorites.remove(pokemon);
    // }

    // favorites = newFavorites;
    // await firestore.favoritePokemon(docCatch, docDex, favorite);
  }

  void setPokemons(value) => pokemons = value;
  void setPokedex(value) => pokedex = value;
  void setFavorites(value) => favorites = value;
}
