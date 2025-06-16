import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:roadwise/search_bar.dart';
import 'package:roadwise/widgets/animated_background.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_colors.dart';
import 'bloc/lesson_bloc.dart';
import 'category_chip.dart';
import 'core/widgets/glassmorphic_container.dart';
import 'lesson_card.dart';
import 'lesson_event.dart';
import 'lesson_state.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage>
    with TickerProviderStateMixin {
  final TextEditingController _searchController = TextEditingController();
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  String? _selectedCategory;
  bool _showFavoritesOnly = false;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _loadLessons();
  }

  void _setupAnimations() {
    _fadeController = AnimationController(
      duration: AppConstants.mediumAnimation,
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();
  }

  void _loadLessons() {
    context.read<LessonBloc>().add(const LessonLoadRequested());
  }

  void _onCategorySelected(String? category) {
    setState(() {
      _selectedCategory = category;
    });

    context.read<LessonBloc>().add(
      LessonLoadRequested(
        category: category,
        searchQuery: _searchController.text.isNotEmpty
            ? _searchController.text
            : null,
      ),
    );
  }

  void _onSearch(String query) {
    context.read<LessonBloc>().add(LessonSearchRequested(query: query));
  }

  void _toggleFavoritesFilter() {
    setState(() {
      _showFavoritesOnly = !_showFavoritesOnly;
    });

    // TODO: Implement favorites filtering
    _loadLessons();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Animated background
          const AnimatedBackground(),

          // Main content
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: Column(
                children: [
                  // Header section
                  Padding(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title and profile
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Learn Road Safety',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.white,
                                          shadows: [
                                            Shadow(
                                              color: AppColors.black
                                                  .withOpacity(0.3),
                                              offset: const Offset(0, 2),
                                              blurRadius: 4,
                                            ),
                                          ],
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Master traffic rules and road signs',
                                    style: Theme.of(context).textTheme.bodyLarge
                                        ?.copyWith(
                                          color: AppColors.white.withOpacity(
                                            0.8,
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            // Profile and favorites button
                            Row(
                              children: [
                                GlassmorphicContainer(
                                  padding: const EdgeInsets.all(8),
                                  child: IconButton(
                                    onPressed: _toggleFavoritesFilter,
                                    icon: Icon(
                                      _showFavoritesOnly
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: _showFavoritesOnly
                                          ? AppColors.primaryRed
                                          : AppColors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                GlassmorphicContainer(
                                  padding: const EdgeInsets.all(8),
                                  child: IconButton(
                                    onPressed: () => context.push('/profile'),
                                    icon: const Icon(
                                      Icons.person,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: AppConstants.defaultPadding),

                        // Search bar
                        LessonSearchBar(
                          controller: _searchController,
                          onSearch: _onSearch,
                          onClear: () {
                            _searchController.clear();
                            _loadLessons();
                          },
                        ),
                      ],
                    ),
                  ),

                  // Content
                  Expanded(
                    child: BlocBuilder<LessonBloc, LessonState>(
                      builder: (context, state) {
                        if (state is LessonLoading) {
                          return const Center(
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          );
                        }

                        if (state is LessonError) {
                          return Center(
                            child: GlassmorphicContainer(
                              margin: const EdgeInsets.all(
                                AppConstants.defaultPadding,
                              ),
                              padding: const EdgeInsets.all(
                                AppConstants.largePadding,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 64,
                                    color: AppColors.error,
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                  Text(
                                    'Oops! Something went wrong',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(
                                    height: AppConstants.smallPadding,
                                  ),
                                  Text(
                                    state.message,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: AppColors.white.withOpacity(
                                            0.8,
                                          ),
                                        ),
                                  ),
                                  const SizedBox(
                                    height: AppConstants.defaultPadding,
                                  ),
                                  ElevatedButton(
                                    onPressed: _loadLessons,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.primaryBlue,
                                    ),
                                    child: const Text('Try Again'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        if (state is LessonLoaded) {
                          return Column(
                            children: [
                              // Categories
                              if (state.categories.isNotEmpty) ...[
                                SizedBox(
                                  height: 50,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: AppConstants.defaultPadding,
                                    ),
                                    itemCount: state.categories.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index == 0) {
                                        return CategoryChip(
                                          label: 'All',
                                          isSelected: _selectedCategory == null,
                                          onTap: () =>
                                              _onCategorySelected(null),
                                        );
                                      }

                                      final category =
                                          state.categories[index - 1];
                                      return CategoryChip(
                                        label: category,
                                        isSelected:
                                            _selectedCategory == category,
                                        onTap: () =>
                                            _onCategorySelected(category),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: AppConstants.defaultPadding,
                                ),
                              ],

                              // Lessons grid
                              Expanded(
                                child: state.lessons.isEmpty
                                    ? Center(
                                        child: GlassmorphicContainer(
                                          margin: const EdgeInsets.all(
                                            AppConstants.defaultPadding,
                                          ),
                                          padding: const EdgeInsets.all(
                                            AppConstants.largePadding,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.search_off,
                                                size: 64,
                                                color: AppColors.white
                                                    .withOpacity(0.6),
                                              ),
                                              const SizedBox(
                                                height:
                                                    AppConstants.defaultPadding,
                                              ),
                                              Text(
                                                'No lessons found',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge
                                                    ?.copyWith(
                                                      color: AppColors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              const SizedBox(
                                                height:
                                                    AppConstants.smallPadding,
                                              ),
                                              Text(
                                                'Try adjusting your search or filters',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: AppColors.white
                                                          .withOpacity(0.8),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : GridView.builder(
                                        padding: const EdgeInsets.all(
                                          AppConstants.defaultPadding,
                                        ),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.8,
                                              crossAxisSpacing:
                                                  AppConstants.defaultPadding,
                                              mainAxisSpacing:
                                                  AppConstants.defaultPadding,
                                            ),
                                        itemCount: state.lessons.length,
                                        itemBuilder: (context, index) {
                                          final lesson = state.lessons[index];
                                          return LessonCard(
                                            lesson: lesson,
                                            onTap: () => context.push(
                                              '/lesson/${lesson.id}',
                                            ),
                                          );
                                        },
                                      ),
                              ),
                            ],
                          );
                        }

                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
