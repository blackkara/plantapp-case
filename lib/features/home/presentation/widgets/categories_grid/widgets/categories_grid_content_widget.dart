import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/category_grid_item_widget.dart';

class CategoriesGridContentWidget extends StatelessWidget {
  final List<CategoryEntity> categories;

  const CategoriesGridContentWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: AppSpacing.md,
                crossAxisSpacing: AppSpacing.md,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return AnimatedScale(
                  scale: 1.0,
                  duration: Duration(milliseconds: 200 + (index * 50)),
                  child: CategoryGridItemWidget(category: category, onTap: () {}),
                );
              },
            ),
            if (state.isLoadingMore) ...[
              const Padding(padding: EdgeInsets.all(16.0), child: CircularProgressIndicator()),
            ],
          ],
        );
      },
    );
  }
}
