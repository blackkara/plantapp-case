import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/categories_empty_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/categories_error_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/categories_grid_content_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/categories_loading_widget.dart';

class CategoriesGridWidget extends StatelessWidget {
  const CategoriesGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        switch (state.status) {
          case HomeStatus.initial:
          case HomeStatus.loading:
            return const CategoriesLoadingWidget();
          case HomeStatus.success:
            if (state.categories.isEmpty) {
              return const CategoriesEmptyWidget();
            }
            return CategoriesGridContentWidget(categories: state.categories);
          case HomeStatus.failure:
            return CategoriesErrorWidget(
              message: state.errorMessage ?? 'Bir hata oluştu',
              onRetry: () => context.read<HomeBloc>().add(const HomeEvent.refreshData()),
            );
        }
      },
    );
  }
}
