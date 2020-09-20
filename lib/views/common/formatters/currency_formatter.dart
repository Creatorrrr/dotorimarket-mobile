import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

/// 원화 단위 표시 Formatter
class CurrencyFormatter extends TextInputFormatter {
  static const int VALUE_LENGTH_LIMIT = 14;
  static const String WON = '₩';

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > VALUE_LENGTH_LIMIT) return oldValue;

    if (newValue.text.trim() == WON) {
      return newValue.copyWith(text: '');
    } else {
      final currencyNumberFormat = new NumberFormat.currency(
        decimalDigits: 0,
        symbol: '$WON ',
      );

      int num = int.parse(newValue.text.replaceAll(RegExp(r'[^\d]'), ''));
      final newString = currencyNumberFormat.format(num);

      return TextEditingValue(
          selection: TextSelection.fromPosition(TextPosition(
            offset: newString.length,
          )),
          text: newString
      );
    }
  }
}