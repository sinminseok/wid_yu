import 'package:common/model/disease/Disease.dart';
import 'package:common/utils/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'DiseaseTextBox.dart';

class DiseaseWidget extends StatelessWidget {
  final Disease disease;

  DiseaseWidget({required this.disease});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      width: 340.w,

      decoration: BoxDecoration(
          color: kLightGreyColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          DiseaseTextBox("질병 이름", disease.diseaseName),
          DiseaseTextBox("복용중인 약", disease.drug),
          DiseaseTextBox("자주가는 병원", disease.diseaseName),
          Container(
            width: 310.w,
            margin: EdgeInsets.only(top: 10.h, bottom: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("설명", style: TextStyle(color: kTextBlackColor),),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.h),
                  child: Text("${disease.introduce}", style: TextStyle(color: kTextBlackColor),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
