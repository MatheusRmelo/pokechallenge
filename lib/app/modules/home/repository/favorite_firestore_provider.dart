import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoriteFirestoreProvider {
  CollectionReference _collectionCatch =
      FirebaseFirestore.instance.collection('catch');
  CollectionReference _collectionPokedex =
      FirebaseFirestore.instance.collection('pokedex');
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> favoritePokemon(
      String docCatch, String docDex, bool favorite) async {
    bool result = await _collectionPokedex
        .doc(_auth.currentUser!.uid)
        .collection("pokemons")
        .doc(docDex)
        .update({'favorite': favorite}).then((value) {
      return true;
    }).catchError((e) {
      print(e);
      return false;
    });
    if (result) {
      await _collectionCatch
          .doc(_auth.currentUser!.uid)
          .collection("pokemons")
          .doc(docCatch)
          .update({'favorite': favorite});
    }
  }
}
