// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$_pokedexAtom = Atom(name: '_HomeControllerBase._pokedex');

  @override
  List<PokemonModel> get _pokedex {
    _$_pokedexAtom.reportRead();
    return super._pokedex;
  }

  @override
  set _pokedex(List<PokemonModel> value) {
    _$_pokedexAtom.reportWrite(value, super._pokedex, () {
      super._pokedex = value;
    });
  }

  final _$_catchesAtom = Atom(name: '_HomeControllerBase._catches');

  @override
  List<PokemonModel> get _catches {
    _$_catchesAtom.reportRead();
    return super._catches;
  }

  @override
  set _catches(List<PokemonModel> value) {
    _$_catchesAtom.reportWrite(value, super._catches, () {
      super._catches = value;
    });
  }

  final _$_favoritesAtom = Atom(name: '_HomeControllerBase._favorites');

  @override
  List<PokemonModel> get _favorites {
    _$_favoritesAtom.reportRead();
    return super._favorites;
  }

  @override
  set _favorites(List<PokemonModel> value) {
    _$_favoritesAtom.reportWrite(value, super._favorites, () {
      super._favorites = value;
    });
  }

  final _$_loadingAtom = Atom(name: '_HomeControllerBase._loading');

  @override
  bool get _loading {
    _$_loadingAtom.reportRead();
    return super._loading;
  }

  @override
  set _loading(bool value) {
    _$_loadingAtom.reportWrite(value, super._loading, () {
      super._loading = value;
    });
  }

  final _$getPokemonsAsyncAction =
      AsyncAction('_HomeControllerBase.getPokemons');

  @override
  Future<bool> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
