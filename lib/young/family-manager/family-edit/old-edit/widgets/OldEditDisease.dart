import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldDiseaseController.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldEditController.dart';

import '../../../../../common/dto/disease/Disease.dart';
import '../dto/OldEditDiseaseRequest.dart';

class OldEditDisease extends StatefulWidget {
  OldEditByYoungController controller;

  OldEditDisease(this.controller);

  @override
  State<OldEditDisease> createState() => _OldEditDiseaseState();
}

class _OldEditDiseaseState extends State<OldEditDisease> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            InkWell(
              onTap: (){
                widget.controller.editInformation();
              },
              child: Container(
                child: Body2Text("dasdasd", kTextBlackColor),
              ),
            ),
            _buildDiseases(),
            _buildAddButton()],
        );
  }


  Widget _buildDiseases() {
    if (widget.controller.diseases.length == 0) {
      return Container();

    }
    List<Widget> diseaseCards = [];

    for (int i = 0; i < widget.controller.diseases.length; i++) {
      Widget diseaseCard = _buildDiseaseCard(
        i,
        widget.controller.diseases[i],
        widget.controller.diseaseControllers[i],
        widget.controller.drugNameControllers[i],
        widget.controller.explainControllers[i],
      );

      diseaseCards.add(diseaseCard);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: diseaseCards,
    );
  }

  Widget _buildDiseaseCard(
      int index,
      OldEditDiseaseRequest diseaseRequest,
      TextEditingController _nameController,
      TextEditingController _drugController,
      TextEditingController _informationController) {
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
      decoration: BoxDecoration(
          border: Border.all(color: wGrey100Color),
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                margin: EdgeInsets.only(right: 15.w, top: 10.h, bottom: 5.h),
                width: 18.w,
                height: 18.h,
                child: InkWell(
                    onTap: () {
                      widget.controller.deleteDeisease(index, diseaseRequest);
                      setState(() {

                      });
                    },
                    child: Icon(
                      Icons.cancel,
                      color: wGrey600Color,
                    )),
              )
            ],
          ),
          _buildDiseaseNameForm(_nameController),
          _buildDivider(),
          _buildDrugForm(_drugController),
          _buildDivider(),
          _buildInformationForm(_informationController)
        ],
      ),
    );
  }

  Widget _buildDiseaseNameForm(TextEditingController _controller) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("질병 이름", wGrey600Color),
          ),
          Container(
            width: 90.w,
            child: TextFormField(
              onChanged: (value) {},
              controller: _controller,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.right,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                hintText: "질병 이름",
                hintStyle: TextStyle(
                    color: wGrey300Color, fontSize: 16.sp, fontFamily: "Body1"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrugForm(TextEditingController _controller) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("복용 중인 약", wGrey600Color),
          ),
          Container(
            width: 90.w,
            child: TextFormField(
              onChanged: (value) {},
              controller: _controller,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.right,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                hintText: "복용중인 약",
                hintStyle: TextStyle(
                    color: wGrey300Color, fontSize: 16.sp, fontFamily: "Body1"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInformationForm(TextEditingController _controller) {
    return Container(
      margin: EdgeInsets.only(top: 16.h, bottom: 14.h, left: 16.w, right: 16.w),
      width: 310.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 21.h,
            child: SubTitle2Text("설명", wGrey600Color),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.h),
            width: 330.w,
            child: TextFormField(
              onChanged: (value) {},
              controller: _controller,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
              maxLines: null,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 3.h),
                hintText: "설명",
                hintStyle: TextStyle(
                    color: wGrey300Color, fontSize: 16.sp, fontFamily: "Body1"),
                border: InputBorder.none,
                isDense: true, // 덴스한 디자인을 사용하여 높이를 줄임
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddButton() {
    return Container(
      margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 16.h),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
          color: wWhiteColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: wGrey100Color)),
      child: InkWell(
        onTap: () {
          widget.controller.addDisease();
          setState(() {

          });
        },
        child: Container(
          margin: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              Container(
                  width: 15.w,
                  height: 15.h,
                  child: Image.asset("assets/images/icon/add-icon.png")),
              Container(
                margin: EdgeInsets.only(left: 10.w, top: 5.h),
                width: 70.w,
                height: 24.h,
                child: ButtonText("질병 추가", wGrey800Color),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      margin: EdgeInsets.only(left: 15.w, right: 15.w),
      width: 308.w,
      height: 1.h,
      color: wGrey300Color,
    );
  }
}
