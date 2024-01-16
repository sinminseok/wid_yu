// import 'package:get/get.dart';
// import 'package:wid_yu/common/test-dto/goal/GoalDto.dart';
// import 'package:wid_yu/common/test-dto/health/Health.dart';
// import 'package:wid_yu/common/test-dto/reward/RewardDto.dart';
// import 'package:wid_yu/common/test-dto/user/OldDto.dart';
// import 'package:wid_yu/common/test-dto/user/YoungDto.dart';
//
// class TestController extends GetxController {
//   Rx<OldDto> _old = OldDto("김옥례", 100, 70.0, Health(97, 78, 36.6), []).obs;
//   Rx<YoungDto> _young = YoungDto("이승철", 20.0).obs;
//   List<RewardDto> _rewards = [];
//
//   void addReward(){
//       _rewards.add(RewardDto("오늘 사진관에서 찍은 사진이야!", "123", "123", 50));
//     }
//
//   void addOldGoal(GoalDto goalDto) {
//     _old.value.addGoal(goalDto);
//   }
//
//
//   List<RewardDto> get rewards => _rewards;
//
//   YoungDto get young => _young.value;
//
//   OldDto get old => _old.value;
// }
