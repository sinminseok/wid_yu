
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wid_yu/common/utils/Color.dart';
class Permission_handler{

  Future<bool> requestBLUE(BuildContext context) async {
    print("start ble request");
    PermissionStatus status = await Permission.bluetooth.request();

    if(!status.isGranted){// 허용이 안된 경우
      print("허용안됨");
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("권한 설정을 확인해주세요."),
              actions: [
                InkWell(
                  onTap: (){
                    openAppSettings(); //
                  },
                  child: Container(
                    child: Text("설정하기", style: TextStyle(color: wTextBlackColor),),
                  ),
                ),

                // FlatButton(
                //     onPressed: () {
                //       openAppSettings(); // 앱 설정으로 이동
                //     },
                //     child: Text('설정하기')),
              ],
            );
          });
      return false;
    }
    print("허용됨");
    return true;
  }





  Future<bool> requestCameraPermission(BuildContext context) async {

    PermissionStatus status = await Permission.location.request();
    if(!status.isGranted) { // 허용이 안된 경우
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("권한 설정을 확인해주세요."),
              actions: [
                TextButton(
                    onPressed: () {
                      openAppSettings(); // 앱 설정으로 이동
                    },
                    child: Text('설정하기')),
              ],
            );
          });
      return false;
    }
    return true;
  }
}