import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/catch_firestore_provider.dart';
import 'package:pokemon/app/modules/home/repository/favorite_firestore_provider.dart';
import 'package:pokemon/app/modules/home/repository/pokedex_firestore_provider.dart';
import 'package:pokemon/app/modules/home/repository/pokemon_api_provider.dart';

class HomeRepository {
  final _pokemonApiProvider = PokemonApiProvider();
  final _catchFirestoreProvider = CatchFirestoreProvider();
  final _pokedexFirestoreProvider = PokedexFirestoreProvider();
  final _favoriteFirestoreProvider = FavoriteFirestoreProvider();

  Future<List<PokemonModel>> fetchPokemons(String search) =>
      _pokemonApiProvider.fetchPokemons(search);

  Future<List<PokemonModel>> fetchMyCatches() =>
      _catchFirestoreProvider.fetchMyCatches();

  Future<String> fetchObsCatch(String doc) =>
      _catchFirestoreProvider.fetchObsCatch(doc);

  Future<List<PokemonModel>> fetchMyPokedex() =>
      _pokedexFirestoreProvider.fetchMyPokedex();

  Future<bool> discoveryPokemon(PokemonModel pokemon) =>
      _pokedexFirestoreProvider.discoveryPokemon(pokemon);

  Future<String> saveCatch(PokemonModel pokemon, String pokeball) =>
      _catchFirestoreProvider.saveCatch(pokemon, pokeball);

  Future<bool> saveObs(String doc, String obs) =>
      _catchFirestoreProvider.saveObs(doc, obs);

  Future<bool> leavePokemon(String doc) =>
      _catchFirestoreProvider.leavePokemon(doc);

  Future<void> favoritePokemon(String docCatch, String docDex, bool favorite) =>
      _favoriteFirestoreProvider.favoritePokemon(docCatch, docDex, favorite);
}
