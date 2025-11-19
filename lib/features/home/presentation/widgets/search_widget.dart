import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plantapp_case/core/theme/app_colors.dart';
import 'package:plantapp_case/core/theme/app_dimensions.dart';
import 'package:plantapp_case/core/theme/app_spacing.dart';
import 'package:plantapp_case/core/theme/app_text_styles.dart';

class SearchWidget extends StatelessWidget {
  final String? hintText;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final bool enabled;

  const SearchWidget({super.key, this.hintText, this.onTap, this.onChanged, this.controller, this.enabled = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppDimensions.searchBorderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: AppDimensions.searchBlurRadius, sigmaY: AppDimensions.searchBlurRadius),
        child: Container(
          height: AppDimensions.searchWidgetHeight,
          decoration: BoxDecoration(
            color: AppColors.searchBackground,
            borderRadius: BorderRadius.circular(AppDimensions.searchBorderRadius),
            border: Border.all(color: AppColors.searchBorder, width: AppDimensions.searchBorderWidth),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.searchIconPadding),
                child: _buildSearchIcon(),
              ),

              const SizedBox(width: AppSpacing.searchIconTextGap),

              Expanded(
                child: enabled
                    ? TextField(
                        controller: controller,
                        onChanged: onChanged,
                        style: AppTextStyles.searchHint.copyWith(color: AppColors.textPrimary),
                        decoration: InputDecoration(
                          hintText: hintText ?? 'search.placeholder'.tr(),
                          hintStyle: AppTextStyles.searchHint,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(
                            top: AppSpacing.searchInternalPadding,
                            bottom: AppSpacing.searchInternalPadding,
                            right: AppSpacing.searchIconPadding,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: onTap,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(right: AppSpacing.searchIconPadding),
                          child: Text(hintText ?? 'search.placeholder'.tr(), style: AppTextStyles.searchHint),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchIcon() {
    try {
      return SvgPicture.asset(
        'assets/icons/search_icon.svg',
        width: AppDimensions.searchIconSize,
        height: AppDimensions.searchIconSize,
        colorFilter: const ColorFilter.mode(AppColors.searchIcon, BlendMode.srcIn),
      );
    } catch (e) {
      return const Icon(Icons.search, color: AppColors.searchIcon, size: AppDimensions.searchIconSize);
    }
  }
}
