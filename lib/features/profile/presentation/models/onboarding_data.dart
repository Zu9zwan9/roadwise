import 'package:flutter/material.dart';

/// Model representing a single onboarding item.
class OnboardingData {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingData({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });
}
