// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokedexAtom = Atom(name: '_HomeControllerBase.pokedex');

  @override
  List<PokemonModel> get pokedex {
    _$pokedexAtom.reportRead();
    return super.pokedex;
  }

  @override
  set pokedex(List<PokemonModel> value) {
    _$pokedexAtom.reportWrite(value, super.pokedex, () {
      super.pokedex = value;
    });
  }

  final _$catchesAtom = Atom(name: '_HomeControllerBase.catches');

  @override
  List<PokemonModel> get catches {
    _$catchesAtom.reportRead();
    return super.catches;
  }

  @override
  set catches(List<PokemonModel> value) {
    _$catchesAtom.reportWrite(value, super.catches, () {
      super.catches = value;
    });
  }

  final _$favoritesAtom = Atom(name: '_HomeControllerBase.favorites');

  @override
  List<PokemonModel> get favorites {
    _$favoritesAtom.reportRead();
    return super.favorites;
  }

  @override
  set favorites(List<PokemonModel> value) {
    _$favoritesAtom.reportWrite(value, super.favorites, () {
      super.favorites = value;
    });
  }

  final _$loadingAtom = Atom(name: '_HomeControllerBase.loading');

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

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  bool getPokemons() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getPokemons');
    try {
      return super.getPokemons();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic favoritePokemon(PokemonModel pokemon) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.favoritePokemon');
    try {
      return super.favoritePokemon(pokemon);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchPokedex(String search) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.searchPokedex');
    try {
      return super.searchPokedex(search);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchCatches(String search) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.searchCatches');
    try {
      return super.searchCatches(search);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchFavorites(String search) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.searchFavorites');
    try {
      return super.searchFavorites(search);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokedex: ${pokedex},
catches: ${catches},
favorites: ${favorites},
loading: ${loading}
    ''';
  }
}
