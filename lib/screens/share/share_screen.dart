import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/feed_post_card.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';
import '../../models/user_profile.dart';
import 'feed_author_page.dart';
import 'feed_comments_page.dart';
import 'feed_more_sheet.dart';
import 'feed_post_navigation.dart';
import 'feed_publish_page.dart';
import 'report_page.dart';

class ShareScreen extends StatefulWidget {
  const ShareScreen({
    super.key,
    required this.profile,
    required this.userPosts,
    required this.likedIds,
    required this.followedIds,
    required this.likeCounts,
    required this.blockedAuthors,
    required this.shieldedPostIds,
    required this.reportedPostIds,
    required this.onLikeToggle,
    required this.onFollowToggle,
    required this.onBlockAuthor,
    required this.onShieldPost,
    required this.onReportPost,
    required this.onUserPostPublished,
  });

  final UserProfile profile;
  final List<FeedPost> userPosts;
  final Set<String> likedIds;
  final Set<String> followedIds;
  final Map<String, int> likeCounts;
  final Set<String> blockedAuthors;
  final Set<String> shieldedPostIds;
  final Set<String> reportedPostIds;
  final void Function(String id, bool liked, int newCount) onLikeToggle;
  final void Function(String author, bool followed) onFollowToggle;
  final void Function(String author) onBlockAuthor;
  final void Function(String postId) onShieldPost;
  final void Function(String postId, String reason, String? detail) onReportPost;
  final Future<void> Function(FeedPost post) onUserPostPublished;

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
  bool _openingDetail = false;

  List<FeedPost> get _visiblePosts {
    final all = [...widget.userPosts, ...MockData.feedPosts];
    return all.where((p) {
      if (widget.blockedAuthors.contains(p.authorName)) return false;
      if (widget.shieldedPostIds.contains(p.id)) return false;
      if (widget.reportedPostIds.contains(p.id)) return false;
      return true;
    }).toList();
  }

  int _likeCount(FeedPost post) {
    return widget.likeCounts[post.id] ?? post.likeCount;
  }

  Future<void> _openPublish() async {
    final post = await Navigator.push<FeedPost>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FeedPublishPage(profile: widget.profile),
      ),
    );
    if (post != null && mounted) {
      await widget.onUserPostPublished(post);
      if (mounted) {
        AppToast.show(context, '发布成功，已展示在广场顶部');
      }
    }
  }

  void _openComments(FeedPost post) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(builder: (ctx) => FeedCommentsPage(post: post)),
    );
  }

  void _openAuthor(FeedPost post) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FeedAuthorPage(
          authorName: post.authorName,
          authorAvatar: post.authorAvatar,
          followedIds: widget.followedIds,
          likedIds: widget.likedIds,
          likeCounts: widget.likeCounts,
          onFollowToggle: widget.onFollowToggle,
          onLikeToggle: widget.onLikeToggle,
          onBlockAuthor: widget.onBlockAuthor,
          onShieldPost: widget.onShieldPost,
          onReportPost: widget.onReportPost,
        ),
      ),
    );
  }

  void _openDetail(FeedPost post) {
    if (_openingDetail) return;
    _openingDetail = true;

    FeedPostNavigation.openDetail(
      context,
      post: post,
      likedIds: widget.likedIds,
      followedIds: widget.followedIds,
      likeCounts: widget.likeCounts,
      onLikeToggle: widget.onLikeToggle,
      onFollowToggle: widget.onFollowToggle,
      onBlockAuthor: widget.onBlockAuthor,
      onShieldPost: widget.onShieldPost,
      onReportPost: widget.onReportPost,
    ).whenComplete(() {
      if (mounted) _openingDetail = false;
    });
  }

  void _openMoreMenu(BuildContext context, FeedPost post) {
    FeedMoreSheet.show(
      context,
      post: post,
      onAction: (action) {
        switch (action) {
          case FeedMoreAction.block:
            widget.onBlockAuthor(post.authorName);
            AppToast.show(context, '已拉黑，将不再显示该用户内容');
            break;
          case FeedMoreAction.shield:
            widget.onShieldPost(post.id);
            AppToast.show(context, '已屏蔽，该内容已从广场移除');
            break;
          case FeedMoreAction.report:
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (ctx) => ReportPage(
                  post: post,
                  onSubmit: (reason, detail) {
                    widget.onReportPost(post.id, reason, detail);
                    AppToast.show(context, '举报已提交，感谢你的反馈');
                  },
                ),
              ),
            );
            break;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final posts = _visiblePosts;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('探索', style: AppTextStyles.h1.copyWith(fontSize: 20)),
                    GestureDetector(
                      onTap: _openPublish,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        if (posts.isEmpty)
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  '暂无可见动态\n拉黑或屏蔽的内容已隐藏',
                  style: AppTextStyles.body,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final post = posts[index];
                  final isLiked = widget.likedIds.contains(post.id);
                  final isFollowed = widget.followedIds.contains(post.authorName);
                  final count = _likeCount(post);

                  return FeedPostCard(
                    post: post,
                    isLiked: isLiked,
                    isFollowed: isFollowed,
                    likeCount: count,
                    onCardTap: () => _openDetail(post),
                    onAuthorTap: () => _openAuthor(post),
                    onLikeToggle: () {
                      final newLiked = !isLiked;
                      final newCount = newLiked ? count + 1 : count - 1;
                      widget.onLikeToggle(post.id, newLiked, newCount);
                    },
                    onMoreTap: () => _openMoreMenu(context, post),
                    onFollowToggle: () {
                      widget.onFollowToggle(post.authorName, !isFollowed);
                      AppToast.show(
                        context,
                        isFollowed ? '已取消关注' : '关注成功',
                      );
                    },
                    onCommentTap: () => _openComments(post),
                  );
                },
                childCount: posts.length,
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: 88)),
      ],
    );
  }
}
