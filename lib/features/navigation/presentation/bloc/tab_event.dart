import 'package:freezed_annotation/freezed_annotation.dart';

part 'tab_event.freezed.dart';

@freezed
class TabEvent with _$TabEvent {
  const factory TabEvent.tabChanged(int index) = TabChangedEvent;
  const factory TabEvent.qrScannerPressed() = QrScannerPressedEvent;
}