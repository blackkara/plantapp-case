import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';
import 'package:plantapp_case/design_system/widgets/text/clickable_text.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';
import 'package:plantapp_case/core/di/injection.dart';
import 'package:plantapp_case/features/home/presentation/bloc/home_bloc.dart';
import 'package:plantapp_case/features/navigation/presentation/screens/main_tab_screen.dart';

class Onboarding2Screen extends StatelessWidget {
  const Onboarding2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen background
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_2.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // Title with brush effect
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 46, left: 40),
                    child: ClickableText.withBrushEffect(
                      text: 'Get plant care guides',
                      brushTexts: ['care guides'],
                      brushImagePath: 'assets/images/brush_stroke.png',
                      onTaps: [null], // No tap action needed
                      defaultStyle: AppTextStyles.onboardingTitleMedium,
                      brushStyles: [AppTextStyles.onboardingTitleExtraBold],
                    ),
                  ),
                ),

                const Spacer(flex: 2),

                // Continue Button with padding
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: AppButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => getIt<HomeBloc>(),
                              child: const MainTabScreen(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Slider dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}