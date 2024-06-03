diseases.asMap().entries.map((entry) {
         final index = entry.key;
        final disease = entry.value;}))


    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //   content: Text('동영상이 업로드 됐습니다.'),
    //   duration: Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label: '확인',
    //     onPressed: () {},
    //   ),
    // ));


Widget _buildCircularProgress() {
return Container(
margin: EdgeInsets.only(right: 15.w, top: 20.h),
width: 110.0.w,
height: 110.0.h,
child: CircularPercentIndicator(
radius: 40.0.w,
lineWidth: 6.0.sp,
percent: controller.totalInformation.percentage!,
backgroundColor: wGrey200Color,
circularStrokeCap: CircularStrokeCap.round,
center: Container(
margin: EdgeInsets.only(top: 0.h),
decoration: BoxDecoration(
border: Border.all(color: wGrey100Color),
shape: BoxShape.circle,
color: wWhiteColor,
),
height: 83.h,
width: 83.h, // 원형을 만들기 위해 width와 height를 동일하게 설정
clipBehavior: Clip.hardEdge, // 내용이 Container의 경계를 넘지 않도록 설정
child: controller.totalInformation.profileImageUrl == null
? Image.asset(
"assets/common/user/youngMan.png",
fit: BoxFit.cover, // 이미지를 Container에 맞게 조정
)
: ClipOval(
child: Image.network(
controller.totalInformation.profileImageUrl!,
fit: BoxFit.cover, // 이미지를 원에 맞게 조정
width: 83.h,
height: 83.h,
),
),
),
progressColor: wOrangeColor,
),
);
}