
import 'package:flutter/material.dart';

class CustomSnackBar {
  void show(BuildContext context, String title){
    ScaffoldMessenger.of(context).showSnackBar(
      //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨.
        SnackBar(
          content: Text('${title}'), //snack bar의 내용. icon, button같은것도 가능하다.
          duration: Duration(seconds: 5), //올라와있는 시간
          action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
            label: 'Undo', //버튼이름
            onPressed: (){}, //버튼 눌렀을때.
          ),
        )
    );
  }
}