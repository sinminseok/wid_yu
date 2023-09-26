
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddUserWidget extends StatelessWidget {
  final String title;
  final String subTitle;


  AddUserWidget(this.title, this.subTitle);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 290.w,
      height: 100.h,
      decoration: BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 20.h),
                child: Text(title,style: TextStyle(color: kTextBlackColor, fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 5.h),
                child: Text(subTitle,style: TextStyle(color: kTextBlackColor),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
