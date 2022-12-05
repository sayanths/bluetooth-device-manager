import 'package:bluetooth_device_manager/app/home_view/view_model/home_controler.dart';
import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:bluetooth_device_manager/app/splash_screen/view/splash_screen.dart';
import 'package:bluetooth_device_manager/app/splash_screen/view_model/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeController>(
      create: (context) => HomeController(),
    ),
    ChangeNotifierProvider<SplashScreenProvider>(
      create: (context) => SplashScreenProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Bluetooth device manager',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen());
  }
}
