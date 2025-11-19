import 'package:flutter/material.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';

enum ButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonType type;

  const AppButton({super.key, required this.text, required this.onPressed, this.type = ButtonType.primary});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: type == ButtonType.primary
          ? Theme.of(context).elevatedButtonTheme.style
          : Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              side: WidgetStateProperty.all(BorderSide(color: AppColors.primary)),
            ),
      child: Text(text),
    );
  }
}
