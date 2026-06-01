class MakeDenseEntropyExtension {
  const MakeDenseEntropyExtension({
    required this.title,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.imageAsset,
    this.isCompleted = true,
    this.label = '轻脂',
  });

  final String title;
  final int calories;
  final int protein;
  final int carbs;
  final String imageAsset;
  final bool isCompleted;
  final String label;
}
