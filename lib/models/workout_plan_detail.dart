class WorkoutStep {
  const WorkoutStep({
    required this.title,
    required this.duration,
    this.tip,
  });

  final String title;
  final String duration;
  final String? tip;
}

class WorkoutPlanDetail {
  const WorkoutPlanDetail({
    required this.description,
    required this.coachName,
    required this.coachTitle,
    required this.rating,
    required this.participants,
    required this.steps,
    required this.equipment,
    required this.highlights,
    this.suitableFor = '所有健身水平',
  });

  final String description;
  final String coachName;
  final String coachTitle;
  final double rating;
  final int participants;
  final List<WorkoutStep> steps;
  final List<String> equipment;
  final List<String> highlights;
  final String suitableFor;
}
