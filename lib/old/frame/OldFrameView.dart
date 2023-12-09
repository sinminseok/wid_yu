import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/FilePath.dart';
import '../../common/view/frame/BottomNavigationWidget.dart';
import '../album/OldAlbumView.dart';
import '../goal/OldGoalView.dart';
import '../health-information/OldHealthInformationView.dart';

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
    OldHealthInformationView()
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
        "assets/images/icon/menu-icon.png",
           "assets/images/icon/album-icon.png",
          "assets/images/icon/health-icon.png"
          ],
          ["목록", "앨범 위듀", "건강정보"],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}
