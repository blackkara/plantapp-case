import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plantapp_case/core/errors/exceptions.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/domain/entities/question_entity.dart';
import 'package:plantapp_case/features/home/domain/repositories/home_repository.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeBloc bloc;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    bloc = HomeBloc(mockRepository);
  });

  tearDown(() {
    bloc.close();
  });

  final tCategory = CategoryEntity(
    id: 1,
    name: 'test',
    title: 'Test Category',
    rank: 0,
    image: CategoryImageEntity(id: 1, name: 'test.png', url: 'https://test.com/image.png', width: 100, height: 100),
  );

  final tQuestion = QuestionEntity(
    id: 1,
    title: 'Test Question',
    subtitle: 'Test Subtitle',
    imageUri: 'https://test.com/image.png',
    uri: 'https://test.com',
    order: 1,
  );

  group('HomeBloc', () {
    test('initial state is HomeState with initial status', () {
      expect(bloc.state, const HomeState());
      expect(bloc.state.status, HomeStatus.initial);
    });

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when started event is added and data is fetched successfully',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => [tCategory]);
        when(() => mockRepository.getQuestions()).thenAnswer((_) async => [tQuestion]);
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        HomeState(
          status: HomeStatus.success,
          categories: [tCategory],
          questions: [tQuestion],
          currentPage: 1,
          hasMoreCategories: false,
        ),
      ],
      verify: (_) {
        verify(() => mockRepository.getCategories(page: 1, pageSize: 6)).called(1);
        verify(() => mockRepository.getQuestions()).called(1);
        verify(() => mockRepository.hasMoreCategories(page: 1, pageSize: 6)).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, failure] when started event is added and fetch fails',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenThrow(ServerException(message: 'Server error'));
        when(() => mockRepository.getQuestions()).thenAnswer((_) async => [tQuestion]);
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        isA<HomeState>()
            .having((s) => s.status, 'status', HomeStatus.failure)
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [loading, success] when refreshData event is added',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => [tCategory]);
        when(() => mockRepository.getQuestions()).thenAnswer((_) async => [tQuestion]);
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.refreshData()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        HomeState(
          status: HomeStatus.success,
          categories: [tCategory],
          questions: [tQuestion],
          currentPage: 1,
          hasMoreCategories: false,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits success with empty lists when API returns empty data',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => []);
        when(() => mockRepository.getQuestions()).thenAnswer((_) async => []);
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        const HomeState(
          status: HomeStatus.success,
          categories: [],
          questions: [],
          currentPage: 1,
          hasMoreCategories: false,
        ),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits failure when only categories fetch fails',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenThrow(ServerException(message: 'Categories error'));
        when(() => mockRepository.getQuestions()).thenAnswer((_) async => [tQuestion]);
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        isA<HomeState>()
            .having((s) => s.status, 'status', HomeStatus.failure)
            .having((s) => s.errorMessage, 'errorMessage', contains('Categories')),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits failure when only questions fetch fails',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => [tCategory]);
        when(() => mockRepository.getQuestions()).thenThrow(ServerException(message: 'Questions error'));
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        isA<HomeState>()
            .having((s) => s.status, 'status', HomeStatus.failure)
            .having((s) => s.errorMessage, 'errorMessage', contains('Questions')),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits failure when both API calls fail',
      build: () {
        when(
          () => mockRepository.getCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenThrow(ServerException(message: 'Categories error'));
        when(() => mockRepository.getQuestions()).thenThrow(ServerException(message: 'Questions error'));
        when(
          () => mockRepository.hasMoreCategories(
            page: any(named: 'page'),
            pageSize: any(named: 'pageSize'),
          ),
        ).thenAnswer((_) async => false);
        return bloc;
      },
      act: (bloc) => bloc.add(const HomeEvent.started()),
      expect: () => [
        const HomeState(status: HomeStatus.loading, currentPage: 1),
        isA<HomeState>()
            .having((s) => s.status, 'status', HomeStatus.failure)
            .having((s) => s.errorMessage, 'errorMessage', isNotNull),
      ],
    );
  });
}
