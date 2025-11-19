import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'tab_event.dart';
import 'tab_state.dart';

@injectable
class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(const TabState()) {
    on<TabChangedEvent>(_onTabChanged);
    on<QrScannerPressedEvent>(_onQrScannerPressed);
  }

  void _onTabChanged(TabChangedEvent event, Emitter<TabState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }

  void _onQrScannerPressed(QrScannerPressedEvent event, Emitter<TabState> emit) {
    emit(state.copyWith(isQrScannerOpen: true));
    // QR scanner logic burada olacak
  }
}