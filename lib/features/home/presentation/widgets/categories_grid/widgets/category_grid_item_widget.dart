import 'package:flutter/material.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
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
        width: AppDimensions.gridItemSize,
        height: AppDimensions.gridItemSize,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimensions.gridItemBorderRadius),
          border: Border.all(color: AppColors.border, width: 0.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                  image: DecorationImage(
                    image: NetworkImage(category.image.url),
                    fit: BoxFit.cover,
                    onError: (error, stackTrace) {},
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimensions.radiusSm),
                    color: Colors.black.withValues(alpha: 0.1),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  category.title,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppColors.textPrimary),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
