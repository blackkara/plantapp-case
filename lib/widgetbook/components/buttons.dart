import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';

@widgetbook.UseCase(name: 'Button Sizes Comparison', type: AppButton)
Widget appButtonSizesComparison(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Small
        SizedBox(
          width: 100,
          child: AppButton(text: 'Small', onPressed: () {}, type: ButtonType.primary),
        ),
        const SizedBox(height: 16),
        // Medium
        SizedBox(
          width: 200,
          child: AppButton(text: 'Medium Button', onPressed: () {}, type: ButtonType.primary),
        ),
        const SizedBox(height: 16),
        // Large
        SizedBox(
          width: 300,
          child: AppButton(text: 'Large Button Text', onPressed: () {}, type: ButtonType.primary),
        ),
        const SizedBox(height: 16),
        // Full Width
        SizedBox(
          width: double.infinity,
          child: AppButton(text: 'Full Width Button', onPressed: () {}, type: ButtonType.primary),
        ),
      ],
    ),
  );
}

@widgetbook.UseCase(name: 'Button Sizes Comparison Secondary', type: AppButton)
Widget appButtonSizesComparisonSecondary(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Small
        SizedBox(
          width: 100,
          child: AppButton(text: 'Small', onPressed: () {}, type: ButtonType.secondary),
        ),
        const SizedBox(height: 16),
        // Medium
        SizedBox(
          width: 200,
          child: AppButton(text: 'Medium Button', onPressed: () {}, type: ButtonType.secondary),
        ),
        const SizedBox(height: 16),
        // Large
        SizedBox(
          width: 300,
          child: AppButton(text: 'Large Button Text', onPressed: () {}, type: ButtonType.secondary),
        ),
        const SizedBox(height: 16),
        // Full Width
        SizedBox(
          width: double.infinity,
          child: AppButton(text: 'Full Width Button', onPressed: () {}, type: ButtonType.secondary),
        ),
      ],
    ),
  );
}
