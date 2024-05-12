
class OldDiseaseResponse{
  String? _diseaseName;
  String? _drugName;
  String? _explanation;

  OldDiseaseResponse({
    required String? diseaseName,
    required String? drugName,
    required String? explanation,
  })  : _diseaseName = diseaseName,
        _drugName = drugName,
        _explanation = explanation;

  factory OldDiseaseResponse.fromJson(Map<String, dynamic> json) {
    return OldDiseaseResponse(
      diseaseName: json['diseaseName'] as String?,
      drugName: json['drugName'] as String?,
      explanation: json['explanation'] as String?,
    );
  }
}