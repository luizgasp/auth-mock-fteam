import 'package:flutter/services.dart';

class PhoneInputFormatter implements TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    final newText = StringBuffer();

    var selectionEnd = newValue.selection.end;
    var endStringIndex = 0;

    if (text.isNotEmpty) {
      newText.write('(');
      if (newValue.selection.end >= 1) selectionEnd++;
    }

    if (text.length >= 3) {
      newText.write('${text.substring(0, endStringIndex = 2)}) ');
      if (newValue.selection.end >= 2) selectionEnd++;
    }

    if (text.length >= 4) {
      newText.write('${text.substring(2, endStringIndex = 3)} ');
      if (newValue.selection.end >= 3) selectionEnd++;
    }

    if (text.length >= 8) {
      newText.write('${text.substring(3, endStringIndex = 7)}-');
      if (newValue.selection.end >= 7) selectionEnd++;
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
