
class OldEditDiseaseRequest {
  final int? diseaseIdx;
  String? name;
  String? drugName;
  String? explanation;

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

  void update(String name, String drugName, String explanation){
    this.name = name;
    this.drugName = drugName;
    this.explanation = explanation;
  }
}
