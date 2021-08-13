import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

class PokeApiRepository {
  Future<List<PokemonModel>> searchPokemons(String search) async {
    final _dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"));
    List<PokemonModel> pokemons = [];

    if (search != "") {
      try {
        var result = await _dio.get("pokemon/$search");
        var data = result.data;
        PokemonModel pokemon = PokemonModel(
            data['id'],
            data['id'].toString(),
            data['name'],
            data['sprites']['front_default'],
            data['base_experience'],
            false);
        pokemons.add(pokemon);
      } catch (e) {
        print(e);
      }
    }
    return pokemons;
  }
}
