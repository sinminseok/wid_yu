

import 'package:flutter/material.dart';

class PasswordFindView extends StatefulWidget {
  const PasswordFindView({Key? key}) : super(key: key);

  @override
  _PasswordFindView createState() => _PasswordFindView();
}

class _PasswordFindView extends State<PasswordFindView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text("data"),
          ],
        ),
      ),
    );
  }
}
