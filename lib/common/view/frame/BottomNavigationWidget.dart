import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        color: Colors.white,
        border: Border(
          top: BorderSide(width: 0.2, color: Colors.grey),
        ),
      ),
      child: Row(
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
          height: 70,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 14.h),
                width: MediaQuery.of(context).size.width / _iconList.length,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  child: Image.asset(
                    iconPath,
                    color: index == _selectedIndex ? Colors.black : Colors.grey,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7.h),
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(color: kTextBlackColor, fontSize: 13.sp),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
