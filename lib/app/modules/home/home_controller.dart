import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/home_view.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';

class HomeControlller extends StatefulWidget {
  const HomeControlller({Key? key}) : super(key: key);

  @override
  _HomeControlllerState createState() => _HomeControlllerState();
}

class _HomeControlllerState extends State<HomeControlller> {
  FirestoreRepository repository = Modular.get<FirestoreRepository>();
  bool loading = true;
  List<PokemonModel> pokedex = [];
  List<PokemonModel> pokemons = [];
  List<PokemonModel> favorites = [];

  @override
  void initState() {
    super.initState();
    getPokemons();
  }

  void getPokemons() async {
    setState(() {
      loading = true;
    });
    List<PokemonModel> newPokedex = await repository.getMyPokedex();
    List<PokemonModel> newPokemons = await repository.getMyPokemons();
    List<PokemonModel> newFavorites = [];
    newPokedex.forEach((element) {
      if (element.favorite) {
        newFavorites.add(element);
      }
    });
    setState(() {
      pokedex = newPokedex;
      pokemons = newPokemons;
      favorites = newFavorites;
      loading = false;
    });
  }

  void addPokemon() {
    Modular.to.pushNamed("discovery");
  }

  void logout() {
    FirebaseAuth.instance.signOut().then((value) {
      Modular.to.navigate("/auth");
    });
  }

  void setFavorite(PokemonModel pokemon) async {
    String docCatch = "";
    String docDex = "";
    bool favorite = !pokemon.favorite;
    List<PokemonModel> newPokemons = pokemons;
    List<PokemonModel> newPokedex = pokedex;

    newPokemons.forEach((element) {
      if (element.id == pokemon.id) {
        docCatch = element.doc;
        element.favorite = favorite;
      }
    });
    newPokedex.forEach((element) {
      if (element.id == pokemon.id) {
        docDex = element.doc;
        element.favorite = favorite;
      }
    });
    setState(() {
      pokedex = newPokedex;
      pokemons = newPokemons;
    });
    await repository.favoritePokemon(docCatch, docDex, favorite);
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(
      addPokemon: addPokemon,
      loading: loading,
      logout: logout,
      pokedex: pokedex,
      pokemons: pokemons,
      favorites: favorites,
      setFavorite: setFavorite,
    );
  }
}
