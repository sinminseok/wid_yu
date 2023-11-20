import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:old/view/album/OldAlbumView.dart';
import 'package:old/view/frame/widgets/BottomNavigationWidget.dart';
import 'package:old/view/goal/OldGoalView.dart';

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
          iconList: [
            Icons.menu,
            Icons.bookmark,
            Icons.alarm,
          ],
          onChange: (val) {
            setState(() {
              admin_selectedItem = val;
            });
          },
          defaultSelectedIndex: 0, titleList: [
            "목룍",
          "앨범 위듀",
          "건강 정보"
        ],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}