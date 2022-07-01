import 'package:flutter/material.dart';

class GridCustomTile extends StatelessWidget {
  final Color bgColor;
  final Color txtColor;
  final String title;
  final String image;

  const GridCustomTile(
      {Key? key,
      required this.bgColor,
      required this.txtColor,
      required this.title,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 80,
              height: 80,
              color: txtColor,
            ),
            Text(
              title,
              style: TextStyle(
                color: txtColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
