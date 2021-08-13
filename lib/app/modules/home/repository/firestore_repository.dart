import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';

class FirestoreRepository {
  CollectionReference _collectionPokedex =
      FirebaseFirestore.instance.collection('pokedex');
  CollectionReference _collectionCatch =
      FirebaseFirestore.instance.collection('catch');
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<PokemonModel>> getMyPokedex() async {
    List<PokemonModel> pokedex = [];
    var result = await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .orderBy("id")
        .get();

    result.docs.forEach((element) {
      PokemonModel pokemon = PokemonModel(element['id'], element['name'],
          element['image'], element['baseExperience']);
      pokedex.add(pokemon);
    });
    return pokedex;
  }

  Future<List<PokemonModel>> getMyPokemons() async {
    List<PokemonModel> pokemons = [];
    var result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .orderBy("id")
        .get();

    result.docs.forEach((element) {
      PokemonModel pokemon = PokemonModel(element['id'], element['name'],
          element['image'], element['baseExperience']);
      pokemons.add(pokemon);
    });
    return pokemons;
  }

  Future<bool> discoveryPokemon(PokemonModel? pokemon) async {
    bool result = await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(pokemon!.id.toString())
        .set({
      'name': pokemon.name,
      'image': pokemon.image,
      'id': pokemon.id,
      "baseExperience": pokemon.baseExperience
    }).then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
    return result;
  }

  Future<String> saveCatch(PokemonModel? pokemon, String pokeball) async {
    String result = await _collectionCatch
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .add({
      'name': pokemon!.name,
      'image': pokemon.image,
      'id': pokemon.id,
      "baseExperience": pokemon.baseExperience,
      "pokeball": pokeball
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
}
