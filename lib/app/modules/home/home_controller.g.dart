// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$pokedexAtom = Atom(name: '_HomeControllerBase.pokedex');

  @override
  ObservableFuture<List<PokemonModel>>? get pokedex {
    _$pokedexAtom.reportRead();
    return super.pokedex;
  }

  @override
  set pokedex(ObservableFuture<List<PokemonModel>>? value) {
    _$pokedexAtom.reportWrite(value, super.pokedex, () {
      super.pokedex = value;
    });
  }

  @override
  String toString() {
    return '''
pokedex: ${pokedex}
    ''';
  }
}
