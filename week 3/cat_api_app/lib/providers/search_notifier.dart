import 'package:cat_api_app/services/api_service.dart';
import 'package:cat_api_app/utils/response_status.dart';
import 'package:flutter/material.dart';

class SearchNotifier extends ChangeNotifier {
  final ApiService apiService;
  String error = "";
  Status _status = Status.initial;
  Status get status => _status;

  SearchNotifier(this.apiService);
  void _setStatus(Status status) {
    _status = status;
    notifyListeners();
  }
}
