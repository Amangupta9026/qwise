import 'package:flutter/material.dart';

class PageIndexSelectorNotifier extends ChangeNotifier {
  int _index = 0;

  int get index => _index;

  void changeIndex(int value) {
    _index = value;
    notifyListeners();
  }
}