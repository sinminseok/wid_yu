import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../../../common/utils/Color.dart';
import '../../../common/view/goal/goal-create/GoalCreateView.dart';

FloatingActionButton OldGoalFloatingButton() {
  return FloatingActionButton.extended(
    onPressed: () {
      Get.to(() => GoalCreateView(true));
    },
    label: Container(
      child: Text(
        " 목표생성",
        style: TextStyle(fontSize: 16),
      ),
    ),
    icon: const Icon(
      Icons.add,
      size: 20,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    foregroundColor: Colors.white,
    backgroundColor: wPurpleColor,
  );
}