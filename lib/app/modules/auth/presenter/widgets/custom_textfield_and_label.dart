import 'package:flutter/material.dart';

class CustomTextFieldAndLabel extends StatelessWidget {
  final String label;
  final IconData iconData;

  const CustomTextFieldAndLabel({
    Key? key,
    required this.label,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: size.height * 0.03),
        TextFormField(
          style: Theme.of(context).textTheme.headline5,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                iconData,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
