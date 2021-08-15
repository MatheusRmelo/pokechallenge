import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
part 'discovery_controller.g.dart';

class DiscoveryController = _DiscoveryControllerBase with _$DiscoveryController;

abstract class _DiscoveryControllerBase with Store {
  final HomeRepository repository;
  @observable
  Timer _timer = Timer(Duration(seconds: 1), () {});
  @observable
  bool loading = true;
  @observable
  List<PokemonModel> pokemons = [];
  @observable
  String _search = "";

  _DiscoveryControllerBase(this.repository);

  @action
  Future<void> searchPokemons() async {
    loading = true;
    var newPokemons = await repository.fetchPokemons(search.toLowerCase());
    loading = false;
    pokemons = newPokemons;
  }

  void set search(String value) {
    _search = value;
    if (_timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer(Duration(seconds: 1), () {
      searchPokemons();
    });
  }

  String get search => _search;
}
