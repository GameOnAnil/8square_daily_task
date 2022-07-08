import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/services/api_service.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';

class BreedsNotifier extends ChangeNotifier {
  final ApiService apiService;
  List<Breeds> breedList = [];
  String error = "";
  Breeds? selectedBreed;

  Status _status = Status.initial;
  Status get status => _status;

  BreedsNotifier(this.apiService) {
    getAllBreeds();
  }
  void _setStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  void selectBreed(Breeds? breed) {
    selectedBreed = breed;
    notifyListeners();
  }

  Future<void> getAllBreeds() async {
    try {
      _setStatus(Status.loading);
      final breedResponse = await apiService.getBreedList();
      breedList = breedResponse;
      _setStatus(Status.success);
    } catch (e) {
      error = e.toString();
      _setStatus(Status.failure);
    }
  }
}
