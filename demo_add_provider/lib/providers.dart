import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AddListView with ChangeNotifier {
  List<String> listItems = ["Hello", "Xin chào", "你好"];
  void addListView(String a) {
    listItems.insert(0, a);
    notifyListeners();
  }
}
