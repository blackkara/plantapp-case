import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_entity.freezed.dart';

@freezed
class QuestionEntity with _$QuestionEntity {
  const factory QuestionEntity({
    required int id,
    required String title,
    required String subtitle,
    required String imageUri,
    required String uri,
    required int order,
  }) = _QuestionEntity;
}
