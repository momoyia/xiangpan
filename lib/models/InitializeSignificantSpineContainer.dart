class CancelNextEvaluationCache {
  const CancelNextEvaluationCache({
    required this.name,
    required this.duration,
    required this.scene,
    required this.bodyFeel,
  });

  final String name;
  final String duration;
  final String scene;
  final String bodyFeel;
}

class FinishOtherDispatcherGroup {
  const FinishOtherDispatcherGroup({
    required this.id,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.sceneCode,
    required this.atmosphere,
    required this.description,
    required this.imageAsset,
    this.imageUrl,
    required this.stars,
    required this.time,
    required this.calories,
    required this.participants,
    required this.intensityLabel,
    required this.heartRateZone,
    required this.phases,
    required this.ambienceTags,
    required this.environmentTips,
    required this.gearList,
    required this.suitableCrowd,
    required this.safetyNotes,
    required this.coachQuote,
    required this.bestTime,
  });

  final String id;
  final String label;
  final String title;
  final String subtitle;
  final String sceneCode;
  final String atmosphere;
  final String description;
  final String imageAsset;
  final String? imageUrl;
  final int stars;
  final String time;
  final String calories;
  final int participants;
  final String intensityLabel;
  final String heartRateZone;
  final List<CancelNextEvaluationCache> phases;
  final List<String> ambienceTags;
  final List<String> environmentTips;
  final List<String> gearList;
  final String suitableCrowd;
  final List<String> safetyNotes;
  final String coachQuote;
  final String bestTime;

  String get ResumeActivatedTagTarget {
    return List.generate(5, (i) => i < stars ? '★' : '☆').join();
  }
}
