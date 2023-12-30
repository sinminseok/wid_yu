

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

class EmptyNewPhoto extends StatelessWidget {
  const EmptyNewPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          margin: EdgeInsets.only(top: 190.h),
          width: 35.w,
          height: 35.h,
          child: Image.asset("assets/images/icon/face-icon.png"),
        ),
        Container(
          margin: EdgeInsets.only(top: 16.h),
          child: Helper2Text("아직 가족이 새로운 소식을 올리지 않았아요.", wGrey500Color),
        )
      ],
    );
  }
}
