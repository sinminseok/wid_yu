

import 'package:flutter/material.dart';

class PassswordFindView extends StatefulWidget {
  const PassswordFindView({Key? key}) : super(key: key);

  @override
  _PassswordFindViewState createState() => _PassswordFindViewState();
}

class _PassswordFindViewState extends State<PassswordFindView> {
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
