import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/providers/breeds_notifier.dart';
import 'package:cat_api_app/services/api_service.dart';
import 'package:cat_api_app/ui/home/screens/breed_page/widgets/breeds_drop_down.dart';
import 'package:cat_api_app/ui/home/widgets/error_text_widget.dart';
import 'package:cat_api_app/ui/home/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/breeds_description.dart';
import 'widgets/breeds_header_image.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService().getBreedList(),
      builder: (context, AsyncSnapshot<List<Breeds>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const AppProgressIndicator();
        }
        if (snapshot.hasError) {
          return ErrorTextWidget(error: snapshot.error.toString());
        }
        return _buildSuccessBody(snapshot.data!);
      },
    );
  }

  _buildSuccessBody(List<Breeds> breedList) {
    return Consumer<BreedsNotifier>(builder: (context, ref, child) {
      return Column(
        children: [
          BreedsDropDown(breedList: breedList),
          (ref.selectedBreed != null)
              ? Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        BreedsHeaderImage(selectedBreeds: ref.selectedBreed!),
                        BreedsDescription(selectedBreed: ref.selectedBreed!),
                      ],
                    ),
                  ),
                )
              : const Center()
        ],
      );
    });
  }
}
