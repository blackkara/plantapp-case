import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';

part 'home_state.freezed.dart';

enum HomeStatus { initial, loading, success, failure }

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.initial) HomeStatus status,
    @Default([]) List<CategoryEntity> categories,
    @Default([]) List<QuestionEntity> questions,
    @Default(1) int currentPage,
    @Default(6) int pageSize,
    @Default(false) bool hasMoreCategories,
    @Default(false) bool isLoadingMore,
    String? errorMessage,
  }) = _HomeState;
}
