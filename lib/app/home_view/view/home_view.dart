import 'package:bluetooth_device_manager/app/utiles/colors.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 64, 117),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 64, 117),
        elevation: 0,
        title: const Text(
          "Bluetooth Device Managaer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          kSizeBoxHeight20,
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 8, 82, 144),
                borderRadius: BorderRadius.circular(10)),
            height: 60,
            width: size.width / 1.1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Bluetooth Status",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 15),
                  ),
                  Switch(
                      // thumb color (round icon)
                      activeColor: const Color.fromARGB(255, 250, 250, 250),
                      activeTrackColor: Colors.cyan,
                      inactiveThumbColor: Colors.blueGrey.shade600,
                      inactiveTrackColor: Colors.grey.shade400,
                      splashRadius: 50.0,
                      // boolean variable value
                      value: true,
                      // changes the state of the switch
                      onChanged: (value) {}),
                ],
              ),
            ),
          ),
          kSizeBoxHeight20,
          Image.asset(
            "assets/bluetooth.png",
            height: size.height / 10,
          ),
          kSizeBoxHeight10,
          const Text(
            "Start Scan",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
          kSizeBoxHeight20,
          kSizeBoxHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomStackContainer(
                  size: size,
                  title: "Paired Device",
                  icon: const CustomPairedDeviceWidget()),
              CustomStackContainer(
                size: size,
                title: "Bluetooth Info",
                icon: const BluetoothInfoButtonCustom(),
              ),
              CustomStackContainer(
                  size: size,
                  title: "Find Device",
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Iconify(
                        Arcticons.finddevice,
                        color: white,
                        size: 20,
                      ),
                      Iconify(
                        Mdi.mobile_phone,
                        color: white,
                      )
                    ],
                  )),
            ],
          ),
        ],
      )),
    );
  }
}

class BluetoothInfoButtonCustom extends StatelessWidget {
  const BluetoothInfoButtonCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.bluetooth,
          size: 20,
          color: Colors.white,
        ),
        Iconify(
          MaterialSymbols.info_outline,
          color: white,
          size: 15,
        )
      ],
    );
  }
}

class CustomStackContainer extends StatelessWidget {
  final String title;
  final Widget icon;

  const CustomStackContainer({
    Key? key,
    required this.size,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 15,
          left: 20,
          child: Text(
            title,
            style: TextStyle(color: white, fontWeight: FontWeight.w600),
          ),
        ),
        Positioned(
          top: -15,
          right: 15,
          child: Container(
            height: size.height / 20,
            width: size.width / 5,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 0, 134, 171),
                borderRadius: BorderRadius.circular(10)),
            child: icon,
          ),
        ),
        Container(
          height: size.height / 12,
          width: size.width / 3.3,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 162, 206, 242).withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ],
    );
  }
}

class CustomPairedDeviceWidget extends StatelessWidget {
  const CustomPairedDeviceWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(Icons.bluetooth, size: 20, color: Colors.white),
        Icon(Icons.arrow_forward, size: 13, color: Colors.white),
        Icon(Icons.arrow_back, size: 13, color: Colors.white),
        Icon(
          Icons.bluetooth,
          size: 20,
          color: Colors.white,
        ),
      ],
    );
  }
}
