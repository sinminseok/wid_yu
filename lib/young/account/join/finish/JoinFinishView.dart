
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../common/utils/Color.dart';
import '../../../../common/view/account/SelectUserView.dart';


class JoinFinishView extends StatefulWidget {
  const JoinFinishView({Key? key}) : super(key: key);

  @override
  _JoinFinishView createState() => _JoinFinishView();
}

class _JoinFinishView extends State<JoinFinishView>  with TickerProviderStateMixin{

  late AnimationController scaleController = AnimationController(duration: const Duration(milliseconds: 1500), vsync: this);
  late Animation<double> scaleAnimation = CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
  late Animation<double> checkAnimation = CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {

    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double circleSize = 150;
    double iconSize = 108;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kLightGreyColor,

      body: InkWell(
        onTap: (){
          // Navigator.push(
          //     context,
          //     PageTransition(
          //         type: PageTransitionType.fade,
          //         child: SelectUserView(
          //
          //         )));
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.3,),
              Center(
                child: Text("환영합니다.",style: TextStyle(fontFamily: "gilogfont",fontSize: 32, color: kTextBlackColor),),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("열심히 목표를 달성해보세요.",style: TextStyle(fontSize: 20, color: kTextBlackColor),),
              ),
              SizedBox(height: size.height*0.03,),
              ScaleTransition(
                scale: scaleAnimation,
                child: Container(
                  height: circleSize,
                  width: circleSize,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                  child: SizeTransition(
                      sizeFactor: checkAnimation,
                      axis: Axis.horizontal,
                      axisAlignment: -1,
                      child: Center(
                          child: Icon(Icons.check, color: Colors.white, size: iconSize)
                      )
                  ),
                ),
              ),
              SizedBox(height: size.height*0.4,),

            ],
          ),
        ),
      ),
    );
  }
}