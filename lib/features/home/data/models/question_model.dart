import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';

part 'question_model.freezed.dart';
part 'question_model.g.dart';

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    required int id,
    required String title,
    required String subtitle,
    @JsonKey(name: 'image_uri') required String imageUri,
    required String uri,
    required int order,
  }) = _QuestionModel;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}

extension QuestionModelMapperExtension on QuestionModel {
  QuestionEntity toEntity() {
    return QuestionEntity(id: id, title: title, subtitle: subtitle, imageUri: imageUri, uri: uri, order: order);
  }
}
