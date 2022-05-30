import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTextFieldAndLabel extends StatefulWidget {
  final String label;
  final IconData iconData;
  final TextInputType? keyboardType;
  final bool passwordTile;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextFieldAndLabel({
    Key? key,
    required this.label,
    required this.iconData,
    this.keyboardType,
    this.passwordTile = false,
    required this.controller,
    required this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFieldAndLabel> createState() => _CustomTextFieldAndLabelState();
}

class _CustomTextFieldAndLabelState extends State<CustomTextFieldAndLabel> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.passwordTile;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: size.height * 0.015),
        TextFormField(
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: obscureText,
          style: Theme.of(context).textTheme.headline5,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                widget.iconData,
                color: Theme.of(context).primaryColor,
                size: 28,
              ),
            ),
            suffixIcon: widget.passwordTile
                ? GestureDetector(
                    onTap: () => setState(() => obscureText = !obscureText),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Icon(
                        obscureText ? IconlyLight.show : IconlyLight.hide,
                        color: Theme.of(context).dialogBackgroundColor,
                        size: 28,
                      ),
                    ),
                  )
                : null,
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 17),
          ),
          validator: widget.validator,
        ),
      ],
    );
  }
}
