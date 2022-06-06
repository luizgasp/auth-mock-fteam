import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = StringBuffer();

    var selectionEnd = newValue.selection.end;
    var endStringIndex = 0;

    if (text.length >= 4) {
      newText.write('${text.substring(0, endStringIndex = 3)}.');
      if (newValue.selection.end >= 3) selectionEnd++;
    }

    if (text.length >= 7) {
      newText.write('${text.substring(3, endStringIndex = 6)}.');
      if (newValue.selection.end >= 6) selectionEnd++;
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
