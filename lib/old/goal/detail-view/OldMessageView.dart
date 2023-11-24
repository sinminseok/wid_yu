import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/old/goal/widgets/OldMessageWidget.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';

class OldMessageView extends StatefulWidget {
  const OldMessageView({Key? key}) : super(key: key);

  @override
  _OldMessageViewState createState() => _OldMessageViewState();
}

class _OldMessageViewState extends State<OldMessageView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '알림',
        color: wWhiteColor,
      ),
      body: SingleChildScrollView(
          child: Container(
            width: 360.w,
            height: 720.h,
            child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext ctx, int idx) {
                  return OldMessageWidget();
                }),
          )),
    );
  }
}
