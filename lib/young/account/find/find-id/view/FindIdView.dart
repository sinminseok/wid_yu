import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/young/account/find/find-id/controller/FindIdController.dart';
import 'package:wid_yu/young/account/find/find-id/widgets/FindIdButton.dart';
import 'package:wid_yu/young/account/find/find-id/widgets/FindIdMainText.dart';
import 'package:wid_yu/young/account/find/find-id/widgets/IdPhoneNumberForm.dart';
import 'package:wid_yu/young/account/find/find-id/widgets/VerityNumberForm.dart';

import '../../../../../common/common-widget/appbar/CommonAppbar.dart';
import '../../../../../common/common-widget/button/OrangeButton.dart';
import '../../../../../common/utils/Color.dart';

class FindIdView extends StatefulWidget {
  const FindIdView({Key? key}) : super(key: key);

  @override
  State<FindIdView> createState() => _FindIdViewState();
}

class _FindIdViewState extends State<FindIdView> {
  FindIdController controller = FindIdController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        canBack: true,
        title: '',
        color: wWhiteColor,
      ),
      backgroundColor: wWhiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            FindIdMainText(controller),
            IdPhoneNumberForm(controller),
            VerityNumberForm(controller),
            FindIdButton(controller),
          ],
        ),
      ),
    );
  }
}
