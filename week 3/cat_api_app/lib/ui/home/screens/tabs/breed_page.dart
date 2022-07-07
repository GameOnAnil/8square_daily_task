import 'package:cat_api_app/providers/breeds_notifier.dart';
import 'package:cat_api_app/ui/home/widgets/breeds_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final breedList = context.watch<BreedsNotifier>().breedList;
    final isLoading = context.watch<BreedsNotifier>().isLoading;
    final error = context.watch<BreedsNotifier>().error;

    if (error.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text("Error:$error"),
        ),
      );
    } else if (isLoading) {
      return _buildProgressIndicator();
    } else {
      if (breedList.isNotEmpty) {
        return BreedsDataContent(breedList: breedList);
      } else {
        return _buildListNull();
      }
    }
  }

  _buildHasDataPart() {}

  Center _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center _buildListNull() {
    return const Center(
      child: Text("Null"),
    );
  }
}
