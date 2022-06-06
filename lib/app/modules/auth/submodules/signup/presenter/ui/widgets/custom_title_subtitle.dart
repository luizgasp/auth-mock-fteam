import 'package:flutter/material.dart';

class CustomTitleSubtitile extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomTitleSubtitile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            ],
          ),
        ],
      ),
    );
  }
}
