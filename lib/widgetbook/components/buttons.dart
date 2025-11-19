import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:plantapp_case/design_system/widgets/buttons/app_button.dart';

@widgetbook.UseCase(
  name: 'Primary Button',
  type: AppButton,
)
Widget appButtonPrimary(BuildContext context) {
  return Center(
    child: AppButton(
      text: 'Primary Button',
      onPressed: () {},
      type: ButtonType.primary,
    ),
  );
}

@widgetbook.UseCase(
  name: 'Secondary Button',
  type: AppButton,
)
Widget appButtonSecondary(BuildContext context) {
  return Center(
    child: AppButton(
      text: 'Secondary Button',
      onPressed: () {},
      type: ButtonType.secondary,
    ),
  );
}