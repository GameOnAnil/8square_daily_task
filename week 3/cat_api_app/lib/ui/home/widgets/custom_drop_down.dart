import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String label;
  final List<String> itemList;
  final String initial;

  const CustomDropDown({
    Key? key,
    required this.label,
    required this.itemList,
    required this.initial,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: DropdownButtonFormField<String>(
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true),
        elevation: 10,
        hint: const Text(
          "Test",
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        isExpanded: true,
        value: itemList[0],
        borderRadius: BorderRadius.circular(10),
        items: _getDropDownList(itemList),
        onChanged: (item) {},
      ),
    );
  }

  List<DropdownMenuItem<String>> _getDropDownList(List<String> breedList) {
    return breedList
        .map((e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ))
        .toList();
  }
}
