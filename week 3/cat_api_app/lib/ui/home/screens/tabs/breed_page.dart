import 'package:cat_api_app/models/breeds_model.dart';
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
      return const Center(
        child: Text("Error"),
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

  ListView _buildHasData(List<Breeds>? breedList) {
    return ListView.builder(
      itemCount: breedList?.length,
      itemBuilder: ((context, index) {
        return ListTile(
          title: Text(breedList![index].name!),
        );
      }),
    );
  }
}
