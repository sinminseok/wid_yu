class OldHealthResponse {
  final int _userIdx;
  final String _name;
  final String _profileImageUrl;
  final double _latitude;
  final double _longitude;
  final double _heartBit;
  final int _state;

  // Constructor with required parameters
  OldHealthResponse({
    required int userIdx,
    required String name,
    required String profileImageUrl,
    required double latitude,
    required double longitude,
    required double heartBit,
    required int state,
  })  : _userIdx = userIdx,
        _name = name,
        _profileImageUrl = profileImageUrl,
        _latitude = latitude,
        _longitude = longitude,
        _heartBit = heartBit,
        _state = state;

  // fromJson method
  factory OldHealthResponse.fromJson(Map<String, dynamic> json) {
    return OldHealthResponse(
      userIdx: json['userIdx'],
      name: json['name'],
      profileImageUrl: json['profileImageUrl'] ?? '', // Handle null profileImageUrl
      latitude: json['latitude'],
      longitude: json['longitude'],
      heartBit: json['heartBit'],
      state: json['state'],
    );
  }

  int get state => _state;
  double get heartBit => _heartBit;
  double get longitude => _longitude;
  double get latitude => _latitude;
  String get profileImageUrl => _profileImageUrl;
  String get name => _name;
  int get userIdx => _userIdx;
}