
import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';

class OldAlbumView extends StatefulWidget {
  const OldAlbumView({Key? key}) : super(key: key);

  @override
  _OldAlbumViewState createState() => _OldAlbumViewState();
}

class _OldAlbumViewState extends State<OldAlbumView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: false, title: '12', color: wOrangeBackGroundColor,),
    );
  }
}
