import 'package:cat_api_app/models/breeds_model.dart';
import 'package:flutter/material.dart';

class BreedsDescription extends StatelessWidget {
  final Breeds selectedBreed;
  const BreedsDescription({
    Key? key,
    required this.selectedBreed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        selectedBreed.description ?? "",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 18,
        ),
      ),
    );
  }
}
