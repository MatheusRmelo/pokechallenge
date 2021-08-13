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
      PokemonModel pokemon = PokemonModel(
          element['id'],
          element.id,
          element['name'],
          element['image'],
          element['baseExperience'],
          element['favorite']);
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
      PokemonModel pokemon = PokemonModel(
          element['id'],
          element.id,
          element['name'],
          element['image'],
          element['baseExperience'],
          element['favorite']);
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
      "baseExperience": pokemon.baseExperience,
      "favorite": pokemon.favorite,
    }).then((value) {
      return true;
    }).catchError((error) {
      return false;
    });
    return result;
  }

  Future<List<PokemonModel>> discoveryPokemon2(
      PokemonModel? pokemon, List<PokemonModel> currentPokemons) async {
    await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(pokemon!.id.toString())
        .set({
      'name': pokemon.name,
      'image': pokemon.image,
      'id': pokemon.id,
      "baseExperience": pokemon.baseExperience,
      "favorite": pokemon.favorite,
    }).then((value) {
      currentPokemons.add(pokemon);
      return true;
    }).catchError((error) {
      return false;
    });
    print("_-------------------------");
    print(currentPokemons);
    print("-------------------------------");
    return currentPokemons;
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
      "pokeball": pokeball,
      "favorite": pokemon.favorite,
    }).then((value) {
      return value.id;
    }).catchError((error) {
      return "";
    });
    return result;
  }

  Future<bool> favoritePokemon(
      String docCatch, String docDex, bool favorite) async {
    var result = false;
    if (docDex != "") {
      result = await _collectionPokedex
          .doc(_auth.currentUser!.uid)
          .collection("pokemons")
          .doc(docDex)
          .update({
        "favorite": favorite,
      }).then((value) {
        return true;
      }).catchError((error) {
        return false;
      });
    }
    if (result) {
      if (docCatch != "") {
        result = await _collectionCatch
            .doc(_auth.currentUser!.uid)
            .collection("pokemons")
            .doc(docCatch)
            .update({
          "favorite": favorite,
        }).then((value) {
          return true;
        }).catchError((error) {
          return false;
        });
      }
    }

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
