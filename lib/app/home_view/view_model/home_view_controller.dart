import 'package:flutter/cupertino.dart';

class HomeViewController extends ChangeNotifier {
  bool value = false;

  onTogglePress(bool newValue) {
    value = newValue;
    notifyListeners();
  }
}
