import 'package:mobx/mobx.dart';

part 'addListView.g.dart';

class AddListView = _AddListView with _$AddListView;

abstract class _AddListView with Store {
  @observable
  ObservableList<String> listItems =
      ObservableList<String>.of(["Hello", "Xin chào"]);

  @action
  void addItems(String a) {
    listItems.insert(0, a);
    print("Hi");
  }
}
