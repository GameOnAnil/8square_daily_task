import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/services/api_endpoint.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Breeds>> getBreedList() async {
    try {
      final response = await _dio.get(ApiEndPoint.GET_ALL_BREEDS);
      final jsonResult = List<Map<String, dynamic>>.from(response.data);
      final List<Breeds> breedList =
          jsonResult.map((e) => Breeds.fromMap(e)).toList();
      return breedList;
    } catch (e) {
      rethrow;
    }
  }
}
