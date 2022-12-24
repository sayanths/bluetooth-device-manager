import 'package:bluetooth_device_manager/app/home_view/view_model/home_controler.dart';
import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:bluetooth_device_manager/app/utiles/colors.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlueToothInfo extends StatelessWidget {
  const BlueToothInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HomeController>(
      builder: (context, value, _) => Scaffold(
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
        body: Consumer<HomeController>(
          builder: (context, value, _) => Column(
            children: [
              kSizeBoxHeight20,
              CustomContainer(
                  size: size,
                  height: size.height * .36,
                  width: size.width / 1.1,
                  child: Column(
                    children: [
                      const CustomTextTitles(
                          mainTitile: "Name :", subTitle: "Say"),
                      CustomTextTitles(
                          mainTitile: "Mac Address :",
                          subTitle: "${value.devicesList.first.device.id}"),
                      CustomTextTitles(
                          mainTitile: "Discovering :",
                          subTitle:
                              "${value.devicesList.first.advertisementData.connectable}"),
                      CustomTextTitles(
                          mainTitile: "Scan Mode :",
                          subTitle: value.devicesList.first.advertisementData
                                      .connectable ==
                                  true
                              ? "CONNECTABLE"
                              : "NOT CONNECTABLE"),
                      const CustomTextTitles(
                          mainTitile: "Type :", subTitle: "Classic -BR/EDR"),
                      const CustomTextTitles(
                          mainTitile: "State :", subTitle: "ON"),
                    ],
                  )),
              kSizeBoxHeight20,
              CustomContainer(
                size: size,
                height: size.height * .20,
                width: size.width / 1.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const MainTitleText(title: "Profile Supported :"),
                    kSizeBoxHeight20,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        CustomTextAnswers(title: "A2DP -SRC"),
                        CustomTextAnswers(title: "HFP -Audio Gateway"),
                        CustomTextAnswers(title: "HSP"),
                      ],
                    ),
                  ],
                ),
              ),
              kSizeBoxHeight20,
              CustomContainer(
                  size: size,
                  height: size.height * .20,
                  width: size.width / 1.1,
                  child: Column(
                    children: const [
                      MainTitleText(title: "UUID List :"),
                      kSizeBoxHeight20,
                      CustomTextAnswers(title: "000146a-5846-8556-00255-5fb9s"),
                      CustomTextAnswers(title: "000146a-5846-8556-00255-5fb6p"),
                      CustomTextAnswers(title: "000146a-5846-8556-00255-5fb2m"),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextAnswers extends StatelessWidget {
  final String title;
  const CustomTextAnswers({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
    );
  }
}

class MainTitleText extends StatelessWidget {
  final String title;
  const MainTitleText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.blue, fontSize: 18, fontWeight: FontWeight.w600),
        ),
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
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
        const SizedBox(
          height: 5,
        ),
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
