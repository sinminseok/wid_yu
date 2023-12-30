import 'dart:ui';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

class DrugImageDetailView extends StatefulWidget {
  const DrugImageDetailView({Key? key}) : super(key: key);

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
              _buildDotIndex(),

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
            itemCount: 4, // 이미지의 개수
            itemBuilder: (context, index) {
              return Image.asset("assets/images/drug-photo.png", fit: BoxFit.fitWidth,);
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          Container(
            margin: EdgeInsets.only(top: 250.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 9.w),
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: (){
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Center(
                      child: Container(
                          width: 11.w,
                          height: 11.h,

                          child: Image.asset("assets/images/icon/back-icon.png",width: 10.w,)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 9.w),
                  width: 35.w,
                  height: 35.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 3,
                        offset: Offset(1, 1),
                      ),
                    ],
                  ),
                  child: InkWell(
                    onTap: (){
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Center(
                      child: Container(
                          width: 11.w,
                          height: 11.h,

                          child: Image.asset("assets/images/icon/next-icon.png",width: 10.w,)),
                    ),
                  ),
                ),
              ],
            ),
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
            child: Title3Text("14:00", wWhiteColor),
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
