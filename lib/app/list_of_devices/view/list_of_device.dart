import 'package:bluetooth_device_manager/app/home_view/view_model/home_controler.dart';
import 'package:bluetooth_device_manager/app/routes/routes.dart';
import 'package:bluetooth_device_manager/app/utiles/colors.dart';
import 'package:bluetooth_device_manager/app/utiles/const_space.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:provider/provider.dart';

class ListOfDevice extends StatelessWidget {
  const ListOfDevice({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeController>().newScan();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          "List of Devices",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Routes.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        backgroundColor: bgColor,
      ),
      body: RefreshIndicator(
        onRefresh: () => FlutterBluePlus.instance
            .startScan(timeout: const Duration(seconds: 4)),
        child: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Consumer<HomeController>(
                builder: (context, value, _) {
                  return Column(
                    children: [
                      DeviceFoundCustom(
                          size: size,
                          title:
                              "Device(s) found: ${value.devicesList.length}"),
                      kSizeBoxHeight20,
                      StreamBuilder(
                        stream: value.flutterBlueP.scanResults,
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? LimitedBox(
                                  maxHeight: size.height,
                                  child: ListView.separated(
                                    separatorBuilder: (context, index) {
                                      return const SizedBox();
                                    },
                                    itemCount: value.devicesList.length,
                                    itemBuilder: (context, index) {
                                      final device = value.devicesList[index];
                                      return CustomDeviceList(
                                        device: device,
                                        size: size,
                                      );
                                    },
                                  ),
                                )
                              : const Center(
                                  child: Text(
                                    "No Device found",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                );
                        },
                      ),
                      kSizeBoxHeight20,
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}

class CustomDeviceList extends StatelessWidget {
  final ScanResult? device;
  const CustomDeviceList({
    Key? key,
    required this.size,
    this.device,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        height: size.height / 14,
        width: size.width / 1.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            color: const Color.fromARGB(255, 40, 85, 144)),
        child: ListTile(
          leading: const DeviceIconsCustom(
            icon: Mdi.mobile_phone,
          ),
          title: Text(
            device!.device.name.isEmpty
                ? '(unknown device)'
                : device!.device.name,
            style: TextStyle(fontWeight: FontWeight.w500, color: white),
          ),
          subtitle: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device!.device.id.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: white, fontSize: 12),
                ),
                Text(
                  "major: ${device!.device.id.id.substring(0, 5)}",
                  style: TextStyle(
                      fontWeight: FontWeight.w300, color: white, fontSize: 13),
                ),
              ]),
          trailing: Container(
            height: size.height / 23,
            width: size.width / 6,
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 33, 191, 243),
                  Color.fromARGB(255, 74, 145, 169),
                ]),
                borderRadius: BorderRadius.circular(5),
                color: white),
            child: Center(
                child: Text(
              "Pair",
              style: TextStyle(fontWeight: FontWeight.w300, color: white),
            )),
          ),
        ),
      ),
    );
  }
}

class DeviceFoundCustom extends StatelessWidget {
  final String title;
  const DeviceFoundCustom({
    Key? key,
    required this.size,
    required this.title,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height / 20,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Color.fromARGB(255, 3, 57, 101)),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class DeviceIconsCustom extends StatelessWidget {
  final String icon;
  const DeviceIconsCustom({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(255, 0, 228, 249),
      child: CircleAvatar(
        radius: 16,
        backgroundColor: Colors.black,
        child: Iconify(
          icon,
          color: white,
          size: 15,
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;
//   final FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
//   final List<BluetoothDevice> devicesList = <BluetoothDevice>[];
//   final Map<Guid, List<int>> readValues = <Guid, List<int>>{};

//   @override
//   MyHomePageState createState() => MyHomePageState();
// }

// class MyHomePageState extends State<MyHomePage> {
//   final _writeController = TextEditingController();
//   BluetoothDevice? _connectedDevice;
//   List<BluetoothService> _services = [];

//   _addDeviceTolist(final BluetoothDevice device) {
//     if (!widget.devicesList.contains(device)) {
//       setState(() {
//         widget.devicesList.add(device);
//       });
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _writeController.dispose();
//     _services.clear();
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.flutterBlue.connectedDevices
//         .asStream()
//         .listen((List<BluetoothDevice> devices) {
//       for (BluetoothDevice device in devices) {
//         _addDeviceTolist(device);
//       }
//     });
//     widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
//       for (ScanResult result in results) {
//         _addDeviceTolist(result.device);
//       }
//     });
//     widget.flutterBlue.startScan();
//   }

//   ListView _buildListViewOfDevices() {
//     List<Widget> containers = <Widget>[];
//     for (BluetoothDevice device in widget.devicesList) {
//       containers.add(
//         SizedBox(
//           height: 50,
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Text(device.name == '' ? '(unknown device)' : device.name),
//                     Text(device.id.toString()),
//                   ],
//                 ),
//               ),
//               TextButton(
//                 child: const Text(
//                   'Connect',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () async {
//                   widget.flutterBlue.stopScan();
//                   try {
//                     await device.connect();
//                   } on PlatformException catch (e) {
//                     if (e.code != 'already_connected') {
//                       rethrow;
//                     }
//                   } finally {
//                     _services = await device.discoverServices();
//                   }
//                   setState(() {
//                     _connectedDevice = device;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   List<ButtonTheme> _buildReadWriteNotifyButton(
//       BluetoothCharacteristic characteristic) {
//     List<ButtonTheme> buttons = <ButtonTheme>[];

//     if (characteristic.properties.read) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: TextButton(
//               child: const Text('READ', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 var sub = characteristic.value.listen((value) {
//                   setState(() {
//                     widget.readValues[characteristic.uuid] = value;
//                   });
//                 });
//                 await characteristic.read();
//                 sub.cancel();
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.write) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: ElevatedButton(
//               child: const Text('WRITE', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text("Write"),
//                         content: Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: TextField(
//                                 controller: _writeController,
//                               ),
//                             ),
//                           ],
//                         ),
//                         actions: <Widget>[
//                           TextButton(
//                             child: const Text("Send"),
//                             onPressed: () {
//                               characteristic.write(
//                                   utf8.encode(_writeController.value.text));
//                               Navigator.pop(context);
//                             },
//                           ),
//                           TextButton(
//                             child: const Text("Cancel"),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.notify) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: ElevatedButton(
//               child:
//                   const Text('NOTIFY', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 characteristic.value.listen((value) {
//                   setState(() {
//                     widget.readValues[characteristic.uuid] = value;
//                   });
//                 });
//                 await characteristic.setNotifyValue(true);
//               },
//             ),
//           ),
//         ),
//       );
//     }

//     return buttons;
//   }

//   ListView _buildConnectDeviceView() {
//     List<Widget> containers = <Widget>[];

//     for (BluetoothService service in _services) {
//       List<Widget> characteristicsWidget = <Widget>[];

//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         characteristicsWidget.add(
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Text(characteristic.uuid.toString(),
//                         style: const TextStyle(fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     ..._buildReadWriteNotifyButton(characteristic),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text('Value: ${widget.readValues[characteristic.uuid]}'),
//                   ],
//                 ),
//                 const Divider(),
//               ],
//             ),
//           ),
//         );
//       }
//       containers.add(
//         ExpansionTile(
//             title: Text(service.uuid.toString()),
//             children: characteristicsWidget),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   ListView _buildView() {
//     if (_connectedDevice != null) {
//       return _buildConnectDeviceView();
//     }
//     return _buildListViewOfDevices();
//   }

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(widget.title),
//         ),
//         body: _buildView(),
//       );
// }
