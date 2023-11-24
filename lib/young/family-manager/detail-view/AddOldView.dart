import 'package:flutter/material.dart';

import '../../../common/common-widget/CommonAppbar.dart';
import '../../../common/utils/Color.dart';

class AddOldView extends StatefulWidget {
  const AddOldView({Key? key}) : super(key: key);

  @override
  _AddOldViewState createState() => _AddOldViewState();
}

class _AddOldViewState extends State<AddOldView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(canBack: true, title: '보호자 추가', color: wWhiteColor,),
    );
  }
}
