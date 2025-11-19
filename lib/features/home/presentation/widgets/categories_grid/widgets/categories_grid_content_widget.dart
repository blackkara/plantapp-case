import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_state.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/widgets/category_grid_item_widget.dart';

class CategoriesGridContentWidget extends StatefulWidget {
  final List<CategoryEntity> categories;

  const CategoriesGridContentWidget({super.key, required this.categories});

  @override
  State<CategoriesGridContentWidget> createState() => _CategoriesGridContentWidgetState();
}

class _CategoriesGridContentWidgetState extends State<CategoriesGridContentWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<HomeBloc>().add(const HomeEvent.loadMoreCategories());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.8); // Trigger when 80% scrolled
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: GridView.builder(
                controller: _scrollController,
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.md,
                  mainAxisSpacing: AppSpacing.md,
                  childAspectRatio: 0.6, // Daha uzun items = scroll gerektiren
                ),
                itemCount: widget.categories.length,
                itemBuilder: (context, index) {
                  final category = widget.categories[index];
                  return AnimatedScale(
                    scale: 1.0,
                    duration: Duration(milliseconds: 200 + (index * 50)),
                    child: CategoryGridItemWidget(category: category, onTap: () {}),
                  );
                },
              ),
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
