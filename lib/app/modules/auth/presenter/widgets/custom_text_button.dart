import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String labelText;
  final void Function()? onPressed;

  const CustomTextButton({
    Key? key,
    required this.labelText,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        primary: Theme.of(context).primaryColorDark,
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        alignment: Alignment.centerLeft,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 3),
        child: Text(labelText),
      ),
    );
  }
}
