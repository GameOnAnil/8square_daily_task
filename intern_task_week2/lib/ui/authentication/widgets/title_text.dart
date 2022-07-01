import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleText({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: fontSize,
      ),
    );
  }
}
