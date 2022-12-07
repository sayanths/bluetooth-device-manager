import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:bluetooth_device_manager/app/utiles/colors.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';

class BlueToothInfo extends StatelessWidget {
  const BlueToothInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Bluetooth Information"),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Routes.back();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: bgColor,
      ),
      body: Column(
        children: [
          kSizeBoxHeight20,
          CustomContainer(
              size: size,
              height: size.height * .40,
              width: size.width / 1.1,
              child: Column(
                children: const [
                  CustomTextTitles(mainTitile: "Name :", subTitle: "Say"),
                  CustomTextTitles(
                      mainTitile: "Mac Address :", subTitle: "020:00:00:00"),
                  CustomTextTitles(
                      mainTitile: "Discovering :", subTitle: "False"),
                  CustomTextTitles(
                      mainTitile: "Scan Mode :", subTitle: "CONNECTABLE"),
                  CustomTextTitles(
                      mainTitile: "Type :", subTitle: "Classic -BR/EDR"),
                  CustomTextTitles(mainTitile: "State :", subTitle: "ON"),
                ],
              ))
        ],
      ),
    );
  }
}

class CustomTextTitles extends StatelessWidget {
  final String mainTitile;
  final String subTitle;

  const CustomTextTitles({
    Key? key,
    required this.mainTitile,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kSizeBoxHeight10,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                child: Text(
                  mainTitile,
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Text(
                subTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        kSizeBoxHeight20,
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const CustomContainer({
    Key? key,
    required this.size,
    required this.height,
    required this.width,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 11, 88, 151)),
      child: child,
    );
  }
}
