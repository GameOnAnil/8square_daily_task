import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/providers/breeds_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedsDropDown extends StatelessWidget {
  final Breeds? selectedBreed;
  final List<Breeds> breedList;
  const BreedsDropDown({
    Key? key,
    this.selectedBreed,
    required this.breedList,
  }) : super(key: key);

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
        items: _getDropDownList(breedList),
        onChanged: (item) {
          context.read<BreedsNotifier>().selectBreed(item);
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
