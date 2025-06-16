import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../bloc/lesson_bloc.dart';
import '../../../../lesson_event.dart';
import '../../../../lesson_state.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedDifficulty = 'All';
  String _selectedTopic = 'All';

  final List<String> _difficulties = [
    'All',
    'Beginner',
    'Intermediate',
    'Advanced',
  ];
  final List<String> _topics = [
    'All',
    'Traffic Signs',
    'Right of Way',
    'Defensive Driving',
  ];

  @override
  void initState() {
    super.initState();
    _loadLessons();
  }

  void _loadLessons() {
    context.read<LessonBloc>().add(const LessonLoadRequested());
  }

  void _onSearch(String query) {
    context.read<LessonBloc>().add(LessonSearchRequested(query: query));
  }

  void _showFilterSheet(String filterType) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => _buildFilterSheet(filterType),
    );
  }

  Widget _buildFilterSheet(String filterType) {
    final items = filterType == 'Difficulty' ? _difficulties : _topics;
    final selectedValue = filterType == 'Difficulty'
        ? _selectedDifficulty
        : _selectedTopic;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(top: 12),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Filter by $filterType',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),

          // Options
          ...items.map(
            (item) => ListTile(
              title: Text(item),
              trailing: selectedValue == item
                  ? const Icon(Icons.check, color: CupertinoColors.systemBlue)
                  : null,
              onTap: () {
                setState(() {
                  if (filterType == 'Difficulty') {
                    _selectedDifficulty = item;
                  } else {
                    _selectedTopic = item;
                  }
                });
                Navigator.pop(context);
                _loadLessons(); // Refresh lessons with new filter
              },
            ),
          ),

          // Safe area padding
          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.black12, width: 0.5),
                ),
              ),
              child: Column(
                children: [
                  // Title and Settings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Lessons',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () => context.push('/settings'),
                        child: const Icon(
                          CupertinoIcons.gear,
                          size: 24,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Search Bar
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: _searchController,
                      onChanged: _onSearch,
                      decoration: const InputDecoration(
                        hintText: 'Search lessons',
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Colors.grey,
                          size: 20,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Filter Buttons
                  Row(
                    children: [
                      Expanded(
                        child: _buildFilterButton(
                          'Difficulty',
                          _selectedDifficulty,
                          () => _showFilterSheet('Difficulty'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildFilterButton(
                          'Topic',
                          _selectedTopic,
                          () => _showFilterSheet('Topic'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: BlocBuilder<LessonBloc, LessonState>(
                builder: (context, state) {
                  if (state is LessonLoading) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  if (state is LessonError) {
                    return _buildErrorView(state.message);
                  }

                  if (state is LessonLoaded) {
                    if (state.lessons.isEmpty) {
                      return _buildEmptyView();
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: state.lessons.length,
                      itemBuilder: (context, index) {
                        final lesson = state.lessons[index];
                        return _buildLessonCard(lesson);
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: CupertinoColors.systemBlue,
          unselectedItemColor: Colors.grey,
          currentIndex: 1, // Lessons tab
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book),
              label: 'Lessons',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.car_detailed),
              label: 'Practice',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person),
              label: 'Profile',
            ),
          ],
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                // Already on lessons
                break;
              case 2:
                context.go('/practice');
                break;
              case 3:
                context.go('/profile');
                break;
            }
          },
        ),
      ),
    );
  }

  Widget _buildFilterButton(String title, String value, VoidCallback onTap) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              CupertinoIcons.line_horizontal_3_decrease,
              size: 16,
              color: Colors.black87,
            ),
            const SizedBox(width: 8),
            Text(
              value == 'All' ? title : value,
              style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonCard(dynamic lesson) {
    // Map difficulty to colors
    Color getDifficultyColor(String difficulty) {
      switch (difficulty.toLowerCase()) {
        case 'beginner':
          return Colors.green;
        case 'intermediate':
          return Colors.orange;
        case 'advanced':
          return Colors.red;
        default:
          return Colors.blue;
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () => context.push('/lesson/${lesson.id}'),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Lesson Image
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      lesson.imageUrl ?? 'https://via.placeholder.com/80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 16),

              // Lesson Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Difficulty Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: getDifficultyColor(
                          lesson.difficulty ?? 'beginner',
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        lesson.difficulty ?? 'Beginner',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Title
                    Text(
                      lesson.title ?? 'Lesson Title',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),

                    const SizedBox(height: 4),

                    // Description
                    Text(
                      lesson.description ??
                          'Learn important road safety concepts.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Chevron
              Icon(
                CupertinoIcons.chevron_right,
                size: 16,
                color: Colors.grey[400],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              CupertinoIcons.exclamationmark_triangle,
              size: 64,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            const Text(
              'Oops! Something went wrong',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            CupertinoButton.filled(
              onPressed: _loadLessons,
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyView() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.search, size: 64, color: Colors.grey[400]),
            const SizedBox(height: 16),
            const Text(
              'No lessons found',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              'Try adjusting your search or filters',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
