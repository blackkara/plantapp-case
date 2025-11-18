import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:plantapp_case/features/home/data/models/category_model.dart';

part 'categories_response.freezed.dart';
part 'categories_response.g.dart';

@freezed
class CategoriesResponse with _$CategoriesResponse {
  const factory CategoriesResponse({required List<CategoryModel> data, required PaginationMeta meta}) =
      _CategoriesResponse;

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) => _$CategoriesResponseFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({required Pagination pagination}) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) => _$PaginationMetaFromJson(json);
}

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    @JsonKey(name: 'pageSize') required int pageSize,
    @JsonKey(name: 'pageCount') required int pageCount,
    required int total,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);
}
