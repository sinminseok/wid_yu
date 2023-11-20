import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/FilePath.dart';
import '../../common/view/frame/BottomNavigationWidget.dart';
import '../album/OldAlbumView.dart';
import '../goal/OldGoalView.dart';
import '../health-information/HealthInformationView.dart';

class OldFrameView extends StatefulWidget {
  const OldFrameView({Key? key}) : super(key: key);

  @override
  _OldFrameView createState() => _OldFrameView();
}

class _OldFrameView extends State<OldFrameView> {
  var authority;

  int admin_selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  final admin_screens = [
    OldGoalView(),
    OldAlbumView(),
    HealthInformationView()
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,


        bottomNavigationBar: BottomNavigationWidget(
          0,
              (val) {
            setState(() {
              admin_selectedItem = val;
            });
          },
          [
            commonImagePath + "icon/frame/menu_icon.png",
            commonImagePath + "icon/frame/album_icon.png",
            commonImagePath + "icon/frame/health_icon.png",
          ],
          ["목표", "앨범 위듀", "응급 알림"],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}