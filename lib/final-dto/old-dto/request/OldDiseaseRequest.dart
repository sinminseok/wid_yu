
class OldDiseaseRequest{
  String? name;
  String? drugName;
  String? explanation;

  OldDiseaseRequest(this.name, this.drugName, this.explanation);

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "drugName": drugName,
      "explanation": explanation,
    };
  }
}