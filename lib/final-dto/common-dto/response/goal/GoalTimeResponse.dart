
// 최종
class GoalTimeResponse {
  int? _goalStatusIdx;
  int? _goalIdx;
  String? _time;
  int? _status; // 1 성공 0 대기 -1 실패
  int? _pillNum;
  String? _imgUrl;
  int? _point;

  GoalTimeResponse({
    required int? goalStatusIdx,
    required int? goalIdx,
    required String? time,
    required int? status,
    required int? pillNum,
    required String? imgUrl,
    required int? point,
  })  : _goalStatusIdx = goalStatusIdx,
        _goalIdx = goalIdx,
        _time = time,
        _status = status,
        _pillNum = pillNum,
        _imgUrl = imgUrl,
        _point = point;

  factory GoalTimeResponse.fromJson(Map<String, dynamic> json) {
    // JSON에서 받아온 시간 정보를 분과 시간으로 파싱합니다.
    String? timeString = json['time'];
    List<String> timeComponents = timeString!.split(':');

    // 분과 시간 정보를 가져옵니다.
    String time = '${timeComponents[0]}:${timeComponents[1]}';

    return GoalTimeResponse(
      goalStatusIdx: json['goalStatusIdx'],
      goalIdx: json['goalIdx'],
      time: time,
      status: json['status'],
      pillNum: json['pillNum'],
      imgUrl: json['imgUrl'],
      point: json['point'],
    );
  }

  int? get point => _point;

  String? get imgUrl => _imgUrl;

  int? get pillNum => _pillNum;

  int? get status => _status;

  String? get time => _time;

  int? get goalIdx => _goalIdx;

  int? get goalStatusIdx => _goalStatusIdx;
}


GoalTimeResponse goalTime1 =  GoalTimeResponse(goalStatusIdx: 1, goalIdx: 1, time: "07:01:31", status: 0, pillNum: 1, imgUrl: null, point: 20);
GoalTimeResponse goalTime2 =  GoalTimeResponse(goalStatusIdx: 2, goalIdx: 1, time: "07:01:31", status: 1, pillNum: 2, imgUrl: null, point: 20);
GoalTimeResponse goalTime3 =  GoalTimeResponse(goalStatusIdx: 3, goalIdx: 1, time: "07:01:31", status: -1, pillNum: 1, imgUrl: null, point: 20);
GoalTimeResponse goalTime4 =  GoalTimeResponse(goalStatusIdx: 4, goalIdx: 1, time: "07:01:31", status: 0, pillNum: 1, imgUrl: null, point: 20);