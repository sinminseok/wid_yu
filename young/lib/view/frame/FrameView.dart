import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:young/view/alarm/AlarmView.dart';
import 'package:young/view/album/AlbumView.dart';
import 'package:young/view/frame/widgets/BottomNavigationWidget.dart';
import 'package:young/view/goal/GoalView.dart';

class FrameView extends StatefulWidget {
  const FrameView({Key? key}) : super(key: key);

  @override
  _FrameView createState() => _FrameView();
}

class _FrameView extends State<FrameView> {
  var authority;

  int admin_selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  final admin_screens = [
    GoalView(),
    AlbumView(),
    AlarmView()
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