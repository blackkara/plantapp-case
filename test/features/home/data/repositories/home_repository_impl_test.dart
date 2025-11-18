import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp_case/core/errors/exceptions.dart';
import 'package:plantapp_case/features/home/data/datasources/home_remote_data_source.dart';
import 'package:plantapp_case/features/home/data/models/categories_response.dart';
import 'package:plantapp_case/features/home/data/models/category_model.dart';
import 'package:plantapp_case/features/home/data/models/question_model.dart';
import 'package:plantapp_case/features/home/data/repositories/home_repository_impl.dart';

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  late HomeRepositoryImpl repository;
  late MockHomeRemoteDataSource mockDataSource;
  late CategoryModel tCategoryModel;

  setUp(() {
    mockDataSource = MockHomeRemoteDataSource();
    repository = HomeRepositoryImpl(mockDataSource);

    tCategoryModel = CategoryModel(
      id: 1,
      name: 'test',
      title: 'Test Category',
      rank: 0,
      image: CategoryImageModel(id: 1, name: 'test.png', width: 100, height: 100, url: 'https://test.com/image.png'),
    );
  });

  group('getCategories', () {
    late CategoriesResponse tResponse;

    setUp(() {
      tResponse = CategoriesResponse(
        data: [tCategoryModel],
        meta: PaginationMeta(pagination: Pagination(page: 1, pageSize: 25, pageCount: 1, total: 1)),
      );
    });

    test('should return list of CategoryEntity when call is successful', () async {
      when(
        () => mockDataSource.getCategories(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => tResponse);

      final result = await repository.getCategories(page: 1, pageSize: 10);

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.title, 'Test Category');
      expect(result.first.name, 'test');
      verify(() => mockDataSource.getCategories(page: 1, pageSize: 10)).called(1);
    });

    test('should throw ServerException when call fails', () async {
      when(
        () => mockDataSource.getCategories(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenThrow(Exception('Network error'));

      expect(() => repository.getCategories(page: 1, pageSize: 10), throwsA(isA<ServerException>()));
      verify(() => mockDataSource.getCategories(page: 1, pageSize: 10)).called(1);
    });
  });

  group('hasMoreCategories', () {
    test('should return true when there are more pages', () async {
      final tResponse = CategoriesResponse(
        data: [tCategoryModel],
        meta: PaginationMeta(pagination: Pagination(page: 1, pageSize: 1, pageCount: 3, total: 3)),
      );
      when(
        () => mockDataSource.getCategories(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => tResponse);

      final result = await repository.hasMoreCategories(page: 1, pageSize: 1);

      expect(result, true);
      verify(() => mockDataSource.getCategories(page: 1, pageSize: 1)).called(1);
    });

    test('should return false when on last page', () async {
      final tResponse = CategoriesResponse(
        data: [tCategoryModel],
        meta: PaginationMeta(pagination: Pagination(page: 3, pageSize: 1, pageCount: 3, total: 3)),
      );
      when(
        () => mockDataSource.getCategories(
          page: any(named: 'page'),
          pageSize: any(named: 'pageSize'),
        ),
      ).thenAnswer((_) async => tResponse);

      final result = await repository.hasMoreCategories(page: 3, pageSize: 1);

      expect(result, false);
      verify(() => mockDataSource.getCategories(page: 3, pageSize: 1)).called(1);
    });
  });

  group('getQuestions', () {
    final tQuestionModel = QuestionModel(
      id: 1,
      title: 'Test Question',
      subtitle: 'Test Subtitle',
      imageUri: 'https://test.com/image.png',
      uri: 'https://test.com',
      order: 1,
    );

    test('should return list of QuestionEntity when call is successful', () async {
      when(() => mockDataSource.getQuestions()).thenAnswer((_) async => [tQuestionModel]);

      final result = await repository.getQuestions();

      expect(result.length, 1);
      expect(result.first.id, 1);
      expect(result.first.title, 'Test Question');
      verify(() => mockDataSource.getQuestions()).called(1);
    });

    test('should throw ServerException when call fails', () async {
      when(() => mockDataSource.getQuestions()).thenThrow(Exception('Network error'));

      expect(() => repository.getQuestions(), throwsA(isA<ServerException>()));
      verify(() => mockDataSource.getQuestions()).called(1);
    });
  });
}
