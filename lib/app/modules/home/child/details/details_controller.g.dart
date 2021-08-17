// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DetailsController on _DetailsControllerBase, Store {
  final _$textEditingControllerAtom =
      Atom(name: '_DetailsControllerBase.textEditingController');

  @override
  TextEditingController get textEditingController {
    _$textEditingControllerAtom.reportRead();
    return super.textEditingController;
  }

  @override
  set textEditingController(TextEditingController value) {
    _$textEditingControllerAtom.reportWrite(value, super.textEditingController,
        () {
      super.textEditingController = value;
    });
  }

  final _$obsAtom = Atom(name: '_DetailsControllerBase.obs');

  @override
  String get obs {
    _$obsAtom.reportRead();
    return super.obs;
  }

  @override
  set obs(String value) {
    _$obsAtom.reportWrite(value, super.obs, () {
      super.obs = value;
    });
  }

  final _$errorAtom = Atom(name: '_DetailsControllerBase.error');

  @override
  bool get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(bool value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$successAtom = Atom(name: '_DetailsControllerBase.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$favoriteAtom = Atom(name: '_DetailsControllerBase.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$fetchObsCatchAsyncAction =
      AsyncAction('_DetailsControllerBase.fetchObsCatch');

  @override
  Future<void> fetchObsCatch(String doc, bool fav) {
    return _$fetchObsCatchAsyncAction.run(() => super.fetchObsCatch(doc, fav));
  }

  final _$saveObsAsyncAction = AsyncAction('_DetailsControllerBase.saveObs');

  @override
  Future<void> saveObs(String doc) {
    return _$saveObsAsyncAction.run(() => super.saveObs(doc));
  }

  final _$leavePokemonAsyncAction =
      AsyncAction('_DetailsControllerBase.leavePokemon');

  @override
  Future<bool> leavePokemon(String doc) {
    return _$leavePokemonAsyncAction.run(() => super.leavePokemon(doc));
  }

  final _$_DetailsControllerBaseActionController =
      ActionController(name: '_DetailsControllerBase');

  @override
  void favoritePokemon(PokemonModel pokemon) {
    final _$actionInfo = _$_DetailsControllerBaseActionController.startAction(
        name: '_DetailsControllerBase.favoritePokemon');
    try {
      return super.favoritePokemon(pokemon);
    } finally {
      _$_DetailsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textEditingController: ${textEditingController},
obs: ${obs},
error: ${error},
success: ${success},
favorite: ${favorite}
    ''';
  }
}
