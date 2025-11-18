import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:plantapp_case/core/network/api_constants.dart';
import 'package:plantapp_case/features/home/data/models/categories_response.dart';
import 'package:plantapp_case/features/home/data/models/question_model.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesResponse> getCategories({int page = 1, int pageSize = 10});
  Future<List<QuestionModel>> getQuestions();
}

// @LazySingleton(as: HomeRemoteDataSource) // Commented out to use mock data source
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteDataSourceImpl(this._dio);

  @override
  Future<CategoriesResponse> getCategories({int page = 1, int pageSize = 10}) async {
    final response = await _dio.get(
      ApiConstants.categoriesEndpoint,
      queryParameters: {'page': page, 'pageSize': pageSize},
    );
    final jsonData = response.data is String ? jsonDecode(response.data) : response.data;
    return CategoriesResponse.fromJson(jsonData);
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    final response = await _dio.get(ApiConstants.questionsEndpoint);
    final jsonData = response.data is String ? jsonDecode(response.data) : response.data;
    final List<dynamic> data = jsonData;
    return data.map((json) => QuestionModel.fromJson(json)).toList();
  }
}
