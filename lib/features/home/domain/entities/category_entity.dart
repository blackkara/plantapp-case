import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int id,
    required String name,
    required String title,
    required int rank,
    required CategoryImageEntity image,
  }) = _CategoryEntity;
}

@freezed
class CategoryImageEntity with _$CategoryImageEntity {
  const factory CategoryImageEntity({
    required int id,
    required String name,
    required String url,
    required int width,
    required int height,
  }) = _CategoryImageEntity;
}
