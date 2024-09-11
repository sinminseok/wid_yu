class ProfileResponse {
  String? _name;
  int? _userIdx;
  String? _profileUrl;
  String? _id;

  // Named constructor with nullable parameters
  ProfileResponse({
    String? name,
    int? userIdx,
    String? profileUrl,
    String? id,
  })  : _name = name,
        _userIdx = userIdx,
        _profileUrl = profileUrl,
        _id = id;

  // fromJson method to create an instance from JSON
  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      name: json['name'],
      userIdx: json['userIdx'],
      profileUrl: json['profileImageUrl'],
      id: json['id'],
    );
  }

  // Getter methods for the private fields
  String? get name => _name;
  int? get userIdx => _userIdx;
  String? get profileUrl => _profileUrl;
  String? get id => _id;
}
