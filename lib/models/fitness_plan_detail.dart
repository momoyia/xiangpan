import 'fitness_plan_item.dart';

class FitnessPlanDetail {
  const FitnessPlanDetail({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageAsset,
    this.imageUrl,
    required this.duration,
    required this.level,
    required this.dailyCalories,
    required this.participants,
    required this.rating,
    required this.schedule,
    required this.highlights,
    this.suitableFor = '所有健身水平',
    this.isSmartCustom = false,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageAsset;
  final String? imageUrl;
  final String duration;
  final String level;
  final int dailyCalories;
  final int participants;
  final double rating;
  final List<PlanDayPreview> schedule;
  final List<String> highlights;
  final String suitableFor;
  final bool isSmartCustom;
}
