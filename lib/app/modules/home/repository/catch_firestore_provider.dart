import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

class CatchFirestoreProvider {
  final CollectionReference _collectionCatch =
      FirebaseFirestore.instance.collection('catch');
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<PokemonModel>> fetchMyCatches() async {
    List<PokemonModel> pokemons = [];
    var result = await _collectionCatch
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
      pokemons.add(pokemon);
    }
    return pokemons;
  }

  Future<String> fetchObsCatch(String doc) async {
    String result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(doc)
        .get()
        .then((value) {
      String obs = value.data()!['obs'];
      return obs;
    }).catchError((error) {
      return "";
    });
    return result;
  }

  Future<String> saveCatch(PokemonModel pokemon, String pokeball) async {
    String result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .add({
      'name': pokemon.name,
      'image': pokemon.image,
      'id': pokemon.id,
      "baseExperience": pokemon.baseExperience,
      "pokeball": pokeball,
      "favorite": pokemon.favorite,
    }).then((value) {
      return value.id;
    }).catchError((error) {
      return "";
    });
    return result;
  }

  Future<bool> saveObs(String doc, String obs) async {
    bool result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(doc)
        .update({"obs": obs}).then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
    return result;
  }

  Future<bool> leavePokemon(String doc) async {
    bool result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(doc)
        .delete()
        .then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
    return result;
  }
}
