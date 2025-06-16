import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_colors.dart';
import 'core/widgets/glassmorphic_container.dart';
import 'lesson_entity.dart';

class LessonCard extends StatelessWidget {
  final LessonEntity lesson;
  final VoidCallback onTap;
  final VoidCallback? onFavorite;
  final VoidCallback? onDownload;

  const LessonCard({
    super.key,
    required this.lesson,
    required this.onTap,
    this.onFavorite,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with image and premium badge
          Stack(
            children: [
              // Lesson image
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppConstants.borderRadius),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      _getCategoryColor(lesson.category),
                      _getCategoryColor(lesson.category).withOpacity(0.7),
                    ],
                  ),
                ),
                child: lesson.imageUrl != null
                    ? ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(AppConstants.borderRadius),
                        ),
                        child: Image.network(
                          lesson.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return _buildDefaultIcon();
                          },
                        ),
                      )
                    : _buildDefaultIcon(),
              ),

              // Premium badge
              if (lesson.isPremium)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryYellow,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star, size: 12, color: AppColors.white),
                        const SizedBox(width: 2),
                        Text(
                          'PRO',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Difficulty indicator
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      3,
                      (index) => Icon(
                        Icons.circle,
                        size: 6,
                        color: index < lesson.difficulty
                            ? AppColors.white
                            : AppColors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.smallPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    lesson.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 4),

                  // Description
                  Text(
                    lesson.description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  // Progress bar (if started)
                  if (lesson.progress > 0) ...[
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${(lesson.progress * 100).toInt()}% Complete',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: AppColors.white.withOpacity(0.8),
                              ),
                        ),
                        const SizedBox(height: 4),
                        LinearProgressIndicator(
                          value: lesson.progress,
                          backgroundColor: AppColors.white.withOpacity(0.2),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _getCategoryColor(lesson.category),
                          ),
                        ),
                      ],
                    ),
                  ],

                  const SizedBox(height: 8),

                  // Bottom row with stats and actions
                  Row(
                    children: [
                      // Duration
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: AppColors.white.withOpacity(0.6),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        lesson.estimatedDurationText,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: AppColors.white.withOpacity(0.6),
                        ),
                      ),

                      const Spacer(),

                      // Action buttons
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (onFavorite != null)
                            GestureDetector(
                              onTap: onFavorite,
                              child: Icon(
                                lesson.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                size: 18,
                                color: lesson.isFavorite
                                    ? AppColors.primaryRed
                                    : AppColors.white.withOpacity(0.6),
                              ),
                            ),

                          if (onDownload != null) ...[
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: onDownload,
                              child: Icon(
                                lesson.isDownloaded
                                    ? Icons.download_done
                                    : Icons.download,
                                size: 18,
                                color: lesson.isDownloaded
                                    ? AppColors.primaryGreen
                                    : AppColors.white.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultIcon() {
    return Center(
      child: Icon(
        _getCategoryIcon(lesson.category),
        size: 48,
        color: AppColors.white.withOpacity(0.8),
      ),
    );
  }

  Color _getCategoryColor(String category) {
    switch (category.toLowerCase()) {
      case 'traffic signs':
        return AppColors.primaryBlue;
      case 'road rules':
        return AppColors.primaryGreen;
      case 'safety':
        return AppColors.primaryRed;
      case 'parking':
        return AppColors.primaryPurple;
      case 'intersections':
        return AppColors.primaryOrange;
      default:
        return AppColors.primaryBlue;
    }
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'traffic signs':
        return Icons.traffic;
      case 'road rules':
        return Icons.rule;
      case 'safety':
        return Icons.security;
      case 'parking':
        return Icons.local_parking;
      case 'intersections':
        return Icons.merge_type;
      default:
        return Icons.school;
    }
  }
}
