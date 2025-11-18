import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plantapp_case/core/network/api_constants.dart';
import 'package:plantapp_case/core/network/interceptors/error_interceptor.dart';
import 'package:plantapp_case/core/network/interceptors/logging_interceptor.dart';
import 'package:plantapp_case/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plantapp_case/features/home/data/repositories/home_repository_impl.dart';

void main() {
  late HomeRepositoryImpl repository;
  late Dio dio;

  setUp(() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: ApiConstants.connectionTimeout,
        receiveTimeout: ApiConstants.receiveTimeout,
      ),
    );
    dio.interceptors.addAll([LoggingInterceptor(), ErrorInterceptor()]);

    final dataSource = HomeRemoteDataSourceImpl(dio);
    repository = HomeRepositoryImpl(dataSource);
  });

  group('Real API Tests', () {
    test('getCategories should return real data from API', () async {
      final result = await repository.getCategories();

      expect(result, isNotEmpty);
      expect(result.first.id, isA<int>());
      expect(result.first.title, isNotEmpty);
      expect(result.first.image.url, contains('http'));
    });

    test('getQuestions should return real data from API', () async {
      final result = await repository.getQuestions();

      expect(result, isNotEmpty);
      expect(result.first.id, isA<int>());
      expect(result.first.title, isNotEmpty);
    });
  });
}
