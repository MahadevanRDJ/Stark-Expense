import 'package:flutter/material.dart';

class CommonProvider with ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void updateIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
