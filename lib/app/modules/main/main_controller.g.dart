// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MainController on _MainControllerBase, Store {
  final _$pokedexAtom = Atom(name: '_MainControllerBase.pokedex');

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

  final _$pokemonsAtom = Atom(name: '_MainControllerBase.pokemons');

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

  final _$favoritesAtom = Atom(name: '_MainControllerBase.favorites');

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

  final _$loadingAtom = Atom(name: '_MainControllerBase.loading');

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

  final _$getPokemonsAsyncAction =
      AsyncAction('_MainControllerBase.getPokemons');

  @override
  Future<bool> getPokemons() {
    return _$getPokemonsAsyncAction.run(() => super.getPokemons());
  }

  final _$discoveryPokemonAsyncAction =
      AsyncAction('_MainControllerBase.discoveryPokemon');

  @override
  Future<void> discoveryPokemon(PokemonModel pokemon) {
    return _$discoveryPokemonAsyncAction
        .run(() => super.discoveryPokemon(pokemon));
  }

  @override
  String toString() {
    return '''
pokedex: ${pokedex},
pokemons: ${pokemons},
favorites: ${favorites},
loading: ${loading}
    ''';
  }
}
