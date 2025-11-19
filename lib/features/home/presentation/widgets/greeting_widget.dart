import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';

class GreetingWidget extends StatelessWidget {
  final String? userName;
  final DateTime? currentTime;

  const GreetingWidget({super.key, this.userName, this.currentTime});

  @override
  Widget build(BuildContext context) {
    final timeOfDay = _getTimeOfDay();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('greeting.hi'.tr(), style: AppTextStyles.greetingSmall),
        const SizedBox(height: AppSpacing.greetingGap),
        Row(
          children: [
            Text(_getGreetingKey(timeOfDay).tr(), style: AppTextStyles.greetingLarge),
            const SizedBox(width: AppSpacing.sm),
            Text(_getEmoji(timeOfDay), style: AppTextStyles.greetingLarge.copyWith(fontFamily: null)),
          ],
        ),
      ],
    );
  }

  String _getTimeOfDay() {
    final time = currentTime ?? DateTime.now();
    final hour = time.hour;
    if (hour < 12) return 'morning';
    if (hour < 18) return 'afternoon';
    return 'evening';
  }

  String _getGreetingKey(String timeOfDay) {
    return 'greeting.good_$timeOfDay';
  }

  String _getEmoji(String timeOfDay) {
    switch (timeOfDay) {
      case 'morning':
        return '☀️';
      case 'afternoon':
        return '⛅';
      case 'evening':
        return '🌙';
      default:
        return '☀️';
    }
  }
}
