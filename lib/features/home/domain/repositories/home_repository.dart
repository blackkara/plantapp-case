import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';

abstract class HomeRepository {
  Future<List<CategoryEntity>> getCategories({int page = 1, int pageSize = 10});
  Future<bool> hasMoreCategories({required int page, required int pageSize});
  Future<List<QuestionEntity>> getQuestions();
}
