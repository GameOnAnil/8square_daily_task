import 'package:cat_api_app/models/ramdom_image.dart';
import 'package:cat_api_app/services/api_service.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';

class VotesNotifier extends ChangeNotifier {
  final ApiService apiService;
  RandomImage? randomImage;
  Status _status = Status.initial;
  Status get status => _status;
  String error = "";

  VotesNotifier(this.apiService) {
    getRandomImage();
  }

  _setStatus(Status value) {
    _status = value;
    notifyListeners();
  }

  Future<void> getRandomImage() async {
    try {
      error = "";
      _setStatus(Status.loading);
      randomImage = await apiService.getRandomImage();
      _setStatus(Status.success);
    } catch (e) {
      error = e.toString();
      _setStatus(Status.failure);
    }
  }

  Future<void> voteUp() async {
    try {
      await apiService.postVotes(
          imageId: randomImage!.id, value: 1, subId: "Anil");
      getRandomImage();
    } catch (e) {
      error = e.toString();
    }
  }

  Future<void> voteDown() async {
    try {
      await apiService.postVotes(
          imageId: randomImage!.id, value: 0, subId: "Anil");
      getRandomImage();
    } catch (e) {
      error = e.toString();
    }
  }
}
