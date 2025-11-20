import 'package:flutter/material.dart';
import 'package:plantapp_case/features/onboarding/presentation/widgets/pricing_card.dart';

class PricingSection extends StatelessWidget {
  final String selectedPlan;
  final ValueChanged<String> onPlanSelected;

  const PricingSection({super.key, required this.selectedPlan, required this.onPlanSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Monthly plan
        PricingCard(
          title: '1 Month',
          price: '\$2.99/month,',
          subtitle: 'auto renewable',
          badge: null,
          isSelected: selectedPlan == 'monthly',
          onTap: () => onPlanSelected('monthly'),
        ),

        const SizedBox(height: 12),

        // Yearly plan
        PricingCard(
          title: '1 Year',
          price: 'First 3 days free, then \$529,99/year',
          subtitle: '',
          badge: 'Save 50%',
          isSelected: selectedPlan == 'yearly',
          onTap: () => onPlanSelected('yearly'),
        ),
      ],
    );
  }
}
