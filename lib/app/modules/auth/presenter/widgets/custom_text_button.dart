import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String labelText;

  const CustomTextButton({Key? key, required this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
