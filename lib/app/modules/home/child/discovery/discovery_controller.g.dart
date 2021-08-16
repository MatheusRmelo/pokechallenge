// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discovery_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DiscoveryController on _DiscoveryControllerBase, Store {
  final _$_timerAtom = Atom(name: '_DiscoveryControllerBase._timer');

  @override
  Timer get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  final _$_searchAtom = Atom(name: '_DiscoveryControllerBase._search');

  @override
  String get _search {
    _$_searchAtom.reportRead();
    return super._search;
  }

  @override
  set _search(String value) {
    _$_searchAtom.reportWrite(value, super._search, () {
      super._search = value;
    });
  }

  final _$loadingAtom = Atom(name: '_DiscoveryControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$pokemonsAtom = Atom(name: '_DiscoveryControllerBase.pokemons');

  @override
  List<PokemonModel> get pokemons {
    _$pokemonsAtom.reportRead();
    return super.pokemons;
  }

  @override
  set pokemons(List<PokemonModel> value) {
    _$pokemonsAtom.reportWrite(value, super.pokemons, () {
      super.pokemons = value;
    });
  }

  final _$initialSearchAtom =
      Atom(name: '_DiscoveryControllerBase.initialSearch');

  @override
  bool get initialSearch {
    _$initialSearchAtom.reportRead();
    return super.initialSearch;
  }

  @override
  set initialSearch(bool value) {
    _$initialSearchAtom.reportWrite(value, super.initialSearch, () {
      super.initialSearch = value;
    });
  }

  final _$searchPokemonsAsyncAction =
      AsyncAction('_DiscoveryControllerBase.searchPokemons');

  @override
  Future<void> searchPokemons() {
    return _$searchPokemonsAsyncAction.run(() => super.searchPokemons());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
pokemons: ${pokemons},
initialSearch: ${initialSearch}
    ''';
  }
}
