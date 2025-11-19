import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';
import 'package:plantapp_case/design_system/widgets/text/clickable_text.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';
import 'package:plantapp_case/features/onboarding/presentation/screens/onboarding1_screen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/get_started_bg.png', fit: BoxFit.cover)),
          SafeArea(
            child: Column(
              children: [
                // Title
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 46, left: 40),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'get_started.welcome_title_normal'.tr(),
                            style: AppTextStyles.titleLargeRegular,
                          ),
                          TextSpan(
                            text: 'get_started.welcome_title_highlight'.tr(),
                            style: AppTextStyles.titleLargeSemiBold,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 40),
                    child: Text('get_started.welcome_subtitle'.tr(), style: AppTextStyles.onboardingSubtitle),
                  ),
                ),

                Expanded(child: Image.asset('assets/images/get_started_bg_objects.png', fit: BoxFit.contain)),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: AppButton(
                      text: 'get_started.get_started_button'.tr(),
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const Onboarding1Screen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                ClickableText.termsAndPrivacy(
                  fullText: 'get_started.terms_text'.tr(),
                  onTermsTap: () => debugPrint('Terms of Use tapped'),
                  onPrivacyTap: () => debugPrint('Privacy Policy tapped'),
                  defaultStyle: AppTextStyles.onboardingTerms,
                  linkStyle: AppTextStyles.onboardingTermsLink,
                  textAlign: TextAlign.center,
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
