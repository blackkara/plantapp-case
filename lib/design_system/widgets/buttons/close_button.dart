import 'package:flutter/material.dart';

class AppCloseButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final double size;
  final double iconSize;
  final Color? backgroundColor;
  final Color? iconColor;

  const AppCloseButton({
    super.key,
    this.onPressed,
    this.size = 24,
    this.iconSize = 12,
    this.backgroundColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black.withValues(alpha: 0.4),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset('assets/icons/close.png', width: size, height: size),
        ),
      ),
    );
  }
}
