// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardStore on _CardStore, Store {
  late final _$quantityAtom =
      Atom(name: '_CardStore.quantity', context: context);

  @override
  int get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(int value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$_CardStoreActionController =
      ActionController(name: '_CardStore', context: context);

  @override
  void incrementQuantity() {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.incrementQuantity');
    try {
      return super.incrementQuantity();
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementQuantity() {
    final _$actionInfo = _$_CardStoreActionController.startAction(
        name: '_CardStore.decrementQuantity');
    try {
      return super.decrementQuantity();
    } finally {
      _$_CardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quantity: ${quantity}
    ''';
  }
}
