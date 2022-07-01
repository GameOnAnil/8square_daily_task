import 'package:flutter/material.dart';

class ProfileIconButton extends StatelessWidget {
  final Function() onTap;
  const ProfileIconButton({
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
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        child: IconButton(
          onPressed: onTap,
          icon: const Icon(
            Icons.person,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
