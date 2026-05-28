import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';
import 'feed_post_detail_page.dart';

class FeedAuthorPage extends StatefulWidget {
  const FeedAuthorPage({
    super.key,
    required this.authorName,
    required this.authorAvatar,
    required this.followedIds,
    required this.likedIds,
    required this.likeCounts,
    required this.onFollowToggle,
    required this.onLikeToggle,
    required this.onBlockAuthor,
    required this.onShieldPost,
    required this.onReportPost,
  });

  final String authorName;
  final String authorAvatar;
  final Set<String> followedIds;
  final Set<String> likedIds;
  final Map<String, int> likeCounts;
  final void Function(String author, bool followed) onFollowToggle;
  final void Function(String id, bool liked, int newCount) onLikeToggle;
  final void Function(String author) onBlockAuthor;
  final void Function(String postId) onShieldPost;
  final void Function(String postId, String reason, String? detail) onReportPost;

  @override
  State<FeedAuthorPage> createState() => _FeedAuthorPageState();
}

class _FeedAuthorPageState extends State<FeedAuthorPage> {
  late bool _followed;

  @override
  void initState() {
    super.initState();
    _followed = widget.followedIds.contains(widget.authorName);
  }

  void _toggleFollow() {
    setState(() => _followed = !_followed);
    widget.onFollowToggle(widget.authorName, _followed);
    AppToast.show(context, _followed ? '关注成功' : '已取消关注');
  }

  void _openPost(FeedPost post) {
    final isLiked = widget.likedIds.contains(post.id);
    final count = widget.likeCounts[post.id] ?? post.likeCount;
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FeedPostDetailPage(
          post: post,
          isLiked: isLiked,
          isFollowed: _followed,
          likeCount: count,
          followedIds: widget.followedIds,
          likedIds: widget.likedIds,
          likeCounts: widget.likeCounts,
          onLikeToggle: (liked, newCount) {
            widget.onLikeToggle(post.id, liked, newCount);
          },
          onFollowToggle: (followed) {
            setState(() => _followed = followed);
            widget.onFollowToggle(widget.authorName, followed);
          },
          onAuthorFollowToggle: widget.onFollowToggle,
          onPostLikeToggle: widget.onLikeToggle,
          onBlockAuthor: () => widget.onBlockAuthor(widget.authorName),
          onShieldPost: () => widget.onShieldPost(post.id),
          onReportPost: (reason, detail) {
            widget.onReportPost(post.id, reason, detail);
          },
          onBlockAuthorNamed: widget.onBlockAuthor,
          onShieldPostById: widget.onShieldPost,
          onReportPostById: widget.onReportPost,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final posts = MockData.feedPostsByAuthor(widget.authorName);
    final stats = MockData.feedAuthorStats(widget.authorName);
    final bio = MockData.feedAuthorBio(widget.authorName);

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('星友主页', style: AppTextStyles.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.safeMargin),
              child: Column(
                children: [
                  ClipOval(
                    child: AppImage(
                      assetPath: widget.authorAvatar.startsWith('assets')
                          ? widget.authorAvatar
                          : ImageAssets.avatarCat,
                      networkUrl: widget.authorAvatar.startsWith('http')
                          ? widget.authorAvatar
                          : null,
                      width: 72,
                      height: 72,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(widget.authorName, style: AppTextStyles.h1.copyWith(fontSize: 20)),
                  const SizedBox(height: 6),
                  Text(
                    bio,
                    style: AppTextStyles.bodySmall.copyWith(color: AppColors.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _AuthorStat('动态', '${stats.posts}'),
                      _divider(),
                      _AuthorStat('粉丝', _formatCount(stats.followers)),
                      _divider(),
                      _AuthorStat('获赞', _formatCount(stats.likes)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 140,
                    child: GestureDetector(
                      onTap: _toggleFollow,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: _followed ? null : AppColors.brandGradient,
                          color: _followed ? AppColors.bgSecondary : null,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            _followed ? '已关注' : '关注',
                            style: AppTextStyles.caption.copyWith(
                              color: _followed ? AppColors.textMuted : Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('TA 的动态', style: AppTextStyles.h2),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (posts.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  '暂无动态',
                  style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
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
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => _openPost(post),
                          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(AppConstants.radiusMedium),
                              border: Border.all(color: AppColors.bgSecondary),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(AppConstants.radiusMedium),
                                  ),
                                  child: AppImage(
                                    assetPath: post.imageAsset,
                                    networkUrl: post.imageUrl,
                                    localFilePath: post.localImagePath,
                                    width: 88,
                                    height: 88,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          post.content,
                                          style: AppTextStyles.caption.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${post.likeCount} 赞 · ${post.commentCount} 评论',
                                          style: AppTextStyles.captionSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 18,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  String _formatCount(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    return '$n';
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.bgSecondary,
    );
  }
}

class _AuthorStat extends StatelessWidget {
  const _AuthorStat(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.h2.copyWith(fontSize: 18),
        ),
        Text(label, style: AppTextStyles.captionSmall),
      ],
    );
  }
}
