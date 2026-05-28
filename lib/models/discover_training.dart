class DiscoverTraining {
  const DiscoverTraining({
    required this.id,
    required this.label,
    required this.title,
    required this.stars,
    required this.time,
    required this.calories,
    required this.imageAsset,
    this.imageUrl,
  });

  final String id;
  final String label;
  final String title;
  final int stars;
  final String time;
  final String calories;
  final String imageAsset;
  final String? imageUrl;

  String get starsDisplay {
    return List.generate(5, (i) => i < stars ? '★' : '☆').join();
  }
}
