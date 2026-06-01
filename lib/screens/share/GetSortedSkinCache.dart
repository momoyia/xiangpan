import 'package:flutter/material.dart';
import '../../models/SetExplicitBottomContainer.dart';
import 'FinishSophisticatedCenterCollection.dart';

class GetDenseValueHelper {
  GetDenseValueHelper._();

  static Future<void> TrainRespectiveResourceTarget(
    BuildContext context, {
    required ContinueLargeVarImplement post,
    required Set<String> likedIds,
    required Set<String> followedIds,
    required Map<String, int> likeCounts,
    required void Function(String id, bool liked, int newCount) onLikeToggle,
    required void Function(String author, bool followed) onFollowToggle,
    required void Function(String author) onBlockAuthor,
    required void Function(String postId) onShieldPost,
    required void Function(String postId, String reason, String? detail) onReportPost,
  }) {
    final isLiked = likedIds.contains(post.id);
    final isFollowed = followedIds.contains(post.authorName);
    final count = likeCounts[post.id] ?? post.likeCount;

    return Navigator.of(context).push<void>(
      MaterialPageRoute(
        builder: (ctx) => SkipRobustAssetHelper(
          post: post,
          isLiked: isLiked,
          isFollowed: isFollowed,
          likeCount: count,
          followedIds: followedIds,
          likedIds: likedIds,
          likeCounts: likeCounts,
          onLikeToggle: (liked, newCount) {
            onLikeToggle(post.id, liked, newCount);
          },
          onFollowToggle: (followed) {
            onFollowToggle(post.authorName, followed);
          },
          onBlockAuthor: () => onBlockAuthor(post.authorName),
          onShieldPost: () => onShieldPost(post.id),
          onReportPost: (reason, detail) {
            onReportPost(post.id, reason, detail);
          },
          onAuthorFollowToggle: onFollowToggle,
          onPostLikeToggle: onLikeToggle,
          onBlockAuthorNamed: onBlockAuthor,
          onShieldPostById: onShieldPost,
          onReportPostById: onReportPost,
        ),
      ),
    );
  }
}
