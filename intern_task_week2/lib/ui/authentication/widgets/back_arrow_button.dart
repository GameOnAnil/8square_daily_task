import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  final Function() onTap;
  const BackArrowButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(.6)),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
          ),
        ),
      ),
    );
  }
}
