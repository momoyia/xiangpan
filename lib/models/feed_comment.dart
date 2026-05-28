class FeedComment {
  const FeedComment({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.content,
    required this.timeAgo,
    this.likeCount = 0,
  });

  final String id;
  final String authorName;
  final String authorAvatar;
  final String content;
  final String timeAgo;
  final int likeCount;
}
