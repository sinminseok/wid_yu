
enum HealthInformationState{
  DANGEROUS('위험한 수치에요!'),
  ATTENTION("주의가 필요해요."),
  NOMAL('평소와 비슷해요');

const HealthInformationState(this.message);
final String message;

}