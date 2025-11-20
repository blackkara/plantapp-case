import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumFeatureCard extends StatelessWidget {
  final IconData? icon;
  final String? iconPath;
  final String title;
  final String subtitle;
  final double width;
  final double height;

  const PremiumFeatureCard({
    super.key,
    this.icon,
    this.iconPath,
    required this.title,
    required this.subtitle,
    this.width = 155, // Fixed Figma width
    this.height = 124, // Fixed Figma height
  }) : assert(icon != null || iconPath != null, 'Either icon or iconPath must be provided');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: const Color(0x14FFFFFF), // #FFFFFF 8% opacity
            borderRadius: BorderRadius.circular(14),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon container
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: const Color(0x3D000000), // #000000 24% opacity
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: _buildIcon()),
                ),

                const SizedBox(height: 10), // Gap between elements
                // Title
                Text(
                  title,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w500, // Medium
                    fontSize: 20,
                    height: 24 / 20, // lineHeight 24px
                    letterSpacing: 0.38,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                // Subtitle
                Text(
                  subtitle,
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400, // Regular
                    fontSize: 13,
                    height: 18 / 13, // lineHeight 18px
                    letterSpacing: -0.08,
                    color: Colors.white.withValues(alpha: 0.7),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    if (iconPath != null) {
      return Image.asset(iconPath!, width: 20, height: 20, color: Colors.white);
    } else {
      return Icon(icon!, size: 20, color: Colors.white);
    }
  }
}
