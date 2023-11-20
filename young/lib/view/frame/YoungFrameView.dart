import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:young/view/album/YoungAlbumView.dart';
import 'package:young/view/frame/widgets/BottomNavigationWidget.dart';
import 'package:young/view/goal/YoungGoalView.dart';

import '../health-infroamtion/YoungAlarmView.dart';

class YoungFrameView extends StatefulWidget {
  const YoungFrameView({Key? key}) : super(key: key);

  @override
  _FrameView createState() => _FrameView();
}

class _FrameView extends State<YoungFrameView> {
  var authority;

  int admin_selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  final admin_screens = [
    YoungGoalView(),
    YoungAlbumView(),
    YoungHealthInformationView()
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
            "목표",
          "앨범 위듀",
          "응급 알림"
        ],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}