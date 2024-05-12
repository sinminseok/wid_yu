
class OldEditDiseaseRequest {
  final int? diseaseIdx;
  final String? name;
  final String? drugName;
  final String? explanation;

  OldEditDiseaseRequest({
    required this.diseaseIdx,
    required this.name,
    required this.drugName,
    required this.explanation,
  });

  Map<String, dynamic> toJson() {
    return {
      'diseaseIdx': diseaseIdx,
      'name': name,
      'drugName': drugName,
      'explanation': explanation,
    };
  }
}
