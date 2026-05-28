import 'package:flutter/material.dart';

class OnboardingOption {
  const OnboardingOption({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

class OnboardingOptions {
  OnboardingOptions._();

  static const List<OnboardingOption> trainingGoals = [
    OnboardingOption(id: 'fat_loss', label: '减脂塑形', icon: Icons.local_fire_department_outlined),
    OnboardingOption(id: 'muscle', label: '增肌力量', icon: Icons.fitness_center_outlined),
    OnboardingOption(id: 'endurance', label: '提升耐力', icon: Icons.directions_run_outlined),
    OnboardingOption(id: 'posture', label: '改善体态', icon: Icons.self_improvement_outlined),
    OnboardingOption(id: 'relax', label: '放松减压', icon: Icons.spa_outlined),
    OnboardingOption(id: 'health', label: '保持健康', icon: Icons.favorite_outline),
  ];

  static const List<OnboardingOption> interestedSports = [
    OnboardingOption(id: 'run', label: '跑步', icon: Icons.directions_run),
    OnboardingOption(id: 'strength', label: '力量训练', icon: Icons.fitness_center),
    OnboardingOption(id: 'yoga', label: '瑜伽', icon: Icons.self_improvement),
    OnboardingOption(id: 'cycling', label: '骑行', icon: Icons.directions_bike),
    OnboardingOption(id: 'hiit', label: 'HIIT', icon: Icons.bolt),
    OnboardingOption(id: 'rope', label: '跳绳', icon: Icons.sports_gymnastics),
    OnboardingOption(id: 'hike', label: '徒步', icon: Icons.terrain),
    OnboardingOption(id: 'pilates', label: '普拉提', icon: Icons.accessibility_new),
    OnboardingOption(id: 'swim', label: '游泳', icon: Icons.pool),
    OnboardingOption(id: 'boxing', label: '拳击', icon: Icons.sports_mma),
  ];
}
