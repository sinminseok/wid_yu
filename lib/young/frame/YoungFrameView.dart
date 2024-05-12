import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wid_yu/common/utils/FilePath.dart';

import '../../common/view/frame/BottomNavigationWidget.dart';
import '../album/main/view/YoungAlbumView.dart';
import '../goal/main/view/YoungGoalView.dart';
import '../health-infroamtion/main/view/YoungHealthInformationView.dart';

class YoungFrameView extends StatefulWidget {
  final int index;


  YoungFrameView(this.index);

  @override
  _FrameView createState() => _FrameView();
}

class _FrameView extends State<YoungFrameView> {
  var authority;

  late int admin_selectedItem;

  @override
  void initState() {
    super.initState();

    admin_selectedItem = widget.index;
  }



  @override
  Widget build(BuildContext context) {
    final admin_screens = [
      YoungGoalView(),
      YoungAlbumView(),
      YoungHealthInformationView()
    ];

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
          ["목록", "앨범 위듀", "건강 정보"],
        ),
        body: admin_screens[admin_selectedItem]);
  }
}
