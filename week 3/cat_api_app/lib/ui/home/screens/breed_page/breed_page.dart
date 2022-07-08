import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/providers/breeds_notifier.dart';
import 'package:cat_api_app/ui/home/screens/breed_page/widgets/breeds_drop_down.dart';
import 'package:cat_api_app/ui/home/widgets/error_text_widget.dart';
import 'package:cat_api_app/ui/home/widgets/progress_indicator.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/breeds_description.dart';
import 'widgets/breeds_header_image.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: ((context, ref, child) {
        final notifier = context.watch<BreedsNotifier>();
        if (notifier.status == Status.success) {
          return _buildSuccessBody(
              notifier.breedList, context, notifier.selectedBreed);
        }
        if (notifier.status == Status.failure) {
          return ErrorTextWidget(error: notifier.error);
        }
        return const AppProgressIndicator();
      }),
    );
  }

  _buildSuccessBody(
      List<Breeds> breedList, BuildContext context, Breeds? selectedBreed) {
    return Column(
      children: [
        BreedsDropDown(breedList: breedList),
        (selectedBreed != null)
            ? Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BreedsHeaderImage(selectedBreeds: selectedBreed),
                      BreedsDescription(selectedBreed: selectedBreed),
                    ],
                  ),
                ),
              )
            : const Center()
      ],
    );
  }
}
