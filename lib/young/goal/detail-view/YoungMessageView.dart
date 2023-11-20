import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/common-widget/CommonAppbar.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/FilePath.dart';
import 'package:wid_yu/young/goal/widgets/YoungMessage.dart';

class YoungMessageView extends StatefulWidget {
  const YoungMessageView({Key? key}) : super(key: key);

  @override
  _YoungMessageViewState createState() => _YoungMessageViewState();
}

class _YoungMessageViewState extends State<YoungMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: kTextWhiteColor,
      ),
      body: SingleChildScrollView(
          child: Container(
        width: 360.w,
        height: 720.h,
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (BuildContext ctx, int idx) {
              return YoungMessage();
            }),
      )),
    );
  }
}
