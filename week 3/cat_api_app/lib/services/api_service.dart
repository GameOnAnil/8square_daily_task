import 'package:cat_api_app/models/breeds_model.dart';
import 'package:cat_api_app/models/ramdom_image.dart';
import 'package:cat_api_app/models/vote_model.dart';
import 'package:cat_api_app/models/vote_response_model.dart';
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

  Future<RandomImage> getRandomImage() async {
    try {
      final response = await _dio.get(ApiEndPoint.GET_RANDOM_IMAGE);
      final jsonResult = List<Map<String, dynamic>>.from(response.data);
      final List<RandomImage> imageList =
          jsonResult.map((e) => RandomImage.fromMap(e)).toList();
      return imageList[0];
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  Future<List<RandomImage>> getRandomImageList(int limit) async {
    try {
      final response = await _dio
          .get(ApiEndPoint.GET_RANDOM_IMAGE, queryParameters: {"limit": 10});
      final jsonResult = List<Map<String, dynamic>>.from(response.data);
      final List<RandomImage> imageList =
          jsonResult.map((e) => RandomImage.fromMap(e)).toList();
      return imageList;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  Future<VoteResponse?> postVotes(
      {required String imageId,
      required int value,
      required String subId}) async {
    try {
      final response = await _dio.post(
        ApiEndPoint.POST_VOTES,
        data: Vote(imageId: imageId, value: value, subId: subId).toMap(),
      );
      final jsonResult = Map<String, dynamic>.from(response.data);
      return VoteResponse.fromMap(jsonResult);
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }
}
