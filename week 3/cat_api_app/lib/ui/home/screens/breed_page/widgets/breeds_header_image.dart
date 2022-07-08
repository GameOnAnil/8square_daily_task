import 'package:cat_api_app/models/breeds_model.dart';
import 'package:flutter/material.dart';

class BreedsHeaderImage extends StatelessWidget {
  final Breeds selectedBreeds;
  const BreedsHeaderImage({
    Key? key,
    required this.selectedBreeds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .4,
      child: Stack(
        children: [
          (selectedBreeds.image?.url != null)
              ? SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    selectedBreeds.image!.url!,
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
              selectedBreeds.name ?? "",
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
}
