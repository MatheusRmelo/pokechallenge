import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokemon/app/modules/home/child/discovery/discovery_view.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';

class DiscoveryController extends StatefulWidget {
  const DiscoveryController({Key? key}) : super(key: key);

  @override
  _DiscoveryControllerState createState() => _DiscoveryControllerState();
}

class _DiscoveryControllerState extends State<DiscoveryController> {
  PokeApiRepository repository = Modular.get<PokeApiRepository>();
  Timer _timer = Timer(Duration(seconds: 1), () {});
  bool loading = true;
  List<PokemonModel>? pokemons;
  String search = "";

  void searchPokemons() async {
    setState(() {
      loading = true;
    });
    var newPokemons = await repository.searchPokemons(search.toLowerCase());
    setState(() {
      loading = false;
      pokemons = newPokemons;
    });
  }

  void setSearch(String text) {
    setState(() {
      search = text;
      if (_timer.isActive) {
        _timer.cancel();
      }
      _timer = Timer(Duration(seconds: 1), () {
        searchPokemons();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DiscoveryView(
      goBack: () {
        Modular.to.pop();
      },
      setSearch: setSearch,
      loading: loading,
      pokemons: pokemons,
    );
  }
}
