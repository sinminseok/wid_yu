

import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdFindfView extends StatefulWidget {
  const IdFindfView({Key? key}) : super(key: key);

  @override
  _IdFindfViewState createState() => _IdFindfViewState();
}

class _IdFindfViewState extends State<IdFindfView> {

  TextEditingController _nameContrller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(
          margin: EdgeInsets.only(
            top: 20.h,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_outlined, // 사용할 아이콘
              color: Colors.black, // 아이콘 색상
            ),
            onPressed: () {
              Navigator.pop(context);
              // 뒤로 가기 버튼이 눌렸을 때 수행할 동작
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMainText(),
          ],
        ),
      ),
    );
  }

  Widget _buildMainText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30.h),
            child: Text("아이디 찾기",style: TextStyle(color: kTextBlackColor,fontWeight: FontWeight.bold, fontSize: 20.sp),),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5.h),
          child: Text("아이디 찾기를 위한 정보를 입력해주세요.",style: TextStyle(color: kTextBlackColor, fontSize: 15.sp),),
        ),
      ],
    );
  }

}
