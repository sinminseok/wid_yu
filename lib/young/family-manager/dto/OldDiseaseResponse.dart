class OldDiseaseResponse {
  int? _diseaseIdx;
  String? _diseaseName;
  String? _drugName;
  String? _explanation;

  OldDiseaseResponse({
    required int? diseaseIdx,
    required String? diseaseName,
    required String? drugName,
    required String? explanation,
  })  : _diseaseName = diseaseName,
        _diseaseIdx = diseaseIdx,
        _drugName = drugName,
        _explanation = explanation;

  factory OldDiseaseResponse.fromJson(Map<String, dynamic> json) {
    return OldDiseaseResponse(
      diseaseName: json['diseaseName'] as String?,
      drugName: json['drugName'] as String?,
      explanation: json['explanation'] as String?,
      diseaseIdx: json["diseaseIdx"],
    );
  }

  String? get explanation => _explanation;

  String? get drugName => _drugName;

  String? get diseaseName => _diseaseName;

  int? get diseaseIdx => _diseaseIdx;
}
