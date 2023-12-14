import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/young/health-infroamtion/controller/YoungHealthInformationController.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/CurrentPosition.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/HealthFloatingButton.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/HealthInformation.dart';
import 'package:wid_yu/young/health-infroamtion/widgets/SideBarUsers.dart';

import '../../common/utils/Color.dart';

class BleYoungHealthInformationView extends StatefulWidget {
  const BleYoungHealthInformationView({Key? key}) : super(key: key);

  @override
  _BleYoungHealthInformationView createState() =>
      _BleYoungHealthInformationView();
}

class _BleYoungHealthInformationView
    extends State<BleYoungHealthInformationView> {
  YoungHealthInformationController controller =
      YoungHealthInformationController();

  FlutterBlue flutterBlue = FlutterBlue.instance;
  late BluetoothDevice connectedDevice;
  late BluetoothCharacteristic targetCharacteristic;
  bool isScanning = false;

  @override
  void initState() {
    super.initState();
    controller.initPickUser();
   // startScanning();
  }

  @override
  void dispose() {
    connectedDevice?.disconnect();
    super.dispose();
  }



  Future<List<int>> connectToDeviceAndReadData() async {
    startScanning(); // 기기 스캔 및 연결
    return readFromCharacteristic(); // 특성에서 데이터 읽기
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
  }

  Future<List<int>> readFromCharacteristic() async {
    List<BluetoothService> services = await connectedDevice.discoverServices();
    services.forEach((service) {
      service.characteristics.forEach((characteristic) {
        if (characteristic.uuid.toString() == "eff4c89c-d2ba-40d2-875e-5d82d95457f8") {
          // Replace with the actual UUID of your characteristic
          //
          targetCharacteristic = characteristic;
        }
      });
    });
    var list = await targetCharacteristic.read();
    var list2 = await targetCharacteristic.value;
  //  print(list);
    return list;
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: HealthFloatingButton(controller),
        backgroundColor: wPurpleBackGroundColor,
        appBar: _buildAppBar(),
        body: FutureBuilder(
            future: connectToDeviceAndReadData(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              //해당 부분은 data를 아직 받아 오지 못했을 때 실행되는 부분
              if (snapshot.hasData == false) {
                return CircularProgressIndicator(); // CircularProgressIndicator : 로딩 에니메이션
              }

              //error가 발생하게 될 경우 반환하게 되는 부분
              else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Error: ${snapshot.error}', // 에러명을 텍스트에 뿌려줌
                    style: TextStyle(fontSize: 15),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SideBarUsers(
                            controller: controller,
                          ),
                          Container(
                              width: 290.w,
                              margin: EdgeInsets.only(top: 10.h),
                              decoration: BoxDecoration(
                                  color: wWhiteColor,
                                  border: Border(
                                    top: BorderSide(color: wGrey100Color),
                                    bottom: BorderSide(color: wGrey100Color),
                                  )),
                              child: Column(
                                children: [
                                  HealthInformation(controller: controller),
                                  CurrentPosition(controller: controller)
                                ],
                              ))
                        ],
                      )
                    ],
                  ),
                );
              }
            }));
  }

  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: wPurpleBackGroundColor,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 47.w,
                  height: 30.h,
                  margin: EdgeInsets.only(top: 10.h, left: 10.w),
                  child: Image.asset("assets/common/common/appbar_logo.png"),
                ),
                Row(
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w, top: 10.h),
                          width: 30.w,
                          height: 30.h,
                          child: Image.asset(
                              "assets/common/icon/family-information-icon.png"),
                        )),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
