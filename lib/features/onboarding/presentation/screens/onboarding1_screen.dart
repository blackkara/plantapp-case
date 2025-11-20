import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';
import 'package:plantapp_case/design_system/widgets/text/clickable_text.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/features/onboarding/presentation/screens/onboarding2_screen.dart';

class Onboarding1Screen extends StatelessWidget {
  const Onboarding1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Full screen background
          Positioned.fill(child: Image.asset('assets/images/onboarding_1.png', fit: BoxFit.cover)),
          SafeArea(
            child: Column(
              children: [
                // Title with brush effect
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: AppSpacing.xl, left: AppSpacing.xl),
                    child: ClickableText.withBrushEffect(
                      text: 'onboarding1.title'.tr(),
                      brushTexts: ['onboarding1.title_brush_word'.tr()],
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
                  padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: AppButton(
                      text: 'onboarding1.continue_button'.tr(),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Onboarding2Screen()));
                      },
                    ),
                  ),
                ),

                SizedBox(height: AppSpacing.lg),

                // Slider dots indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: AppSpacing.xs,
                      height: AppSpacing.xs,
                      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Container(
                      width: AppSpacing.xs,
                      height: AppSpacing.xs,
                      decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.5), shape: BoxShape.circle),
                    ),
                    SizedBox(width: AppSpacing.sm),
                    Container(
                      width: AppSpacing.xs,
                      height: AppSpacing.xs,
                      decoration: BoxDecoration(color: Colors.grey.withValues(alpha: 0.5), shape: BoxShape.circle),
                    ),
                  ],
                ),

                SizedBox(height: AppSpacing.xl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
