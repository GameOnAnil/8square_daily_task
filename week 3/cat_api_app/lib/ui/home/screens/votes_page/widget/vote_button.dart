import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  final String name;
  final Function() ontap;
  const VoteButton({
    Key? key,
    required this.name,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => ontap(),
        child: const Text("Up Vote"),
      ),
    );
  }
}
