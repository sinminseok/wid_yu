import 'package:common/common-widget/CommonAppbar.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/material.dart';

class AddOldView extends StatefulWidget {
  const AddOldView({Key? key}) : super(key: key);

  @override
  _AddOldViewState createState() => _AddOldViewState();
}

class _AddOldViewState extends State<AddOldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '보호자 추가', color: kTextWhiteColor,),
    );
  }
}
