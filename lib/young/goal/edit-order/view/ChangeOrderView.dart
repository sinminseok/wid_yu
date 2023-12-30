import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../common/utils/Color.dart';
import '../../../../common/utils/FilePath.dart';

class ChangeOrderView extends StatefulWidget {
  const ChangeOrderView({Key? key}) : super(key: key);

  @override
  _ChangeOrderViewState createState() => _ChangeOrderViewState();
}

class _ChangeOrderViewState extends State<ChangeOrderView> {
  final List<int> _items = List<int>.generate(5, (int index) => index);


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Container> cards = <Container>[
      for (int index = 0; index < _items.length; index += 1)
        Container(
          key: Key('$index'),
          child: Container(
            child: Container(
              margin: EdgeInsets.only(top: 30.h),
              width: 360.w,
              height: 70.h,
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.w),
                    width: 40.w,
                    height: 40.h,
                    child: Image.asset(commonImagePath + "user/youngMan.png"),
                  ),
                  Container(
                    child: Text(
                      "보호자 님 (나)",
                      style: TextStyle(
                          color: wTextBlackColor,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ),
        )
        // Card(
        //   key: Key('$index'),
        //   color: _items[index].isOdd ? wOrangeColor : wOrangeBackGroundColor,
        //   child: SizedBox(
        //     height: 80,
        //     child: Center(
        //       child: Text('Card ${_items[index]}'),
        //     ),
        //   ),
        // ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(
        color: Colors.white,
        title: "순서변경",
        canBack: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildMyProfile(),
            _buildFamilyList(cards),
          ],
        ),
      ),
    );
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        final double animValue = Curves.easeInOut.transform(animation.value);
        final double elevation = lerpDouble(0, 6, animValue)!;
        return Material(
          elevation: elevation,
          color: Colors.blue,
          shadowColor: Colors.grey,
          child: child,
        );
      },
      child: child,
    );
  }

  Widget _buildFamilyList(List<Container> cards) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
        height: 500.h,
        width: 360.w,
        child: ReorderableListView(
          onReorder: (int oldIndex, int newIndex) {
            setState(() {
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              final int item = _items.removeAt(oldIndex);
              _items.insert(newIndex, item);
            });
          },
          children: cards,
        ));
  }

  Widget _buildMyProfile() {
    return Container(
      margin: EdgeInsets.only(top: 30.h),
      width: 360.w,
      height: 70.h,
      color: Colors.grey.shade50,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.w),
            width: 40.w,
            height: 40.h,
            child: Image.asset(commonImagePath + "user/youngMan.png"),
          ),
          Container(
            child: Text(
              "보호자 님 (나)",
              style: TextStyle(
                  color: wTextBlackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
