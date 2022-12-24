import 'dart:async';

import 'package:bluetooth_device_manager/app/home_view/view/home_view.dart';
import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:flutter/cupertino.dart';

class SplashScreenProvider extends ChangeNotifier {
  SplashScreenProvider() {
    init();
  }

  Future<void> init() async {
    Timer(const Duration(seconds: 5), () {
      Routes.pushRemoveUntil(screen: HomeView());
    });
  }
}
