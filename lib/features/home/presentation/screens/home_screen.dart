import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/categories_grid_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/greeting_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/questions_horizontal/questions_horizontal_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    context.read<HomeBloc>().add(const HomeEvent.started());
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
    return currentScroll >= (maxScroll * 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          const SizedBox(height: 46),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const GreetingWidget(),
                const SizedBox(height: 16),
                SearchWidget(hintText: 'search.placeholder'.tr(), onChanged: (value) {}),
                const SizedBox(height: AppSpacing.lg),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 20), child: QuestionsHorizontalWidget()),
                  const SizedBox(height: AppSpacing.lg),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: CategoriesGridWidget()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
