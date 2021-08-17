import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/repository.dart';
part 'discovery_controller.g.dart';

class DiscoveryController = _DiscoveryControllerBase with _$DiscoveryController;

abstract class _DiscoveryControllerBase with Store {
  final HomeRepository repository;
  @observable
  Timer _timer = Timer(const Duration(seconds: 1), () {});
  @observable
  String _search = "";

  @observable
  bool loading = false;
  @observable
  List<PokemonModel> pokemons = [];

  @observable
  bool initialSearch = true;

  _DiscoveryControllerBase(this.repository);

  @action
  Future<void> searchPokemons() async {
    var newPokemons = await repository.fetchPokemons(search.toLowerCase());
    loading = false;
    pokemons = newPokemons;
  }

  set search(String value) {
    _search = value;
    loading = true;
    initialSearch = false;
    if (_timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer(const Duration(seconds: 1), () {
      searchPokemons();
    });
  }

  String get search => _search;
}
