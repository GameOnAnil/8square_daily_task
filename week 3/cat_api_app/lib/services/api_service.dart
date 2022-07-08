import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/services/api_endpoint.dart';
import 'package:cat_api_app/utils/custom_exception.dart';
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.interceptors.add(ChuckerDioInterceptor());
  }

  Future<List<Breeds>> getBreedList() async {
    try {
      final response = await _dio.get(ApiEndPoint.GET_ALL_BREEDS);
      final jsonResult = List<Map<String, dynamic>>.from(response.data);
      final List<Breeds> breedList =
          jsonResult.map((e) => Breeds.fromMap(e)).toList();
      return breedList;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
