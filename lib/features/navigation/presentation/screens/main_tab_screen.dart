import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp_case/core/di/injection.dart';
import 'package:plantapp_case/features/navigation/presentation/bloc/tab_bloc.dart';
import 'package:plantapp_case/features/navigation/presentation/bloc/tab_event.dart';
import 'package:plantapp_case/features/navigation/presentation/bloc/tab_state.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
import 'package:plantapp_case/features/home/presentation/screens/home_screen.dart';

class MainTabScreen extends StatelessWidget {
  const MainTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const HomeScreen(),
      const DiagnoseScreen(),
      const MyGardenScreen(),
      const ProfileScreen(),
    ];

    return BlocProvider(
      create: (context) => getIt<TabBloc>(),
      child: BlocBuilder<TabBloc, TabState>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state.currentIndex],
            floatingActionButton: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(33),
                onTap: () {
                  context.read<TabBloc>().add(const TabEvent.qrScannerPressed());
                },
                child: SvgPicture.asset('assets/images/qr.svg', width: 66, height: 66),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Color(0xEBFFFFFF),
                border: Border(top: BorderSide(color: Color(0x1A13231B), width: 1)),
              ),
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
                  child: BottomAppBar(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: const CircularNotchedRectangle(),
                    notchMargin: 8,
                    child: SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(context, 'assets/images/home.svg', 'Home', 0, state.currentIndex),
                          _buildNavItem(context, 'assets/images/healthcare.svg', 'Diagnose', 1, state.currentIndex),
                          const SizedBox(width: 44), // Space for FAB
                          _buildNavItem(context, 'assets/images/leaf.svg', 'My Garden', 2, state.currentIndex),
                          _buildNavItem(context, 'assets/images/person.svg', 'Profile', 3, state.currentIndex),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, String iconPath, String label, int index, int currentIndex) {
    final isSelected = currentIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          context.read<TabBloc>().add(TabEvent.tabChanged(index));
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 26,
                height: 26,
                colorFilter: ColorFilter.mode(isSelected ? AppColors.primary : Colors.grey, BlendMode.srcIn),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                  letterSpacing: -0.24,
                  color: isSelected ? const Color(0xFF28AF6E) : const Color(0xFF979798),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Diagnose Screen')));
  }
}

class MyGardenScreen extends StatelessWidget {
  const MyGardenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('My Garden Screen')));
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Profile Screen')));
  }
}