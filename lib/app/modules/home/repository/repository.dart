import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/catch_firestore_provider.dart';
import 'package:pokemon/app/modules/home/repository/pokedex_firestore_provider.dart';
import 'package:pokemon/app/modules/home/repository/pokemon_api_provider.dart';

class HomeRepository {
  final pokemonApiProvider = PokemonApiProvider();
  final catchFirestoreProvider = CatchFirestoreProvider();
  final pokedexFirestoreProvider = PokedexFirestoreProvider();

  Future<List<PokemonModel>> fetchPokemons(String search) =>
      pokemonApiProvider.fetchPokemons(search);

  Future<List<PokemonModel>> fetchMyCatches() =>
      catchFirestoreProvider.fetchMyCatches();

  Future<List<PokemonModel>> fetchMyPokedex() =>
      pokedexFirestoreProvider.fetchMyPokedex();

  Future<bool> discoveryPokemon(PokemonModel pokemon) =>
      pokedexFirestoreProvider.discoveryPokemon(pokemon);

  Future<String> saveCatch(PokemonModel pokemon, String pokeball) =>
      catchFirestoreProvider.saveCatch(pokemon, pokeball);

  Future<bool> saveObs(String doc, String obs) =>
      catchFirestoreProvider.saveObs(doc, obs);
}
