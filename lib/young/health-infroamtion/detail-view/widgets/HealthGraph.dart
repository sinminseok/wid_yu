import 'dart:math';

import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wid_yu/common/utils/Color.dart';

class HealthGraph extends StatefulWidget {
  List<double> data;

  HealthGraph(this.data);

  @override
  State<HealthGraph> createState() => _HealthGraphState();
}

class _HealthGraphState extends State<HealthGraph> {
  late int average;
  late int maxValue;
  late int minValue;

  @override
  void initState() {
    // TODO: implement initState
    average = calculateAverage();
    maxValue = calculateMaxValue();
    minValue = calculateMinValue();
    super.initState();
  }

  int calculateMaxValue(){
    if (widget.data.isEmpty) {
      return 0; // or throw an exception, depending on your use case
    }

    return widget.data.reduce((maxValue, element) => max(maxValue, element)).toInt();
  }

  int calculateMinValue() {
    if (widget.data.isEmpty) {
      return 0; // or throw an exception, depending on your use case
    }

    return widget.data.reduce((minValue, element) => min(minValue, element)).toInt();
  }

  int calculateAverage() {
    if (widget.data.isEmpty) {
      return 0; // or throw an exception, depending on your use case
    }

    int sum = 0;
    for (double value in widget.data) {
      sum += value.toInt();
    }
    return sum ~/ widget.data.length; // Use integer division for an integer result
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 305.w,
                height: 260.h,

                margin: EdgeInsets.only(left: 0.w, right: 0.w, bottom: 20.h),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin:
                              EdgeInsets.only(left: 6.w, right: 0.w, bottom: 20.h),
                              child: Sparkline(
                                useCubicSmoothing: true,
                                pointsMode: PointsMode.all,
                                lineColor: wYellowColor,
                                fillMode: FillMode.below,
                                fillGradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [wYellowColor, wYellow100Color],
                                ),
                                max: widget.data.reduce(max) + 2.5.h,
                                pointSize: 8.0,
                                fallbackHeight: 200.h,
                                pointColor: kPrimaryColor,
                                lineWidth: 2.0,
                                fallbackWidth: 1310.w,
                                sharpCorners: true,
                                data: widget.data,
                              ),
                            ),
                            Chart_Bottom()
                          ],
                        ),
                      ],
                    )),
              ),
              Container(
                width: 35.w,
                height: 200.h,
                margin: EdgeInsets.only(right: 10.w, bottom: 70.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("${maxValue}", style: TextStyle(color: wGrey300Color),),
                    ),
                    Container(
                      child: Text("${average}", style: TextStyle(color: wGrey300Color),),
                    ),
                    Container(
                      child: Text("${minValue}", style: TextStyle(color: wGrey300Color),),
                    )
                  ],
                ),
              )
            ],
          )
        ),
      ],
    );
  }



  Widget Chart_Bottom() {
    return Container(
      margin: EdgeInsets.only(left: 0.w),
      width: 1330.w,
      child: Row(
        children: List.generate(
          24,
          (hour) => Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 7.h),
                      width: 6.w,
                      height: 6.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: wGrey300Color,
                      ),
                    ),
                    if (hour < 23)
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.w),
                        width: 15.w,
                        height: 1.w,
                        child: CustomPaint(
                          painter: DashedLinePainter(),
                        ),
                      ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 4.h, right: 20.w),
                  child: Text(
                    "${hour + 1}시",
                    style: TextStyle(color: wGrey300Color, fontSize: 12.sp),
                  ),
                ),
                // Add a dashed line between each hour
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = wGrey300Color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    double dashWidth = 3.0; // Increase the dash width
    double dashSpace = 2.0; // No space between dashes

    double startY = size.height / 1;
    double endX = 60.w;

    double currentX = 0;

    while (currentX < endX) {
      canvas.drawLine(
        Offset(currentX, startY),
        Offset(currentX + dashWidth, startY),
        paint,
      );
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
