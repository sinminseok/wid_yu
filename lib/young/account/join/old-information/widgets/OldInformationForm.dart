
import 'package:flutter/cupertino.dart';
import 'package:wid_yu/young/account/join/old-information/controller/OldInformationController.dart';

import '../../../../../common/utils/widgets/TextFormWidget.dart';

class OldInformationForm extends StatelessWidget {
  final OldInformationController controller;


  OldInformationForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextFormWidget(
            textEditingController: controller.nameController,
            hintText: "예) 홍길동",
            title: '이름',
            isIntType: false,
          ),
          TextFormWidget(
            textEditingController: controller.ageController,
            title: '출생년도',
            hintText: "주민등록번호 앞6자리 예)720923",
            isIntType: true,
          ),
          TextFormWidget(
              textEditingController: controller.phoneNumberController,
              title: '연락처',
              hintText: "010 1234 5678",
              isIntType: true),
          TextFormWidget(
              textEditingController: controller.addressController,
              title: '집주소',
              hintText: "도로명 주소",
              isIntType: false),
        ],
      ),
    );
  }
}
