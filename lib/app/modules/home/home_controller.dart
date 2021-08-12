import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pokemon/app/modules/home/models/pokemon_model.dart';
import 'package:pokemon/app/modules/home/repository/firestore_repository.dart';
import 'package:pokemon/app/modules/home/repository/pokeapi_repository.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeApiRepository _pokeapiRepository;
  final FirestoreRepository _firestoreRepository;

  @observable
  Timer _timer = Timer(Duration(seconds: 3), () {});

  @observable
  ObservableFuture<List<PokemonModel>>? pokedex;
  @observable
  ObservableFuture<List<PokemonModel>>? discoveryPokemons;

  _HomeControllerBase(this._pokeapiRepository, this._firestoreRepository) {
    getMyPokedex();
  }

  void getMyPokedex() {
    pokedex = _firestoreRepository.getMyPokedex().asObservable();
    discoveryPokemons = _pokeapiRepository.searchPokemons("").asObservable();
  }

  // void searchPokemons(String search) async {
  //   loading = true;
  //   discoveryPokemons =
  //       await _pokeapiRepository.searchPokemons(search.toLowerCase());
  // }

  void setSearch(String value) {
    if (_timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer(Duration(seconds: 3), () {
      discoveryPokemons =
          _pokeapiRepository.searchPokemons(value.toLowerCase()).asObservable();
    });
  }
}
