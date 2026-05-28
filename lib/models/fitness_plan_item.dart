class PlanDayPreview {
  const PlanDayPreview({
    required this.dayLabel,
    required this.sessions,
  });

  final String dayLabel;
  final List<String> sessions;
}

class FeaturedFitnessPlan {
  const FeaturedFitnessPlan({
    required this.badge,
    required this.title,
    required this.subtitle,
    required this.days,
    required this.imageAsset,
    this.imageUrl,
  });

  final String badge;
  final String title;
  final String subtitle;
  final List<PlanDayPreview> days;
  final String imageAsset;
  final String? imageUrl;
}

class HotPlanRecommend {
  const HotPlanRecommend({
    required this.id,
    required this.badge,
    required this.badgeColor,
    required this.title,
    required this.subtitle,
    required this.imageAsset,
    this.imageUrl,
  });

  final String id;
  final String badge;
  final int badgeColor;
  final String title;
  final String subtitle;
  final String imageAsset;
  final String? imageUrl;
}

class FitnessPlanCard {
  const FitnessPlanCard({
    required this.id,
    required this.title,
    required this.description,
    required this.imageAsset,
    this.imageUrl,
    this.isMember = true,
    this.isSmartCustom = false,
  });

  final String id;
  final String title;
  final String description;
  final String imageAsset;
  final String? imageUrl;
  final bool isMember;
  final bool isSmartCustom;
}
