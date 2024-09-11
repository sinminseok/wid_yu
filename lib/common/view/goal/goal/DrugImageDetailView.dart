import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../../../final-dto/common-dto/response/goal/GoalTimeResponse.dart';

class DrugImageDetailView extends StatefulWidget {
  GoalTimeResponse? timeResponse;


  DrugImageDetailView(this.timeResponse);

  @override
  State<DrugImageDetailView> createState() => _DrugImageDetailViewState();
}

class _DrugImageDetailViewState extends State<DrugImageDetailView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Scaffold(

        backgroundColor: Colors.transparent,
        body: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Column(
            children: [

              _buildAppBar(),
              _buildImages(),
              //_buildDotIndex(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImages(){
    return Container(
      margin: EdgeInsets.only(top:42.h ),
      width: 380.w,
      height: 531.h,
      child: Stack(
        children: [
          PageView.builder(
            physics: BouncingScrollPhysics(),
            controller: _pageController,
            itemCount: 1, // 이미지의 개수
            itemBuilder: (context, index) {
              return Image.network(widget.timeResponse!.imgUrl!, fit: BoxFit.fitWidth,);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ],
      )
    );
  }

  Widget _buildAppBar(){
    return Container(
      margin: EdgeInsets.only(top: 55.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            child: InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: wWhiteColor,)),
          ),
          Container(
            margin: EdgeInsets.only(right: 35.w),
            child: Title3Text("${widget.timeResponse!.time}", wWhiteColor),
          ),
          Container(

          )
        ],
      ),
    );
  }

  Widget _buildDotIndex() {
    return Container(
      margin: EdgeInsets.only(top: 28.h),
      child: DotsIndicator(
        dotsCount: 4,
        position: _currentPage,
        decorator: DotsDecorator(
          color: wGrey300Color, // 비선택된 점 색상
          activeColor: Colors.orange, // 선택된 점 색상
        ),
      ),
    );
  }
}
