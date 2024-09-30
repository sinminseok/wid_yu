class HealthResponse {
  int _userIdx;
  String _name;
  String? _profileUrl; // nullable로 변경
  double _dailyAverage;
  String _compareAverage;
  String _healthType;
  List<double>? _graphData;

  // 생성자
  HealthResponse({
    required int userIdx,
    required String name,
    String? profileUrl, // nullable 필드로 설정
    required double dailyAverage,
    required String compareAverage,
    required String healthType,
    required List<double>? graphData,
  })  : _userIdx = userIdx,
        _name = name,
        _profileUrl = profileUrl,
        // nullable 필드로 설정
        _dailyAverage = dailyAverage,
        _compareAverage = compareAverage,
        _healthType = healthType,
        _graphData = graphData;

  // fromJson 메서드
  factory HealthResponse.fromJson(Map<String, dynamic> json) {
    return HealthResponse(
      userIdx: json['userIdx'],
      name: json['name'],
      profileUrl: json['profileImageUrl'],
      dailyAverage: json['dailyAverage'],
      compareAverage: json['compareAverage'],
      healthType: json['healthType'],
      graphData: json['graphData'] != null ? List<double>.from(json['graphData']) : null, // null 처리 추가
    );
  }


  // Getter methods
  int get userIdx => _userIdx;

  String get name => _name;

  String? get profileUrl => _profileUrl; // nullable로 변경
  double get dailyAverage => _dailyAverage;

  String get compareAverage => _compareAverage;

  String get healthType => _healthType;

  List<double>? get graphData => _graphData;
}
