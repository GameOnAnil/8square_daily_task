import 'package:cat_api_app/ui/home/screens/search_page/widgets/search_page_data.dart';
import 'package:cat_api_app/ui/home/widgets/custom_drop_down.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryPicker(),
        const Expanded(child: SearchPageData()),
      ],
    );
  }

  Column _buildCategoryPicker() {
    return Column(
      children: [
        Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDropDown(
                  label: "Order",
                  itemList: ["Random", "Random2"],
                  initial: "Random",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDropDown(
                  label: "Type",
                  itemList: ["Type", "Type2"],
                  initial: "Type",
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDropDown(
                  label: "Category",
                  itemList: ["category", "category2"],
                  initial: "category",
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomDropDown(
                  label: "Breed",
                  itemList: ["Breed", "Breed1"],
                  initial: "Breed",
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
