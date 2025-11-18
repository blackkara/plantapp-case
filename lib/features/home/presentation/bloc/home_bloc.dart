import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:plantapp_case/core/services/logger_service.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';
import 'package:plantapp_case/features/home/domain/repositories/home_repository.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _repository;

  HomeBloc(this._repository) : super(const HomeState()) {
    on<HomeEvent>(_onEvent);
  }

  Future<void> _onEvent(HomeEvent event, Emitter<HomeState> emit) async {
    await event.when(
      started: () => _onStarted(emit),
      refreshData: () => _onRefreshData(emit),
      loadMoreCategories: () => _onLoadMoreCategories(emit),
    );
  }

  Future<void> _onStarted(Emitter<HomeState> emit) async {
    emit(state.copyWith(status: HomeStatus.loading, currentPage: 1));
    LoggerService.debug('Loading initial categories (page: 1, pageSize: ${state.pageSize})', tag: 'HomeBloc');

    try {
      final results = await Future.wait([
        _repository.getCategories(page: 1, pageSize: state.pageSize),
        _repository.getQuestions(),
        _repository.hasMoreCategories(page: 1, pageSize: state.pageSize),
      ]);

      final categories = results[0] as List<CategoryEntity>;
      final hasMore = results[2] as bool;

      LoggerService.info('Loaded ${categories.length} categories, hasMore: $hasMore', tag: 'HomeBloc');

      emit(
        state.copyWith(
          status: HomeStatus.success,
          categories: categories,
          questions: results[1] as List<QuestionEntity>,
          hasMoreCategories: hasMore,
          currentPage: 1,
        ),
      );
    } catch (e) {
      LoggerService.error('Error loading initial categories', tag: 'HomeBloc', error: e);
      emit(state.copyWith(status: HomeStatus.failure, errorMessage: e.toString()));
    }
  }

  Future<void> _onRefreshData(Emitter<HomeState> emit) async {
    await _onStarted(emit);
  }

  Future<void> _onLoadMoreCategories(Emitter<HomeState> emit) async {
    if (state.isLoadingMore || !state.hasMoreCategories) {
      LoggerService.debug(
        'Cannot load more: isLoading=${state.isLoadingMore}, hasMore=${state.hasMoreCategories}',
        tag: 'HomeBloc',
      );
      return;
    }

    emit(state.copyWith(isLoadingMore: true));
    final nextPage = state.currentPage + 1;
    LoggerService.debug('Loading more categories (page: $nextPage, pageSize: ${state.pageSize})', tag: 'HomeBloc');

    try {
      final results = await Future.wait([
        _repository.getCategories(page: nextPage, pageSize: state.pageSize),
        _repository.hasMoreCategories(page: nextPage, pageSize: state.pageSize),
      ]);

      final newCategories = results[0] as List<CategoryEntity>;
      final hasMore = results[1] as bool;

      LoggerService.info(
        'Loaded ${newCategories.length} more categories, total: ${state.categories.length + newCategories.length}, hasMore: $hasMore',
        tag: 'HomeBloc',
      );

      emit(
        state.copyWith(
          categories: [...state.categories, ...newCategories],
          currentPage: nextPage,
          hasMoreCategories: hasMore,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      LoggerService.error('Error loading more categories', tag: 'HomeBloc', error: e);
      emit(state.copyWith(isLoadingMore: false, errorMessage: e.toString()));
    }
  }
}
