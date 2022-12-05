import 'package:bluetooth_device_manager/app/splash_screen/view_model/splash_screen_controller.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SplashScreenProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "assets/bluetoothgif.gif",
                    height: 130,
                  ),
                ),
                kSizeBoxHeight20,
                const Text(
                  "Bluetooth Device Manager",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 18),
                )
              ],
            ),
          ),
          const Expanded(child: SizedBox())
        ],
      ),
    );
  }
}
