

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:wid_yu/common/utils/Color.dart';

import '../../../common/utils/Permission.dart';
import 'BleTileView.dart';

class BleScanView extends StatefulWidget {
  const BleScanView({Key? key}) : super(key: key);

  @override
  _BleScanViewState createState() => _BleScanViewState();
}

class _BleScanViewState extends State<BleScanView> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice connectedDevice;
  late BluetoothCharacteristic targetCharacteristic;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    startScanning();
  }

  void startScanning() {
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    flutterBlue.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (result.device.name == "ESP32") {
          // Replace "ESP32" with the actual name of your Arduino device
          connectToDevice(result.device);
          break;
        }
      }
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    if (!isScanning) {
      flutterBlue.stopScan();
      isScanning = true;
    }

    await device.connect();
    connectedDevice = device;

    List<BluetoothService> services = await device.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((characteristic) {
        if (characteristic.uuid.toString() == "eff4c89c-d2ba-40d2-875e-5d82d95457f8") {
          // Replace with the actual UUID of your characteristic
          targetCharacteristic = characteristic;
          readFromCharacteristic();
        }
      });
    });
  }

  void readFromCharacteristic() async {
    List<int> value = await targetCharacteristic.read();
    // Handle the received data as needed
    print("Received data: $value");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLE Communication'),
      ),
      body: Center(
        child: Text(
          'Waiting for data...',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }

  @override
  void dispose() {
    connectedDevice?.disconnect();
    super.dispose();
  }
}
