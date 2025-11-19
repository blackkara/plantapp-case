import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_event.dart';
import 'package:plantapp_case/features/home/presentation/widgets/categories_grid/categories_grid_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/greeting_widget.dart';
import 'package:plantapp_case/features/home/presentation/widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const HomeEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 46),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const GreetingWidget(),
                  const SizedBox(height: 16),

                  SearchWidget(
                    hintText: 'search.placeholder'.tr(),
                    onChanged: (value) {
                      // Handle search
                      debugPrint('Searching for: $value');
                    },
                  ),
                  const SizedBox(height: AppSpacing.lg),
                ],
              ),
            ),
            const Expanded(
              child: Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: CategoriesGridWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
