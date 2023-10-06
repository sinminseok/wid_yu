

import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  void showtoast(String message) async {
    Fluttertoast.showToast(
      msg: message,
      timeInSecForIosWeb: 2,
      textColor: Colors.black,
      backgroundColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  showAlertDialog(BuildContext context, String title, String content) {
    // set up the AlertDialog
    Widget okButton = TextButton(
      child: Text("확인",style: TextStyle(color: kTextBlackColor),),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text(title,style: TextStyle(color: kTextBlackColor),),
      content: Text(content, style: TextStyle(color: kTextBlackColor),),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}