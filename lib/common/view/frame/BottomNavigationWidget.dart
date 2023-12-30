import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/CustomText.dart';

import '../../utils/Color.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<String> iconImagePaths;
  final List<String> titleList;

  BottomNavigationWidget(this.defaultSelectedIndex, this.onChange,
      this.iconImagePaths, this.titleList);

  @override
  _BottomNavigationWidget createState() => _BottomNavigationWidget();
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  List<String> _iconList = [];
  List<String> _title = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconImagePaths;
    _title = widget.titleList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_title[i], _iconList[i], i));
    }

    return Container(
      decoration: BoxDecoration(
        color: wWhiteColor,
        border: Border(
          top: BorderSide(width: 1, color: wGrey200Color),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _navBarItemList,
      ),
    );
  }

  Widget buildNavBarItem(String title, String iconPath, int index) {
    return GestureDetector(
        onTap: () {
          widget.onChange(index);
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Container(

          height: 85.h,
          width: 120.w,
          child: Column(
            children: [
              Container(
                width: 25.w,
                height: 21.h,
                margin: EdgeInsets.only(top: 15.h),
                child: Image.asset(
                  iconPath,
                  color:
                      index == _selectedIndex ? wGrey800Color : wGrey400Color,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.h),
                child: Center(
                  child: HelperText(
                    title,
                    index == _selectedIndex ? wGrey800Color : wGrey400Color,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
