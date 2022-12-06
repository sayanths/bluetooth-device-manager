import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:toast/toast.dart';

class HomeController extends ChangeNotifier {
//TOOGLE================================
  HomeController();
  final flutterBlueP = FlutterBluePlus.instance;

  bool value = false;

  onPressToggle(bool newValue) async {
    if (value) {
      value = newValue;
      Platform.isAndroid ? await FlutterBluePlus.instance.turnOff() : null;

      notifyListeners();
    } else {
      value = newValue;
      await FlutterBluePlus.instance.turnOn();
      Platform.isAndroid ? await FlutterBluePlus.instance.turnOn() : null;
      notifyListeners();
    }
  }

  //LIST OF DEVICE ===========================

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }
}
