import 'package:bluetooth_device_manager/app/home_view/view/home_view.dart';
import 'package:bluetooth_device_manager/app/home_view/view_model/home_view_controller.dart';
import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<HomeViewController>(
      create: (context) => HomeViewController(),
    )
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
        home: const HomeView());
  }
}
