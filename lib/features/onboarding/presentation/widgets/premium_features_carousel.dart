import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:plantapp_case/features/onboarding/presentation/widgets/premium_feature_card.dart';

class PremiumFeaturesCarousel extends StatelessWidget {
  const PremiumFeaturesCarousel({super.key});

  static const List<Map<String, dynamic>> _featuresData = [
    {'iconPath': 'assets/icons/scanner.png', 'titleKey': 'paywall.features.unlimited', 'subtitleKey': 'paywall.features.plant_identify'},
    {'iconPath': 'assets/icons/scanner.png', 'titleKey': 'paywall.features.faster', 'subtitleKey': 'paywall.features.process'},
    {'iconPath': 'assets/icons/speedo_meter.png', 'titleKey': 'paywall.features.detailed', 'subtitleKey': 'paywall.features.plant_care'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        clipBehavior: Clip.none,
        itemCount: _featuresData.length,
        itemBuilder: (context, index) {
          final feature = _featuresData[index];

          return Container(
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 12,
              right: index == _featuresData.length - 1 ? 0 : 0,
            ),
            child: PremiumFeatureCard(
              iconPath: feature['iconPath'] as String,
              title: (feature['titleKey'] as String).tr(),
              subtitle: (feature['subtitleKey'] as String).tr(),
            ),
          );
        },
      ),
    );
  }
}
