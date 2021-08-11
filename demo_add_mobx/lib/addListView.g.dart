// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addListView.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddListView on _AddListView, Store {
  final _$listItemsAtom = Atom(name: '_AddListView.listItems');

  @override
  ObservableList<String> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<String> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$_AddListViewActionController = ActionController(name: '_AddListView');

  @override
  void addItems(String a) {
    final _$actionInfo = _$_AddListViewActionController.startAction(
        name: '_AddListView.addItems');
    try {
      return super.addItems(a);
    } finally {
      _$_AddListViewActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItems: ${listItems}
    ''';
  }
}
