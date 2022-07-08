import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  final bool isLike;
  final Function() ontap;
  const VoteButton({
    Key? key,
    required this.isLike,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ontap(),
      child: Image.asset(
        (isLike) ? "assets/images/like.png" : "assets/images/dislike.png",
        color: (isLike) ? Colors.green : Colors.red,
        width: 60,
        height: 60,
      ),
    );
  }
}
