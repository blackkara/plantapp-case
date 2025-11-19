import 'package:flutter/material.dart';
import 'package:plantapp_case/core/theme/app_dimensions.dart';
import 'package:plantapp_case/features/home/domain/entities/category_entity.dart';

class CategoryGridItemWidget extends StatelessWidget {
  final CategoryEntity category;
  final VoidCallback? onTap;

  const CategoryGridItemWidget({super.key, required this.category, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 142,
        height: 142,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F6),
          borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
          border: Border.all(color: const Color(0x2E29BB89), width: 0.5),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                image: DecorationImage(
                  image: NetworkImage(category.image.url),
                  fit: BoxFit.cover,
                  onError: (error, stackTrace) {},
                ),
              ),
              child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppDimensions.radiusSm))),
            ),
            Positioned(
              top: 16,
              left: 16,

              child: Text(
                category.title,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  height: 21 / 16,
                  letterSpacing: 0,
                  color: Color(0xFF13231B),
                ),
                textAlign: TextAlign.left,
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
