import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/Permission.dart';
import '../../utils/PopUp.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {


  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var bool = await Permission_handler().requestCameraPermission(context);
    if(bool == true){
      _getCurrentLocation();
    }else{
      ToastMessage().showAlertDialog(context,"위치 권한 설정","설정으로 들어가 위치 권한을 설정해주세요.");
    }
  }



  Future<void> _getCurrentLocation() async {
    try {
      // 위치 정보 요청
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Text("좌표 지정",style: TextStyle(color: Colors.black),)),
            Center(
              child: _currentPosition != null
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '위도: ${_currentPosition!.latitude}',
                    style: TextStyle(fontSize: 18,color: Colors.black),
                  ),
                  Text(
                    '경도: ${_currentPosition!.longitude}',
                    style: TextStyle(fontSize: 18, color : Colors.black),
                  ),
                ],
              )
                  : CircularProgressIndicator(),
            ),

          ],
        ),
      ),
    );
  }
}
