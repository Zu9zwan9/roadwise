import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/app_colors.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Leaderboard',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: const Icon(
                      CupertinoIcons.info,
                      size: 24,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // Leaderboard Content
            Expanded(child: _buildLeaderboardContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildLeaderboardContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Tabs for different leaderboard categories
          Container(
            height: 44,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              children: [
                Expanded(child: _buildTabButton('Weekly', isSelected: true)),
                Expanded(child: _buildTabButton('Monthly', isSelected: false)),
                Expanded(child: _buildTabButton('All Time', isSelected: false)),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Top 3 users
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // 2nd Place
              _buildTopUser(
                rank: 2,
                name: 'Alex',
                points: 1850,
                height: 120,
                color: AppColors.xpGold,
              ),

              // 1st Place
              _buildTopUser(
                rank: 1,
                name: 'Taylor',
                points: 2340,
                height: 150,
                color: AppColors.primaryBlue,
                isFirst: true,
              ),

              // 3rd Place
              _buildTopUser(
                rank: 3,
                name: 'Jordan',
                points: 1620,
                height: 100,
                color: AppColors.primaryGreen,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // List of other users
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return _buildRankListItem(
                  rank: index + 4,
                  name: 'User ${index + 4}',
                  points: 1500 - (index * 100),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String text, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(22),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? AppColors.primaryBlue : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildTopUser({
    required int rank,
    required String name,
    required int points,
    required double height,
    required Color color,
    bool isFirst = false,
  }) {
    return Column(
      children: [
        // Crown for 1st place
        if (isFirst)
          Icon(Icons.emoji_events, color: AppColors.xpGold, size: 24),

        // User avatar
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(color: color, width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              name.substring(0, 1).toUpperCase(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // User name
        Text(
          name,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),

        // Points
        Text(
          '$points pts',
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),

        const SizedBox(height: 8),

        // Podium
        Container(
          width: 80,
          height: height,
          decoration: BoxDecoration(
            color: color.withOpacity(0.8),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '#$rank',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRankListItem({
    required int rank,
    required String name,
    required int points,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Rank
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '$rank',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // User avatar
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://via.placeholder.com/40'),
                onError: (_, __) {}, // prevents exception
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Icon(Icons.broken_image, size: 40, color: Colors.grey),
            ),
          ),

          const SizedBox(width: 16),

          // User info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$points points',
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),

          // Badge or icon
          Icon(CupertinoIcons.chevron_right, size: 16, color: Colors.grey[400]),
        ],
      ),
    );
  }
}
