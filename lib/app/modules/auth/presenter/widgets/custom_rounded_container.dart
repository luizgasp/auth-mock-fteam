import 'package:flutter/material.dart';

class CustomRoundedContainer extends StatelessWidget {
  final Widget? child;

  const CustomRoundedContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.73,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: child,
      ),
    );
  }
}
