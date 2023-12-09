import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  final int maxDigits = 11; // Set the total allowed digits including spaces

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = '';

    // Remove any non-digit characters
    String unformattedText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Ensure the total length of the input does not exceed the maximum
    if (unformattedText.length > maxDigits) {
      unformattedText = unformattedText.substring(0, maxDigits);
    }

    // Add a space after the first three digits and another space after the next four digits
    for (int i = 0; i < unformattedText.length; i++) {
      if (i == 3 || i == 7) {
        formattedText += ' ';
      }
      formattedText += unformattedText[i];
    }

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}