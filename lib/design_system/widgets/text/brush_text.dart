import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class BrushText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String brushImagePath;
  final VoidCallback? onTap;
  final EdgeInsets? padding;
  final double brushHeight;
  final double brushBottomOffset;
  final double brushOpacity;

  const BrushText({
    super.key,
    required this.text,
    required this.brushImagePath,
    this.textStyle,
    this.onTap,
    this.padding,
    this.brushHeight = 16,
    this.brushBottomOffset = -12,
    this.brushOpacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 2, vertical: 4),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Metin (referans noktası)
            Text(
              text,
              style: textStyle,
            ),
            // Fırça darbesi (metnin baseline'ına göre konumlandırılmış)
            Positioned(
              bottom: brushBottomOffset,
              left: 0,
              right: 0,
              child: IgnorePointer( // Tıklamaya müdahale etmesin
                child: SizedBox(
                  height: brushHeight,
                  child: Image.asset(
                    brushImagePath,
                    fit: BoxFit.fitWidth,
                    height: brushHeight,
                    color: textStyle?.color?.withValues(alpha: brushOpacity),
                    colorBlendMode: BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}