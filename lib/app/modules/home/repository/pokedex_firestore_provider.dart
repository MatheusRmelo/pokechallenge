import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

class PokedexFirestoreProvider {
  final CollectionReference _collectionPokedex =
      FirebaseFirestore.instance.collection('pokedex');
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<List<PokemonModel>> fetchMyPokedex() async {
    List<PokemonModel> pokedex = [];
    var result = await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .orderBy("id")
        .get();

    for (var element in result.docs) {
      Map<String, dynamic> json = {
        ...element.data(),
        'doc': element.id,
      };
      PokemonModel pokemon = PokemonModel.fromJson(json);
      pokedex.add(pokemon);
    }
    return pokedex;
  }

  Future<bool> discoveryPokemon(PokemonModel pokemon) async {
    bool result = await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(pokemon.id.toString())
        .set({
      'name': pokemon.name,
      'image': pokemon.image,
      'id': pokemon.id,
      "baseExperience": pokemon.baseExperience,
      "favorite": pokemon.favorite,
    }).then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
    return result;
  }
}
