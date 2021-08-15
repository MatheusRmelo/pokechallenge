import 'package:dio/dio.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

class PokemonApiProvider {
  final _dio = Dio(BaseOptions(baseUrl: "https://pokeapi.co/api/v2/"));

  Future<List<PokemonModel>> fetchPokemons(String search) async {
    List<PokemonModel> pokemons = [];
    if (search != "") {
      try {
        var result = await _dio.get("pokemon/$search");
        var data = result.data;
        Map<String, dynamic> json = {
          ...data,
          'doc': data['id'].toString(),
          'image': data['sprites']['front_default'],
          'baseExperience': data['base_experience'],
          'favorite': false
        };
        PokemonModel pokemon = PokemonModel.fromJson(json);

        // PokemonModel pokemon = PokemonModel(
        //     data['id'],
        //     data['id'].toString(),
        //     data['name'],
        //     data['sprites']['front_default'],
        //     data['base_experience'],
        //     false);
        pokemons.add(pokemon);
      } catch (e) {
        print(e);
      }
    }

    return pokemons;
  }
}
