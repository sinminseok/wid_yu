import 'package:flutter/services.dart';

class BirthDateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    final RegExp regExp =
    RegExp(r'^(\d{0,4})(\.?)(\d{0,2})(\.?)(\d{0,2})$');
    final match = regExp.firstMatch(newValue.text);

    if (match == null) {
      return oldValue;
    }

    var year = match.group(1) ?? '';
    var month = match.group(3) ?? '';
    var day = match.group(5) ?? '';

    var result = '';

    if (year.isNotEmpty) {
      result += year;
    }

    if (month.isNotEmpty) {
      result += (result.isNotEmpty ? '.' : '') + _formatNumber(month, 1, 12);
    }

    if (day.isNotEmpty) {
      result += (result.isNotEmpty ? '.' : '') + _formatNumber(day, 1, 31);
    }

    return newValue.copyWith(
      text: result,
      selection: TextSelection.collapsed(offset: result.length),
    );
  }

  String _formatNumber(String input, int minValue, int maxValue) {
    var value = int.tryParse(input) ?? 0;

    if (value < minValue) {
      return '0$value';
    } else if (value > maxValue) {
      return '$maxValue';
    } else {
      return input;
    }
  }
}
