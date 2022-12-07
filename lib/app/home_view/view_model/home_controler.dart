import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:toast/toast.dart';

class HomeController extends ChangeNotifier {
//TOOGLE================================

  final flutterBlueP = FlutterBluePlus.instance;

  bool value = false;

  onPressToggle(bool newValue) async {
    final btState =
        flutterBlueP.state.handleError((e) => BluetoothState.unavailable);
    if (btState == BluetoothState.unavailable) {
      var snackBar = const SnackBar(content: Text('Hello World'));
      return;
    }

    if (btState != BluetoothState.on) {
      if (Platform.isAndroid) {
        value = newValue;
        await FlutterBluePlus.instance.turnOn();
        onScan();

        const intent = AndroidIntent(
          action: 'android.bluetooth.adapter.action.REQUEST_ENABLE',
        );
        await intent.launch();
        await Future.delayed(const Duration(seconds: 5));
        notifyListeners();
      } else if (flutterBlueP.state != BluetoothState.on) {
        const intent = AndroidIntent(
          action: 'android.bluetooth.adapter.action.REQUEST_DISABLE',
        );
        await intent.launch();
        value = newValue;
        await FlutterBluePlus.instance.turnOff();

        notifyListeners();
      }
      // if (Platform.isAndroid) {
      //   value = newValue;
      //   await FlutterBluePlus.instance.turnOff();
      //   const intent = AndroidIntent(
      //     action: 'android.bluetooth.adapter.action.REQUEST_DISABLE',
      //   );
      //   await intent.launch();
      //   await Future.delayed(const Duration(seconds: 5));
      //   notifyListeners();
      // }
      //  if (flutterBlueP.state == BluetoothState.on) {
      //     const intent = AndroidIntent(
      //       action: 'android.bluetooth.adapter.action.REQUEST_DISABLE',
      //     );
      //     await intent.launch();
      //     value = newValue;
      //     await FlutterBluePlus.instance.turnOff();

      //     notifyListeners();
      //   }

    }

    // if (value) {
    //   value = newValue;
    //   Platform.isAndroid ? await FlutterBluePlus.instance.turnOff() : null;
    //   notifyListeners();
    // } else {
    //   value = newValue;
    //   flutterBlueP.startScan();
    //   onScan();
    //   Platform.isAndroid ? await FlutterBluePlus.instance.turnOn() : null;
    //   notifyListeners();
    // }
  }

  //LIST OF DEVICE ===========================

  List<BluetoothDevice> devicesList = <BluetoothDevice>[];
  late StreamSubscription<ScanResult> scanSubScription;
  void onScan() async {
    devicesList.clear();
    final subScription =
        flutterBlueP.scanResults.listen((List<ScanResult> results) {
      devicesList.clear();
      for (ScanResult result in results) {
        devicesList.add(result.device);
        log("${devicesList.length} lit");
      }
    });
    // subScription.cancel();
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
