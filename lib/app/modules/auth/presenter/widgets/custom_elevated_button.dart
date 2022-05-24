import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String textButton;

  const CustomElevatedButton({
    Key? key,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            textButton,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
