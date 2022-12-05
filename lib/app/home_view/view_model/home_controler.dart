import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class HomeController extends ChangeNotifier {
//TOOGLE================================

  bool value = false;

  onPressToggle(bool newValue) async {
    if (value) {
      value = newValue;
      await FlutterBluePlus.instance.turnOff();
      notifyListeners();
    } else {
      value = newValue;
      await FlutterBluePlus.instance.turnOn();
      notifyListeners();
    }
  }

  //LIST OF DEVICE ===========================
  var flutterBlueP = FlutterBluePlus.instance;

  startScan() async {
    if (value == true) {
      notifyListeners();
    }
  }
}
