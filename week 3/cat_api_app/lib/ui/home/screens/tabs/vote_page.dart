import 'package:cat_api_app/services/api_service.dart';
import 'package:flutter/material.dart';

class VotePage extends StatelessWidget {
  const VotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            await ApiService().getBreedList();
          },
          child: const Text("GET"),
        ),
      ],
    );
  }
}
