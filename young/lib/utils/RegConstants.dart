
class RegConstants {
  final RegExp upperCase = RegExp(r'[A-Z]');
  final RegExp lowerCase = RegExp(r'[a-z]');
  final RegExp specialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
  final RegExp emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

}