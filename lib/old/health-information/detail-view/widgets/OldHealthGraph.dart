

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/utils/Color.dart';

class OldHealthGraph extends StatefulWidget {
  List<double> data;


  OldHealthGraph(this.data);

  @override
  _OldHealthGraphState createState() => _OldHealthGraphState();
}

class _OldHealthGraphState extends State<OldHealthGraph> {
  Color stateColor = wYellowColor;

  List<Color> gradientColors = [
    wYellowColor,
    wYellow100Color,
  ];

  late int average;
  late int maxValue;
  late int minValue;

  @override
  void initState() {
    super.initState();
    average = calculateAverage();
    maxValue = calculateMaxValue();
    minValue = calculateMinValue();
  }

  int calculateMaxValue() {
    if (widget.data.isEmpty) {
      return 0;
    }
    return widget.data
        .reduce((maxValue, element) => max(maxValue, element))
        .toInt();
  }

  int calculateMinValue() {
    if (widget.data.isEmpty) {
      return 0;
    }
    return widget.data
        .reduce((minValue, element) => min(minValue, element))
        .toInt();
  }

  int calculateAverage() {
    if (widget.data.isEmpty) {
      return 0;
    }
    int sum = widget.data.reduce((value, element) => value + element).toInt();
    return sum ~/ widget.data.length;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10.h,left: 15.w),
          child: Row(
            children: [
              Container(
                child: Text("PR bpm", style: TextStyle(color: wTextBlackColor, fontSize: 14.sp, fontWeight: FontWeight.w600),),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w
                ),
                child: Text("2023.10.24", style: TextStyle(color: wGrey500Color, fontSize: 14.sp, fontWeight: FontWeight.w500),),
              )
            ],
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 290.w,
                  height: 270.h,
                  margin: EdgeInsets.only(left: 7.w, right: 0.w, bottom: 0.h, top: 10.h),
                  child:Column(
                    children: [
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 1370.w,
                                height: 200.h,// Set a finite width for LineChart

                                child: LineChart(
                                  LineChartData(
                                    // 터치 데이터 설정
                                    lineTouchData: LineTouchData(
                                      touchTooltipData: LineTouchTooltipData(
                                        tooltipBgColor: stateColor,
                                        getTooltipItems: (List<LineBarSpot> touchedSpots) {
                                          return touchedSpots.map((LineBarSpot touchedSpot) {
                                            // 터치한 지점에 대한 툴팁 아이템 생성
                                            return LineTooltipItem(
                                              "${touchedSpot.y}", // 여기에 값을 변경할 수 있습니다.
                                              TextStyle(color: wWhiteColor),
                                            );
                                          }).toList();
                                        },
                                      ),
                                      handleBuiltInTouches: true,
                                    ),
                                    gridData: FlGridData(
                                      show: false,
                                      drawHorizontalLine: false,
                                    ),
                                    titlesData: FlTitlesData(
                                      show: true,
                                      leftTitles: SideTitles(
                                        showTitles: false,
                                      ),
                                    ),


                                    //add
                                    borderData: FlBorderData(
                                      show: true,
                                      border: Border.all(color: wWhiteColor),
                                    ),
                                    minX: -0.4.w,
                                    maxX: widget.data.length.toDouble() - 1,
                                    minY: 0,
                                    maxY: widget.data
                                        .reduce((maxValue, element) =>
                                        max(maxValue, element))
                                        .toDouble() +
                                        18.5,
                                    lineBarsData: [
                                      LineChartBarData(
                                        spots: List.generate(
                                          widget.data.length,
                                              (index) =>
                                              FlSpot(index.toDouble(), widget.data[index]),
                                        ),
                                        isCurved: true,
                                        colors: [stateColor, stateColor],
                                        dotData: FlDotData(show: false),
                                        belowBarData: BarAreaData(
                                          show: true,
                                          gradientFrom: Offset(0, 0),  // 시작 지점
                                          gradientTo: Offset(0, 1),
                                          colors: gradientColors,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Chart_Bottom()
                            ],
                          )
                      ),
                    ],
                  )
              ),
              Container(
                width: 25.w,
                height: 170.h,
                margin: EdgeInsets.only(right: 3.w, bottom: 30.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text("${maxValue}",
                          style: TextStyle(color: wGrey300Color)),
                    ),
                    Container(
                      child: Text("${average}",
                          style: TextStyle(color: wGrey300Color)),
                    ),
                    Container(
                      child: Text("${minValue}",
                          style: TextStyle(color: wGrey300Color)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Chart_Bottom() {
    return Container(
      margin: EdgeInsets.only(left: 20.w),
      width: 1350.w,
      height: 40.h,
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
