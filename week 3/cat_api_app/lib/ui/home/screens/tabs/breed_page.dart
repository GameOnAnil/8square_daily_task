import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/providers/breeds_notifier.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedPage extends StatelessWidget {
  const BreedPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final breedList = context.watch<BreedsNotifier>().breedList;
    final status = context.watch<BreedsNotifier>().status;
    final error = context.watch<BreedsNotifier>().error;

    if (status == Status.success) {
      return _buildBody(breedList);
    }
    if (status == Status.failure) {
      return _buildErrorWidget(error);
    }
    return _buildProgressIndicator();
  }

  Padding _buildErrorWidget(String error) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text("Error:$error"),
      ),
    );
  }

  Consumer<BreedsNotifier> _buildBody(List<Breeds> breedList) {
    return Consumer<BreedsNotifier>(builder: (context, ref, child) {
      final selectedBreed = ref.selectedBreed;
      final imageUrl = selectedBreed?.image?.url;
      return Column(
        children: [
          _buildDropDownField(selectedBreed, context, breedList),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  (imageUrl != null)
                      ? _buildContent(selectedBreed!, context, imageUrl)
                      : const Center()
                ],
              ),
            ),
          )
        ],
      );
    });
  }

  Column _buildContent(
      Breeds selectedBreed, BuildContext context, String? imageUrl) {
    return Column(
      children: [
        _buildHeaderImage(context, imageUrl, selectedBreed),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            selectedBreed.description ?? "",
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  SizedBox _buildHeaderImage(
      BuildContext context, String? imageUrl, Breeds? selectedBreed) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        children: [
          (imageUrl != null)
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                )
              : const SizedBox(),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [.01, .3]),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              selectedBreed?.name ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding _buildDropDownField(
      Breeds? selectedBreed, BuildContext context, List<Breeds> breedList) {
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

  Center _buildProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
