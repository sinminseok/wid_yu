
class ConvertPercentage{
  // double 값을 받아서 int로 변환하는 메서드
  int toPercentage(double value) {
    // value를 100으로 곱한 후 정수로 변환
    return (value * 100).toInt();
  }
}