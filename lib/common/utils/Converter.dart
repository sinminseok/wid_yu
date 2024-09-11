
class ConverterCutom {
  static String toServerPhoneNumber(String phoneNumber){
// 공백을 모두 제거하고 반환합니다.
    return phoneNumber.replaceAll(' ', '');

  }
}