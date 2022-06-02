import 'package:flutter/material.dart';

import '../../../../login/presenter/ui/widgets/custom_text_button.dart';

class CustomPainelTextWithButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonLabel;
  final void Function()? onPressed;

  const CustomPainelTextWithButton({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.buttonLabel,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.04),
          Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          SizedBox(height: size.height * 0.03),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(color: Theme.of(context).dialogBackgroundColor),
              ),
              CustomTextButton(
                labelText: buttonLabel,
                onPressed: onPressed,
              )
            ],
          ),
        ],
      ),
    );
  }
}
