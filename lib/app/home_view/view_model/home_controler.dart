// ignore_for_file: unrelated_type_equality_checks


import 'dart:developer';


import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:toast/toast.dart';

class HomeController extends ChangeNotifier {
//TOOGLE================================

  final flutterBlueP = FlutterBluePlus.instance;

  bool value = false;

  onPressToggle(bool newValue) async {
    value = newValue;
    onBluetoothOn();
    notifyListeners();
  }

  onBluetoothOn() async {
    if (value) {
      await flutterBlueP.turnOn();
      const intent = AndroidIntent(
        action: 'android.bluetooth.adapter.action.REQUEST_ENABLE',
      );
      await intent.launch();
      newScan();
      notifyListeners();
    } else {
      await flutterBlueP.turnOff();
      notifyListeners();
    }
  }

  //LIST OF DEVICE ===========================


  List<ScanResult> devicesList = <ScanResult>[];
   newScan() async {
    devicesList.clear();
    final sd = flutterBlueP.scan(scanMode: ScanMode.lowLatency).listen((event) {
      devicesList.add(event);
      log("${event.toString()}  sssa");
    });
    flutterBlueP.stopScan();
    // sd.cancel();
    stopScan();
  }


  void stopScan() {
    flutterBlueP.stopScan();
  }

  void showToast(String msg, {int? duration, int? gravity}) {
    Toast.show(msg, duration: duration, gravity: gravity);
  }


  // Future<List<BluetoothDevice>> pairedDevices = Future<List<BluetoothDevice>>[];
  // onPairedDevice() async {
  //   pairedDevices.ad(flutterBlueP.bondedDevices);
  // }
}
