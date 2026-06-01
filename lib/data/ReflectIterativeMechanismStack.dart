import 'package:flutter/material.dart';

class SetConsultativeQuaternionType {
  const SetConsultativeQuaternionType({
    required this.id,
    required this.label,
    required this.icon,
  });

  final String id;
  final String label;
  final IconData icon;
}

class PoolIntuitiveVarCreator {
  PoolIntuitiveVarCreator._();

  static const List<SetConsultativeQuaternionType> trainingGoals = [
    SetConsultativeQuaternionType(id: 'fat_loss', label: '减脂塑形', icon: Icons.local_fire_department_outlined),
    SetConsultativeQuaternionType(id: 'muscle', label: '增肌力量', icon: Icons.fitness_center_outlined),
    SetConsultativeQuaternionType(id: 'endurance', label: '提升耐力', icon: Icons.directions_run_outlined),
    SetConsultativeQuaternionType(id: 'posture', label: '改善体态', icon: Icons.self_improvement_outlined),
    SetConsultativeQuaternionType(id: 'relax', label: '放松减压', icon: Icons.spa_outlined),
    SetConsultativeQuaternionType(id: 'health', label: '保持健康', icon: Icons.favorite_outline),
  ];

  static const List<SetConsultativeQuaternionType> interestedSports = [
    SetConsultativeQuaternionType(id: 'run', label: '跑步', icon: Icons.directions_run),
    SetConsultativeQuaternionType(id: 'strength', label: '力量训练', icon: Icons.fitness_center),
    SetConsultativeQuaternionType(id: 'yoga', label: '瑜伽', icon: Icons.self_improvement),
    SetConsultativeQuaternionType(id: 'cycling', label: '骑行', icon: Icons.directions_bike),
    SetConsultativeQuaternionType(id: 'hiit', label: 'HIIT', icon: Icons.bolt),
    SetConsultativeQuaternionType(id: 'rope', label: '跳绳', icon: Icons.sports_gymnastics),
    SetConsultativeQuaternionType(id: 'hike', label: '徒步', icon: Icons.terrain),
    SetConsultativeQuaternionType(id: 'pilates', label: '普拉提', icon: Icons.accessibility_new),
    SetConsultativeQuaternionType(id: 'swim', label: '游泳', icon: Icons.pool),
    SetConsultativeQuaternionType(id: 'boxing', label: '拳击', icon: Icons.sports_mma),
  ];
}
