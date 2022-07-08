import 'package:flutter/material.dart';

class ErrorTextWidget extends StatelessWidget {
  final String error;
  const ErrorTextWidget({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text("Error:$error"),
      ),
    );
  }
}
