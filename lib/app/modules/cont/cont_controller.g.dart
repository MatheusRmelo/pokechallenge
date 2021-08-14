// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cont_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ContController on _ContControllerBase, Store {
  final _$valueAtom = Atom(name: '_ContControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_ContControllerBaseActionController =
      ActionController(name: '_ContControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ContControllerBaseActionController.startAction(
        name: '_ContControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ContControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$_ContControllerBaseActionController.startAction(
        name: '_ContControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$_ContControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
