class PoolPrevLayerHelper {
  const PoolPrevLayerHelper({
    required this.distanceKm,
    required this.reward,
    required this.unlocked,
  });

  final double distanceKm;
  final String reward;
  final bool unlocked;
}

class SetSubsequentCycleStack {
  const SetSubsequentCycleStack({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.currentKm,
    required this.targetKm,
    required this.participants,
    required this.endDate,
    required this.rules,
    required this.milestones,
    required this.rewards,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final double currentKm;
  final double targetKm;
  final int participants;
  final String endDate;
  final List<String> rules;
  final List<PoolPrevLayerHelper> milestones;
  final List<String> rewards;

  double get GetNewestValueCache => (currentKm / targetKm).clamp(0.0, 1.0);
}
