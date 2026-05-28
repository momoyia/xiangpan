import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';
import 'feed_author_page.dart';
import 'feed_comments_page.dart';
import 'feed_more_sheet.dart';
import 'report_page.dart';

class FeedPostDetailPage extends StatefulWidget {
  const FeedPostDetailPage({
    super.key,
    required this.post,
    required this.isLiked,
    required this.isFollowed,
    required this.likeCount,
    required this.followedIds,
    required this.likedIds,
    required this.likeCounts,
    required this.onLikeToggle,
    required this.onFollowToggle,
    required this.onBlockAuthor,
    required this.onShieldPost,
    required this.onReportPost,
    required this.onAuthorFollowToggle,
    required this.onPostLikeToggle,
    required this.onBlockAuthorNamed,
    required this.onShieldPostById,
    required this.onReportPostById,
  });

  final FeedPost post;
  final bool isLiked;
  final bool isFollowed;
  final int likeCount;
  final Set<String> followedIds;
  final Set<String> likedIds;
  final Map<String, int> likeCounts;
  final void Function(bool liked, int newCount) onLikeToggle;
  final void Function(bool followed) onFollowToggle;
  final VoidCallback onBlockAuthor;
  final VoidCallback onShieldPost;
  final void Function(String reason, String? detail) onReportPost;
  final void Function(String author, bool followed) onAuthorFollowToggle;
  final void Function(String id, bool liked, int newCount) onPostLikeToggle;
  final void Function(String author) onBlockAuthorNamed;
  final void Function(String postId) onShieldPostById;
  final void Function(String postId, String reason, String? detail) onReportPostById;

  @override
  State<FeedPostDetailPage> createState() => _FeedPostDetailPageState();
}

class _FeedPostDetailPageState extends State<FeedPostDetailPage> {
  late bool _liked;
  late bool _followed;
  late int _likeCount;

  @override
  void initState() {
    super.initState();
    _liked = widget.isLiked;
    _followed = widget.isFollowed;
    _likeCount = widget.likeCount;
  }

  void _toggleLike() {
    setState(() {
      _liked = !_liked;
      _likeCount += _liked ? 1 : -1;
    });
    widget.onLikeToggle(_liked, _likeCount);
  }

  void _toggleFollow() {
    setState(() => _followed = !_followed);
    widget.onFollowToggle(_followed);
    AppToast.show(context, _followed ? '关注成功' : '已取消关注');
  }

  void _openComments() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FeedCommentsPage(post: widget.post),
      ),
    );
  }

  void _openAuthor() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FeedAuthorPage(
          authorName: widget.post.authorName,
          authorAvatar: widget.post.authorAvatar,
          followedIds: widget.followedIds,
          likedIds: widget.likedIds,
          likeCounts: widget.likeCounts,
          onFollowToggle: widget.onAuthorFollowToggle,
          onLikeToggle: widget.onPostLikeToggle,
          onBlockAuthor: widget.onBlockAuthorNamed,
          onShieldPost: widget.onShieldPostById,
          onReportPost: widget.onReportPostById,
        ),
      ),
    );
  }

  void _openMore() {
    FeedMoreSheet.show(
      context,
      post: widget.post,
      onAction: (action) {
        switch (action) {
          case FeedMoreAction.block:
            widget.onBlockAuthor();
            AppToast.show(context, '已拉黑，将不再显示该用户内容');
            Navigator.pop(context);
            break;
          case FeedMoreAction.shield:
            widget.onShieldPost();
            AppToast.show(context, '已屏蔽，该内容已从广场移除');
            Navigator.pop(context);
            break;
          case FeedMoreAction.report:
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (ctx) => ReportPage(
                  post: widget.post,
                  onSubmit: (reason, detail) {
                    widget.onReportPost(reason, detail);
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
    final post = widget.post;
    final previewComments = MockData.feedCommentsForPost(post.id).take(2).toList();

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            stretch: false,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.more_horiz, size: 20),
                ),
                onPressed: _openMore,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: AppImage(
                      assetPath: post.imageAsset,
                      networkUrl: post.imageUrl,
                      localFilePath: post.localImagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    height: 100,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.45),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.safeMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _openAuthor,
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        ClipOval(
                          child: AppImage(
                            assetPath: post.authorAvatar.startsWith('assets')
                                ? post.authorAvatar
                                : ImageAssets.avatarCat,
                            networkUrl: post.authorAvatar.startsWith('http')
                                ? post.authorAvatar
                                : null,
                            width: 44,
                            height: 44,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                post.authorName,
                                style: AppTextStyles.h2.copyWith(fontSize: 16),
                              ),
                              Text(post.timeAgo, style: AppTextStyles.captionSmall),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: _toggleFollow,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: _followed
                                  ? AppColors.bgSecondary
                                  : AppColors.brandStart.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _followed ? '已关注' : '关注',
                              style: AppTextStyles.captionSmall.copyWith(
                                color: _followed
                                    ? AppColors.textMuted
                                    : AppColors.brandStart,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    post.content,
                    style: AppTextStyles.body.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(post.tags.length, (i) {
                      final color = post.tagColors.isNotEmpty
                          ? MockData.tagColor(
                              post.tagColors[i % post.tagColors.length],
                            )
                          : AppColors.brandStart;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          post.tags[i],
                          style: AppTextStyles.captionSmall.copyWith(
                            color: color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      _StatChip(Icons.favorite, '$_likeCount', _liked ? AppColors.rose : null),
                      const SizedBox(width: 16),
                      _StatChip(Icons.chat_bubble_outline, '${post.commentCount}', null),
                      const SizedBox(width: 16),
                      _StatChip(Icons.visibility_outlined, '${post.likeCount * 3}', null),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('精选评论', style: AppTextStyles.h2),
                      GestureDetector(
                        onTap: _openComments,
                        child: Text(
                          '查看全部',
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.brandStart,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...previewComments.map(
                    (c) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.authorName,
                              style: AppTextStyles.caption.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(c.content, style: AppTextStyles.bodySmall),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          AppConstants.safeMargin,
          10,
          AppConstants.safeMargin,
          10 + MediaQuery.paddingOf(context).bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: AppColors.bgSecondary)),
        ),
        child: Row(
          children: [
            _BottomAction(
              icon: _liked ? Icons.favorite : Icons.favorite_border,
              label: '$_likeCount',
              color: _liked ? AppColors.rose : AppColors.textMuted,
              onTap: _toggleLike,
            ),
            const SizedBox(width: 20),
            _BottomAction(
              icon: Icons.chat_bubble_outline,
              label: '${post.commentCount}',
              onTap: _openComments,
            ),
            const Spacer(),
            GestureDetector(
              onTap: _openComments,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: AppColors.brandGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  '写评论',
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip(this.icon, this.label, this.color);

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? AppColors.textMuted),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: color ?? AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _BottomAction extends StatelessWidget {
  const _BottomAction({
    required this.icon,
    required this.label,
    this.color,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final Color? color;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Icon(icon, size: 22, color: color ?? AppColors.textMuted),
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: color ?? AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
