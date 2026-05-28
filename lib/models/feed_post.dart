class FeedPost {
  const FeedPost({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.location,
    required this.timeAgo,
    required this.content,
    required this.tags,
    required this.imageAsset,
    required this.likeCount,
    required this.commentCount,
    this.imageUrl,
    this.tagColors = const [],
    this.localImagePath,
  });

  final String id;
  final String authorName;
  final String authorAvatar;
  final String location;
  final String timeAgo;
  final String content;
  final List<String> tags;
  final List<int> tagColors;
  final String imageAsset;
  final String? imageUrl;
  final String? localImagePath;
  final int likeCount;
  final int commentCount;

  FeedPost copyWith({
    int? likeCount,
    int? commentCount,
  }) {
    return FeedPost(
      id: id,
      authorName: authorName,
      authorAvatar: authorAvatar,
      location: location,
      timeAgo: timeAgo,
      content: content,
      tags: tags,
      tagColors: tagColors,
      imageAsset: imageAsset,
      imageUrl: imageUrl,
      localImagePath: localImagePath,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'authorName': authorName,
        'authorAvatar': authorAvatar,
        'location': location,
        'timeAgo': timeAgo,
        'content': content,
        'tags': tags,
        'tagColors': tagColors,
        'imageAsset': imageAsset,
        'imageUrl': imageUrl,
        'localImagePath': localImagePath,
        'likeCount': likeCount,
        'commentCount': commentCount,
      };

  factory FeedPost.fromJson(Map<String, dynamic> json) {
    return FeedPost(
      id: json['id'] as String,
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String,
      location: json['location'] as String? ?? '',
      timeAgo: json['timeAgo'] as String,
      content: json['content'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      tagColors: (json['tagColors'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      imageAsset: json['imageAsset'] as String,
      imageUrl: json['imageUrl'] as String?,
      localImagePath: json['localImagePath'] as String?,
      likeCount: (json['likeCount'] as num?)?.toInt() ?? 0,
      commentCount: (json['commentCount'] as num?)?.toInt() ?? 0,
    );
  }
}
