class OldHealthDetailResponse {
  int _userIdx;
  String _name;
  String? _profileImageUrl;
  double _dailyAverage;
  String _compareAverage;
  List<double> _graphData;

  // Constructor using required
  OldHealthDetailResponse({
    required int userIdx,
    required String name,
    required String? profileImageUrl,
    required double dailyAverage,
    required String compareAverage,
    required List<double> graphData,
  })  : _userIdx = userIdx,
        _name = name,
        _profileImageUrl = profileImageUrl,
        _dailyAverage = dailyAverage,
        _compareAverage = compareAverage,
        _graphData = graphData;

  // fromJson method
  factory OldHealthDetailResponse.fromJson(Map<String, dynamic> json) {
    return OldHealthDetailResponse(
      userIdx: json['userIdx'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'],

      dailyAverage: json['dailyAverage'],
      compareAverage: json['compareAverage'],
      graphData: List<double>.from(json['graphData']),
    );
  }

  List<double> get graphData => _graphData;

  String get compareAverage => _compareAverage;

  double get dailyAverage => _dailyAverage;

  String? get profileImageUrl => _profileImageUrl;

  String get name => _name;

  int get userIdx => _userIdx;
}
