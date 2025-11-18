import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';

part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String title,
    required int rank,
    required CategoryImageModel image,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
}

@freezed
class CategoryImageModel with _$CategoryImageModel {
  const factory CategoryImageModel({
    required int id,
    required String name,
    required String url,
    required int width,
    required int height,
  }) = _CategoryImageModel;

  factory CategoryImageModel.fromJson(Map<String, dynamic> json) => _$CategoryImageModelFromJson(json);
}

extension CategoryModelMapperExtension on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(id: id, name: name, title: title, rank: rank, image: image.toEntity());
  }
}

extension CategoryImageModelMapperExtension on CategoryImageModel {
  CategoryImageEntity toEntity() {
    return CategoryImageEntity(id: id, name: name, url: url, width: width, height: height);
  }
}
