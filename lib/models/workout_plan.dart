class WorkoutPlan {
  const WorkoutPlan({
    required this.id,
    required this.title,
    required this.tag,
    required this.tagColor,
    required this.duration,
    required this.level,
    required this.calories,
    required this.imageAsset,
    this.imageUrl,
    this.columnIndex = 0,
    this.imageHeight = 176,
  });

  final String id;
  final String title;
  final String tag;
  final int tagColor;
  final String duration;
  final String level;
  final int calories;
  final String imageAsset;
  final String? imageUrl;
  final int columnIndex;
  final double imageHeight;

  WorkoutPlan copyWith({
    String? title,
    String? tag,
    int? tagColor,
    String? duration,
    String? level,
    int? calories,
    String? imageAsset,
    String? imageUrl,
    int? columnIndex,
    double? imageHeight,
  }) {
    return WorkoutPlan(
      id: id,
      title: title ?? this.title,
      tag: tag ?? this.tag,
      tagColor: tagColor ?? this.tagColor,
      duration: duration ?? this.duration,
      level: level ?? this.level,
      calories: calories ?? this.calories,
      imageAsset: imageAsset ?? this.imageAsset,
      imageUrl: imageUrl ?? this.imageUrl,
      columnIndex: columnIndex ?? this.columnIndex,
      imageHeight: imageHeight ?? this.imageHeight,
    );
  }
}
