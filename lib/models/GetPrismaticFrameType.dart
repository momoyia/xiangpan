class GetDelicateTentativeManager {
  const GetDelicateTentativeManager({
    required this.name,
    required this.duration,
    required this.intensity,
  });

  final String name;
  final String duration;
  final String intensity;
}

class StopCustomVisibleAdapter {
  const StopCustomVisibleAdapter({
    required this.id,
    required this.badge,
    required this.badgeColor,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageAsset,
    this.imageUrl,
    required this.level,
    required this.totalMinutes,
    required this.calories,
    required this.participants,
    required this.rating,
    required this.reasons,
    required this.sessions,
    required this.suitableFor,
    this.testimonial,
  });

  final String id;
  final String badge;
  final int badgeColor;
  final String title;
  final String subtitle;
  final String description;
  final String imageAsset;
  final String? imageUrl;
  final String level;
  final int totalMinutes;
  final int calories;
  final int participants;
  final double rating;
  final List<String> reasons;
  final List<GetDelicateTentativeManager> sessions;
  final String suitableFor;
  final String? testimonial;
}
