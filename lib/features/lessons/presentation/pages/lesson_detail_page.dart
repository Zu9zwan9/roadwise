import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/lesson_bloc.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/glassmorphic_container.dart';
import '../../../../lesson_event.dart';
import '../../../../lesson_state.dart';
import '../../../../widgets/animated_background.dart';
import '../widgets/topic_card.dart';

class LessonDetailPage extends StatefulWidget {
  final int lessonId;

  const LessonDetailPage({super.key, required this.lessonId});

  @override
  State<LessonDetailPage> createState() => _LessonDetailPageState();
}

class _LessonDetailPageState extends State<LessonDetailPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _setupAnimations();
    _loadLessonDetail();
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

  void _loadLessonDetail() {
    context.read<LessonBloc>().add(
      LessonDetailLoadRequested(lessonId: widget.lessonId),
    );
  }

  @override
  void dispose() {
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
                            const SizedBox(height: AppConstants.defaultPadding),
                            Text(
                              'Oops! Something went wrong',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: AppConstants.smallPadding),
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: AppColors.white.withOpacity(0.8),
                                  ),
                            ),
                            const SizedBox(height: AppConstants.defaultPadding),
                            ElevatedButton(
                              onPressed: _loadLessonDetail,
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

                  if (state is LessonDetailLoaded) {
                    final lesson = state.lesson;
                    final topics = state.topics;

                    return CustomScrollView(
                      slivers: [
                        SliverAppBar(
                          expandedHeight: 250.0,
                          floating: false,
                          pinned: true,
                          flexibleSpace: FlexibleSpaceBar(
                            title: Text(
                              lesson.title,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            background: Stack(
                              fit: StackFit.expand,
                              children: [
                                if (lesson.imageUrl != null)
                                  Image.network(
                                    lesson.imageUrl!,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: AppColors.primaryBlue,
                                        child: Center(
                                          child: Icon(
                                            Icons.school,
                                            size: 80,
                                            color: AppColors.white.withOpacity(
                                              0.8,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  )
                                else
                                  Container(
                                    color: AppColors.primaryBlue,
                                    child: Center(
                                      child: Icon(
                                        Icons.school,
                                        size: 80,
                                        color: AppColors.white.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                const DecoratedBox(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment(0.0, 0.5),
                                      end: Alignment(0.0, 0.0),
                                      colors: <Color>[
                                        Color(0x60000000),
                                        Color(0x00000000),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(
                            AppConstants.defaultPadding,
                          ),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((
                              BuildContext context,
                              int index,
                            ) {
                              if (index == 0) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GlassmorphicContainer(
                                      padding: const EdgeInsets.all(
                                        AppConstants.defaultPadding,
                                      ),
                                      child: Text(
                                        lesson.description,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                              color: AppColors.white
                                                  .withOpacity(0.9),
                                            ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: AppConstants.defaultPadding,
                                    ),
                                    Text(
                                      'Topics',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                            color: AppColors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: AppConstants.defaultPadding,
                                    ),
                                  ],
                                );
                              } else {
                                final topic = topics[index - 1];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    bottom: AppConstants.defaultPadding,
                                  ),
                                  child: TopicCard(
                                    topic: topic,
                                    onTap: () {
                                      // TODO: Navigate to topic detail/flashcard screen
                                    },
                                  ),
                                );
                              }
                            }, childCount: topics.length + 1),
                          ),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: BlocBuilder<LessonBloc, LessonState>(
        builder: (context, state) {
          if (state is LessonDetailLoaded) {
            return FloatingActionButton.extended(
              onPressed: () {
                // TODO: Start lesson logic
                context.read<LessonBloc>().add(
                  LessonStartRequested(
                    lessonId: state.lesson.id,
                    userId: 1, // Placeholder for current user ID
                  ),
                );
              },
              label: Text(
                state.isStarted ? 'Continue Lesson' : 'Start Lesson',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(
                state.isStarted ? Icons.play_arrow : Icons.school,
                color: AppColors.white,
              ),
              backgroundColor: AppColors.primaryGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.borderRadius),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
