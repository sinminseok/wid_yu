import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wid_yu/young/account/login/widgets/AutoLoginCheckBox.dart';
import 'package:wid_yu/young/account/login/widgets/FindInformation.dart';
import 'package:wid_yu/young/account/login/widgets/LoginButton.dart';
import 'package:wid_yu/young/account/login/widgets/LoginMainText.dart';
import 'package:wid_yu/young/account/login/widgets/LoginTextForm.dart';
import 'package:wid_yu/young/account/login/widgets/SignUpText.dart';
import '../../../common/utils/Color.dart';
import 'controller/YoungLoginController.dart';

class YoungLoginView extends StatelessWidget {
  const YoungLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoungLoginController controller = YoungLoginController();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kTextBlackColor,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: kTextBlackColor,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            LoginMainText(),
            LoginTextForm(controller: controller),
            AutoLoginCheckBox(controller: controller),
            LoginButton(controller: controller),
            FindInformation(),
            SignUpText(),
          ],
        ),
      ),
    );
  }
}
