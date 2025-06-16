import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/themes/app_colors.dart';
import 'core/widgets/glassmorphic_container.dart';

class LessonSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final VoidCallback? onClear;
  final String? hintText;

  const LessonSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    this.onClear,
    this.hintText,
  });

  @override
  State<LessonSearchBar> createState() => _LessonSearchBarState();
}

class _LessonSearchBarState extends State<LessonSearchBar> {
  final bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      child: TextField(
        controller: widget.controller,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
        decoration: InputDecoration(
          hintText: widget.hintText ?? 'Search lessons...',
          hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: AppColors.white.withOpacity(0.6),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.white.withOpacity(0.7),
          ),
          suffixIcon: widget.controller.text.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    widget.controller.clear();
                    widget.onClear?.call();
                    setState(() {});
                  },
                  icon: Icon(
                    Icons.clear,
                    color: AppColors.white.withOpacity(0.7),
                  ),
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppConstants.defaultPadding,
            vertical: AppConstants.defaultPadding,
          ),
        ),
        onChanged: (value) {
          setState(() {});
          if (value.length >= 2 || value.isEmpty) {
            widget.onSearch(value);
          }
        },
        onSubmitted: widget.onSearch,
      ),
    );
  }
}

class AdvancedSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onSearch;
  final Function(Map<String, dynamic>) onFilter;
  final VoidCallback? onClear;
  final List<String> categories;
  final String? hintText;

  const AdvancedSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    required this.onFilter,
    this.onClear,
    required this.categories,
    this.hintText,
  });

  @override
  State<AdvancedSearchBar> createState() => _AdvancedSearchBarState();
}

class _AdvancedSearchBarState extends State<AdvancedSearchBar>
    with SingleTickerProviderStateMixin {
  bool _showFilters = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  String? _selectedCategory;
  int? _selectedDifficulty;
  bool _premiumOnly = false;
  bool _completedOnly = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.shortAnimation,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleFilters() {
    setState(() {
      _showFilters = !_showFilters;
    });

    if (_showFilters) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _applyFilters() {
    widget.onFilter({
      'category': _selectedCategory,
      'difficulty': _selectedDifficulty,
      'premiumOnly': _premiumOnly,
      'completedOnly': _completedOnly,
    });
  }

  void _clearFilters() {
    setState(() {
      _selectedCategory = null;
      _selectedDifficulty = null;
      _premiumOnly = false;
      _completedOnly = false;
    });
    _applyFilters();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search bar
        GlassmorphicContainer(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                  decoration: InputDecoration(
                    hintText: widget.hintText ?? 'Search lessons...',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.white.withOpacity(0.6),
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.white.withOpacity(0.7),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultPadding,
                      vertical: AppConstants.defaultPadding,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.length >= 2 || value.isEmpty) {
                      widget.onSearch(value);
                    }
                  },
                  onSubmitted: widget.onSearch,
                ),
              ),

              // Filter toggle button
              IconButton(
                onPressed: _toggleFilters,
                icon: Icon(
                  _showFilters ? Icons.filter_list_off : Icons.filter_list,
                  color: AppColors.white.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),

        // Filters section
        SizeTransition(
          sizeFactor: _animation,
          child: Container(
            margin: const EdgeInsets.only(top: AppConstants.smallPadding),
            child: GlassmorphicContainer(
              padding: const EdgeInsets.all(AppConstants.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Filter header
                  Row(
                    children: [
                      Text(
                        'Filters',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: _clearFilters,
                        child: Text(
                          'Clear All',
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(color: AppColors.primaryYellow),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppConstants.smallPadding),

                  // Category filter
                  Text(
                    'Category',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: widget.categories.map((category) {
                      return FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = selected ? category : null;
                          });
                          _applyFilters();
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: AppConstants.defaultPadding),

                  // Difficulty filter
                  Text(
                    'Difficulty',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: [1, 2, 3, 4].map((difficulty) {
                      final labels = [
                        'Beginner',
                        'Intermediate',
                        'Advanced',
                        'Expert',
                      ];
                      return FilterChip(
                        label: Text(labels[difficulty - 1]),
                        selected: _selectedDifficulty == difficulty,
                        onSelected: (selected) {
                          setState(() {
                            _selectedDifficulty = selected ? difficulty : null;
                          });
                          _applyFilters();
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: AppConstants.defaultPadding),

                  // Other filters
                  Row(
                    children: [
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(
                            'Premium Only',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.white.withOpacity(0.8),
                                ),
                          ),
                          value: _premiumOnly,
                          onChanged: (value) {
                            setState(() {
                              _premiumOnly = value ?? false;
                            });
                            _applyFilters();
                          },
                          activeColor: AppColors.primaryYellow,
                          checkColor: AppColors.white,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                      Expanded(
                        child: CheckboxListTile(
                          title: Text(
                            'Completed',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: AppColors.white.withOpacity(0.8),
                                ),
                          ),
                          value: _completedOnly,
                          onChanged: (value) {
                            setState(() {
                              _completedOnly = value ?? false;
                            });
                            _applyFilters();
                          },
                          activeColor: AppColors.primaryGreen,
                          checkColor: AppColors.white,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
