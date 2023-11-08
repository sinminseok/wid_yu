

import 'package:common/common-widget/CommonAppbar.dart';
import 'package:flutter/material.dart';

class ChangeOrderView extends StatefulWidget {
  const ChangeOrderView({Key? key}) : super(key: key);

  @override
  _ChangeOrderViewState createState() => _ChangeOrderViewState();
}

class _ChangeOrderViewState extends State<ChangeOrderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CommonAppBar(color: Colors.white,title: "순서변경", canBack: true,),
      body: SingleChildScrollView(
        child:Column(
          children: [
            _buildUserList(),
          ],
        ),
      ),
    );
  }
}

Widget _buildUserList() {
  return Container();
}
