import 'package:cat_api_app/models/breeds_model.dart';
import 'package:flutter/material.dart';

class BreedsDataContent extends StatefulWidget {
  const BreedsDataContent({
    Key? key,
    required this.breedList,
  }) : super(key: key);

  final List<Breeds> breedList;

  @override
  State<BreedsDataContent> createState() => _BreedsDataContentState();
}

class _BreedsDataContentState extends State<BreedsDataContent> {
  Breeds? selectedBreed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<Breeds?>(
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            fillColor: Colors.white,
            filled: true),
        elevation: 10,
        hint: const Text(
          "Choose Breeds",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        isExpanded: true,
        value: selectedBreed,
        borderRadius: BorderRadius.circular(10),
        items: _getDropDownList(widget.breedList),
        onChanged: (item) {
          setState(() {
            selectedBreed = item;
          });
        },
      ),
    );
  }

  List<DropdownMenuItem<Breeds?>>? _getDropDownList(List<Breeds>? breedList) {
    return breedList
        ?.map((e) => DropdownMenuItem<Breeds?>(
              value: e,
              child: Text(e.name ?? ""),
            ))
        .toList();
  }
}
