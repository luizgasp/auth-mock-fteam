import 'package:flutter/services.dart';

class RgInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = StringBuffer();

    var selectionEnd = newValue.selection.end;
    var endStringIndex = 0;

    if (text.length >= 3) {
      newText.write('${text.substring(0, endStringIndex = 2)}.');
      if (newValue.selection.end >= 2) selectionEnd++;
    }

    if (text.length >= 6) {
      newText.write('${text.substring(2, endStringIndex = 5)}.');
      if (newValue.selection.end >= 5) selectionEnd++;
    }

    if (text.length >= 10) {
      newText.write('${text.substring(6, endStringIndex = 9)}-');
      if (newValue.selection.end >= 9) selectionEnd++;
    }

    if (text.length >= endStringIndex) {
      newText.write(newValue.text.substring(endStringIndex));
    }

    return newValue.copyWith(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
