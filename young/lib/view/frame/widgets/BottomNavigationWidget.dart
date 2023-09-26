

import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationWidget extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;
  final List<String> titleList;

  BottomNavigationWidget(
      {this.defaultSelectedIndex = 0,
        required this.iconList,
        required this.onChange,
      required this.titleList});

  @override
  _BottomNavigationWidget createState() =>
      _BottomNavigationWidget();
}

class _BottomNavigationWidget extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];
  List<String> _title =[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
    _title = widget.titleList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_title[i],_iconList[i], i));
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


  Widget buildNavBarItem(String title,IconData icon, int index) {
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
              margin: EdgeInsets.only(top: 6.h),

              width: MediaQuery.of(context).size.width / _iconList.length,

              child: Icon(
                icon,
                color: index == _selectedIndex ? Colors.black: Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7.h),
              child: Center(
                child: Text(title,style: TextStyle(color: kTextBlackColor, fontSize: 13.sp),),
              ),
            )
          ],
        ),
      )
    );
  }
}