import 'package:plantapp_case/core/services/logger_service.dart';
import 'package:plantapp_case/core/services/mock_data_generator.dart';
import 'package:plantapp_case/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plantapp_case/features/home/data/models/categories_response.dart';
import 'package:plantapp_case/features/home/data/models/question_model.dart';

class HomeMockDataSource implements HomeRemoteDataSource {
  static const _mockDelay = Duration(milliseconds: 800);

  @override
  Future<CategoriesResponse> getCategories({int page = 1, int pageSize = 10}) async {
    LoggerService.debug('Generating categories page $page with pageSize $pageSize', tag: 'MockDataSource');

    await Future.delayed(_mockDelay);

    try {
      final jsonData = MockDataGenerator.generateCategoryResponse(page: page, pageSize: pageSize, totalItems: 100);

      final response = CategoriesResponse.fromJson(jsonData);
      LoggerService.info(
        'Successfully generated ${response.data.length} categories for page $page',
        tag: 'MockDataSource',
      );

      return response;
    } catch (e) {
      LoggerService.error('Error generating page $page', tag: 'MockDataSource', error: e);
      throw Exception('Failed to generate mock categories for page $page: $e');
    }
  }

  @override
  Future<List<QuestionModel>> getQuestions() async {
    LoggerService.debug('Generating questions', tag: 'MockDataSource');

    await Future.delayed(_mockDelay);

    try {
      final questionsData = MockDataGenerator.generateQuestions(count: 3);
      final questions = questionsData.map((json) => QuestionModel.fromJson(json)).toList();

      LoggerService.info('Successfully generated ${questions.length} questions', tag: 'MockDataSource');
      return questions;
    } catch (e) {
      LoggerService.error('Error generating questions', tag: 'MockDataSource', error: e);
      throw Exception('Failed to generate mock questions: $e');
    }
  }
}
