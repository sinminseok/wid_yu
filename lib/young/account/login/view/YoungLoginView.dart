import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wid_yu/common/common-widget/appbar/CommonAppbar.dart';
import 'package:wid_yu/young/account/login/widgets/AutoLoginCheckBox.dart';
import 'package:wid_yu/young/account/login/widgets/FindInformation.dart';
import 'package:wid_yu/young/account/login/widgets/LoginButton.dart';
import 'package:wid_yu/young/account/login/widgets/LoginMainText.dart';
import 'package:wid_yu/young/account/login/widgets/LoginTextForm.dart';
import 'package:wid_yu/young/account/login/widgets/SignUpText.dart';
import '../../../../common/utils/Color.dart';
import '../controller/YoungLoginController.dart';

class YoungLoginView extends StatelessWidget {
  const YoungLoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final YoungLoginController controller = YoungLoginController();

    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: Scaffold(
        appBar: CommonAppBar(canBack: true,title: "",color: wWhiteColor,),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
      ),
    );
  }
}
