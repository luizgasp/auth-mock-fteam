import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

// TODO - Put anyone's picture on container
class CustomProfilePhoto extends StatelessWidget {
  const CustomProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          alignment: Alignment.bottomRight,
          child: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                IconlyBold.camera,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
