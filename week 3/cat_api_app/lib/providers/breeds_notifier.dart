import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/services/api_service.dart';
import 'package:flutter/material.dart';

class BreedsNotifier extends ChangeNotifier {
  final ApiService apiService;
  List<Breeds> breedList = [];
  String error = "";
  bool isLoading = false;

  BreedsNotifier(this.apiService) {
    getAllBreeds();
  }

  Future<void> getAllBreeds() async {
    try {
      error = "";
      isLoading = true;
      notifyListeners();
      final breedResponse = await apiService.getBreedList();
      breedList = breedResponse;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      error = e.toString();
    }
  }
}
