import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.refreshData() = _RefreshData;
  const factory HomeEvent.loadMoreCategories() = _LoadMoreCategories;
}
