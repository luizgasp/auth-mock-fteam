import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;

  final double? paddingTop;
  final double? height;

  const CustomContainer({
    Key? key,
    required this.child,
    this.paddingTop,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(top: paddingTop ?? size.height * 0.25),
      child: Container(
        width: double.infinity,
        height: height ?? size.height * 0.75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32, top: 32),
          child: child,
        ),
      ),
    );
  }
}
