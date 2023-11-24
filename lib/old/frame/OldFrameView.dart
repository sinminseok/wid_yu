import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/FilePath.dart';
import '../../common/view/frame/BottomNavigationWidget.dart';
import '../album/OldAlbumView.dart';
import '../goal/OldGoalView.dart';
import '../health-information/HealthInformationView.dart';

class OldFrameView extends StatefulWidget {
  final int index;

  OldFrameView(this.index);

  @override
  _OldFrameView createState() => _OldFrameView();
}

class _OldFrameView extends State<OldFrameView> {
  var authority;

  late int admin_selectedItem;

  @override
  void initState() {
    admin_selectedItem = widget.index;
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
          widget.index,
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
          ["목표", "앨범 위듀", "건강정보"],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}
