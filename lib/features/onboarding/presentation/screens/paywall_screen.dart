import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';
import 'package:plantapp_case/design_system/widgets/buttons/close_button.dart';
import 'package:plantapp_case/design_system/widgets/text/clickable_text.dart';
import 'package:plantapp_case/features/onboarding/presentation/widgets/pricing_section.dart';
import 'package:plantapp_case/features/onboarding/presentation/widgets/premium_features_carousel.dart';

class PaywallScreen extends StatefulWidget {
  const PaywallScreen({super.key});

  @override
  State<PaywallScreen> createState() => _PaywallScreenState();
}

class _PaywallScreenState extends State<PaywallScreen> {
  String selectedPlan = 'yearly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/images/paywall_bg.png', fit: BoxFit.cover)),
          Positioned.fill(
            child: Container(
              color: const Color(0x80000000), // Dark overlay
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [AppCloseButton(onPressed: () => Navigator.of(context).pop())],
                  ),
                  Spacer(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/premium_logo.svg'),
                          SizedBox(width: AppSpacing.sm),
                          Text('paywall.title'.tr(), style: AppTextStyles.premiumTitle),
                        ],
                      ),
                      Text('paywall.subtitle'.tr(), style: AppTextStyles.premiumSubtitle),
                    ],
                  ),

                  SizedBox(height: AppSpacing.lg),
                  const PremiumFeaturesCarousel(),
                  SizedBox(height: AppSpacing.lg),

                  PricingSection(
                    selectedPlan: selectedPlan,
                    onPlanSelected: (plan) => setState(() => selectedPlan = plan),
                  ),

                  SizedBox(height: AppSpacing.lg),

                  AppButton(
                    text: 'paywall.try_button'.tr(),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                  SizedBox(height: AppSpacing.md),

                  Text('paywall.disclaimer'.tr(), style: AppTextStyles.paywallDisclaimer, textAlign: TextAlign.center),

                  SizedBox(height: AppSpacing.sm),
                  ClickableText.custom(
                    text: 'paywall.terms_privacy_restore'.tr(),
                    clickableTexts: ['Terms', 'Privacy', 'Restore'],
                    onTaps: [
                      () => debugPrint('Terms tapped'),
                      () => debugPrint('Privacy tapped'),
                      () => debugPrint('Restore tapped'),
                    ],
                    clickableStyles: [
                      AppTextStyles.paywallTermsLinks.copyWith(decoration: TextDecoration.none),
                      AppTextStyles.paywallTermsLinks.copyWith(decoration: TextDecoration.none),
                      AppTextStyles.paywallTermsLinks.copyWith(decoration: TextDecoration.none),
                    ],
                    defaultStyle: AppTextStyles.paywallTermsLinks,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
