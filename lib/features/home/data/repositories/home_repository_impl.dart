import 'package:injectable/injectable.dart';
import 'package:plantapp_case/core/errors/exceptions.dart';
import 'package:plantapp_case/core/services/logger_service.dart';
import 'package:plantapp_case/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plantapp_case/features/home/data/models/category_model.dart';
import 'package:plantapp_case/features/home/data/models/question_model.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';
import 'package:plantapp_case/features/home/domain/repositories/home_repository.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<CategoryEntity>> getCategories({int page = 1, int pageSize = 10}) async {
    try {
      final response = await _remoteDataSource.getCategories(page: page, pageSize: pageSize);
      return response.data.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      LoggerService.error(
        'Failed to fetch categories',
        tag: 'HomeRepository',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(message: 'Failed to fetch categories: $e');
    }
  }

  @override
  Future<bool> hasMoreCategories({required int page, required int pageSize}) async {
    try {
      final response = await _remoteDataSource.getCategories(page: page, pageSize: pageSize);
      return response.meta.pagination.page < response.meta.pagination.pageCount;
    } catch (e, stackTrace) {
      LoggerService.error(
        'Failed to check more categories',
        tag: 'HomeRepository',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  @override
  Future<List<QuestionEntity>> getQuestions() async {
    try {
      final models = await _remoteDataSource.getQuestions();
      return models.map((model) => model.toEntity()).toList();
    } catch (e, stackTrace) {
      LoggerService.error(
        'Failed to fetch questions',
        tag: 'HomeRepository',
        error: e,
        stackTrace: stackTrace,
      );
      throw ServerException(message: 'Failed to fetch questions: $e');
    }
  }
}
