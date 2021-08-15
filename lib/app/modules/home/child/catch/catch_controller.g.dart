// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catch_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CatchController on _CatchControllerBase, Store {
  final _$docAtom = Atom(name: '_CatchControllerBase.doc');

  @override
  String get doc {
    _$docAtom.reportRead();
    return super.doc;
  }

  @override
  set doc(String value) {
    _$docAtom.reportWrite(value, super.doc, () {
      super.doc = value;
    });
  }

  final _$_obsAtom = Atom(name: '_CatchControllerBase._obs');

  @override
  String get _obs {
    _$_obsAtom.reportRead();
    return super._obs;
  }

  @override
  set _obs(String value) {
    _$_obsAtom.reportWrite(value, super._obs, () {
      super._obs = value;
    });
  }

  final _$_pokeballAtom = Atom(name: '_CatchControllerBase._pokeball');

  @override
  PokeballModel get _pokeball {
    _$_pokeballAtom.reportRead();
    return super._pokeball;
  }

  @override
  set _pokeball(PokeballModel value) {
    _$_pokeballAtom.reportWrite(value, super._pokeball, () {
      super._pokeball = value;
    });
  }

  final _$statusAtom = Atom(name: '_CatchControllerBase.status');

  @override
  String get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$catchPokeAtom = Atom(name: '_CatchControllerBase.catchPoke');

  @override
  bool get catchPoke {
    _$catchPokeAtom.reportRead();
    return super.catchPoke;
  }

  @override
  set catchPoke(bool value) {
    _$catchPokeAtom.reportWrite(value, super.catchPoke, () {
      super.catchPoke = value;
    });
  }

  final _$discoveryPokemonAsyncAction =
      AsyncAction('_CatchControllerBase.discoveryPokemon');

  @override
  Future<void> discoveryPokemon(PokemonModel pokemon) {
    return _$discoveryPokemonAsyncAction
        .run(() => super.discoveryPokemon(pokemon));
  }

  final _$goCatchAsyncAction = AsyncAction('_CatchControllerBase.goCatch');

  @override
  Future<void> goCatch(PokemonModel pokemon) {
    return _$goCatchAsyncAction.run(() => super.goCatch(pokemon));
  }

  final _$saveObsAsyncAction = AsyncAction('_CatchControllerBase.saveObs');

  @override
  Future<void> saveObs() {
    return _$saveObsAsyncAction.run(() => super.saveObs());
  }

  final _$_CatchControllerBaseActionController =
      ActionController(name: '_CatchControllerBase');

  @override
  void reset() {
    final _$actionInfo = _$_CatchControllerBaseActionController.startAction(
        name: '_CatchControllerBase.reset');
    try {
      return super.reset();
    } finally {
      _$_CatchControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
doc: ${doc},
status: ${status},
catchPoke: ${catchPoke}
    ''';
  }
}
