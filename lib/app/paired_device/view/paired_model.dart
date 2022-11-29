import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:bluetooth_device_manager/app/utiles/colors.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';

class PairedDevice extends StatelessWidget {
  const PairedDevice({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "Paired  Device",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Routes.back();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: bgColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: size.height / 20,
              width: size.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  color: Color.fromARGB(255, 3, 57, 101)),
            ),
            kSizeBoxHeight20,
            Container(
              height: size.height / 14,
              width: size.width / 1.1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: const Color.fromARGB(255, 40, 85, 144)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 0, 228, 249),
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.black,
                    child: Iconify(
                      Mdi.mobile_phone,
                      color: white,
                      size: 15,
                    ),
                  ),
                ),
                title: Text(
                  "Airpodes",
                  style: TextStyle(fontWeight: FontWeight.w500, color: white),
                ),
                subtitle: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "9D:80:29:DE:60",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: white,
                        ),
                      ),
                      Text(
                        "major:513",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, color: white),
                      ),
                    ]),
                trailing: Container(
                  height: size.height / 23,
                  width: size.width / 6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          width: 3,
                          style: BorderStyle.solid,
                          color: const Color.fromARGB(255, 7, 247, 255)),
                      color: const Color.fromARGB(255, 0, 40, 72)),
                  child: Center(
                      child: Text(
                    "Unpair",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: white,
                        fontSize: 13),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
