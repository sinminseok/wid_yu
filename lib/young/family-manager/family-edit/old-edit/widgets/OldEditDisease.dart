
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wid_yu/common/model/disease/Disease.dart';
import 'package:wid_yu/common/utils/CustomText.dart';
import 'package:wid_yu/common/utils/Color.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldDiseaseController.dart';
import 'package:wid_yu/young/family-manager/family-edit/old-edit/controller/OldEditController.dart';

class OldEditDisease extends StatelessWidget {
  OldDiseaseEditByYoungController controller;

  OldEditDisease(this.controller);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        _buildDiseases(),
        _buildAddButton()
      ],
    ));
  }

  Widget _buildDiseases(){
    if(controller.disease.length == 0){
      return Container();
    }
    List<Widget> diseaseCards = [];

    for (int i = 0; i < controller.disease.length; i++) {
      Widget diseaseCard = _buildDiseaseCard(
        controller.disease[i],
        controller.diseaseNameControllers[i],
        controller.drugNameControllers[i],
        controller.informationNameControllers[i],
      );

      diseaseCards.add(diseaseCard);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: diseaseCards,
    );
  }


  Widget _buildDiseaseCard(Disease disease, TextEditingController _nameController, TextEditingController _drugController, TextEditingController _informationController) {
    return Container(
      width: 335.w,
      margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: wGrey100Color),
        color: wWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(

              ),
              Container(
                margin: EdgeInsets.only(right: 15.w,top: 10.h,bottom: 5.h),
                width: 18.w,
                height: 18.h,
                child: InkWell(
                    onTap: (){
                      controller.deleteDisease(disease);
                    },
                    child: Icon(Icons.cancel, color: wGrey600Color,)),
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



  Widget _buildDiseaseNameForm(TextEditingController _controller){
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
              onChanged: (value) {

              },
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

  Widget _buildDrugForm(TextEditingController _controller){
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
              onChanged: (value) {

              },
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

  Widget _buildInformationForm(TextEditingController _controller){
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
              onChanged: (value) {

              },
              controller: _controller,
              style: TextStyle(color: Colors.black),
              // 텍스트 색상을 검정색으로 설정
              textAlign: TextAlign.left,
              // 텍스트를 왼쪽으로 정렬
              cursorColor: kTextBlackColor,
                maxLines : null,
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

  Widget _buildAddButton(){
    return Container(
      margin: EdgeInsets.only(right: 20.w, left: 20.w, top: 16.h),
      width: 335.w,
      height: 52.h,
      decoration: BoxDecoration(
        color: wWhiteColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: wGrey100Color)
      ),
      child: InkWell(
        onTap: (){

        },
        child: Container(
          margin: EdgeInsets.only(left: 16.w),
          child: Row(
            children: [
              Container(
                width: 15.w,
                height: 15.h,
                child: Image.asset("assets/images/icon/add-icon.png")
              ),
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
