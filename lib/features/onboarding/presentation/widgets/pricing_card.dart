import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final String subtitle;
  final String? badge;
  final bool isSelected;
  final VoidCallback onTap;

  const PricingCard({
    super.key,
    required this.title,
    required this.price,
    required this.subtitle,
    this.badge,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1D2B20), // Dark green background
          borderRadius: BorderRadius.circular(14),
          border: isSelected
              ? Border.all(color: const Color(0xFF28AF6E), width: 2)
              : Border.all(color: const Color(0x4DFFFFFF), width: 0.5), // #FFFFFF4D
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Selection icon
                  SvgPicture.asset(
                    isSelected ? 'assets/images/selected.svg' : 'assets/images/unselected.svg',
                    width: 24,
                    height: 24,
                  ),

                  const SizedBox(width: 16),

                  // Text content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Title
                        Text(
                          title,
                          style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500, // Medium
                            height: 1.0, // 100% line height
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 4),

                        // Price and subtitle row
                        Row(
                          children: [
                            Text(
                              price,
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w300, // Light
                                height: 1.0, // 100% line height
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              subtitle,
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                                fontWeight: FontWeight.w400, // Regular
                                height: 1.0, // 100% line height
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Badge (if exists)
            if (badge != null)
              Positioned(
                top: -1,
                right: -1,
                child: Container(
                  width: 77,
                  height: 27,
                  decoration: const BoxDecoration(
                    color: Color(0xFF28AF6E),
                    borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomLeft: Radius.circular(20)),
                  ),
                  child: Center(
                    child: Text(
                      badge!,
                      style: GoogleFonts.roboto(
                        fontSize: 12,
                        fontWeight: FontWeight.w500, // Medium
                        height: 18 / 12, // 18px line height
                        color: Colors.white,
                      ),
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
