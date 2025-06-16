import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_colors.dart';
import 'core/widgets/glassmorphic_container.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GlassmorphicContainer(
        borderRadius: 20,
        opacity: isSelected ? 0.3 : 0.1,
        borderColor: isSelected
            ? AppColors.primaryBlue
            : AppColors.white.withOpacity(0.3),
        borderWidth: isSelected ? 2 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.smallPadding,
              ),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected
                      ? AppColors.white
                      : AppColors.white.withOpacity(0.8),
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterChip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedColor;

  const FilterChip({
    super.key,
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final color = selectedColor ?? AppColors.primaryBlue;

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GlassmorphicContainer(
        borderRadius: 20,
        opacity: isSelected ? 0.3 : 0.1,
        borderColor: isSelected ? color : AppColors.white.withOpacity(0.3),
        borderWidth: isSelected ? 2 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.smallPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    icon,
                    size: 16,
                    color: isSelected
                        ? AppColors.white
                        : AppColors.white.withOpacity(0.8),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.white.withOpacity(0.8),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DifficultyChip extends StatelessWidget {
  final int difficulty;
  final bool isSelected;
  final VoidCallback onTap;

  const DifficultyChip({
    super.key,
    required this.difficulty,
    required this.isSelected,
    required this.onTap,
  });

  String get _label {
    switch (difficulty) {
      case 1:
        return 'Beginner';
      case 2:
        return 'Intermediate';
      case 3:
        return 'Advanced';
      case 4:
        return 'Expert';
      default:
        return 'Unknown';
    }
  }

  Color get _color {
    switch (difficulty) {
      case 1:
        return AppColors.primaryGreen;
      case 2:
        return AppColors.primaryYellow;
      case 3:
        return AppColors.primaryOrange;
      case 4:
        return AppColors.primaryRed;
      default:
        return AppColors.grey500;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GlassmorphicContainer(
        borderRadius: 20,
        opacity: isSelected ? 0.3 : 0.1,
        borderColor: isSelected ? _color : AppColors.white.withOpacity(0.3),
        borderWidth: isSelected ? 2 : 1,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.defaultPadding,
                vertical: AppConstants.smallPadding,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Difficulty dots
                  Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        width: 4,
                        height: 4,
                        margin: const EdgeInsets.only(right: 2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index < difficulty
                              ? (isSelected ? AppColors.white : _color)
                              : AppColors.white.withOpacity(0.3),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _label,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.white.withOpacity(0.8),
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
