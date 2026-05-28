import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../constants/image_assets.dart';
import '../../models/feed_post.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'app_image.dart';

class FeedPostCard extends StatefulWidget {
  const FeedPostCard({
    super.key,
    required this.post,
    required this.isLiked,
    required this.isFollowed,
    required this.likeCount,
    required this.onLikeToggle,
    required this.onMoreTap,
    required this.onFollowToggle,
    this.onCommentTap,
    this.onCardTap,
    this.onAuthorTap,
  });

  final FeedPost post;
  final bool isLiked;
  final bool isFollowed;
  final int likeCount;
  final VoidCallback onLikeToggle;
  final VoidCallback onMoreTap;
  final VoidCallback onFollowToggle;
  final VoidCallback? onCommentTap;
  final VoidCallback? onCardTap;
  final VoidCallback? onAuthorTap;

  @override
  State<FeedPostCard> createState() => _FeedPostCardState();
}

class _FeedPostCardState extends State<FeedPostCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _likeAnim;

  @override
  void initState() {
    super.initState();
    _likeAnim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _likeAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;

    return Container(
      margin: const EdgeInsets.only(bottom: AppConstants.feedGap),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppConstants.cardPadding),
            child: Row(
              children: [
                GestureDetector(
                  onTap: widget.onAuthorTap,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.brandStart.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: AppImage(
                      assetPath: post.authorAvatar.startsWith('assets')
                          ? post.authorAvatar
                          : ImageAssets.avatarCat,
                      networkUrl: post.authorAvatar.startsWith('http')
                          ? post.authorAvatar
                          : null,
                      width: 36,
                      height: 36,
                    ),
                  ),
                ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: widget.onAuthorTap,
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.authorName,
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(post.timeAgo, style: AppTextStyles.captionSmall),
                    ],
                  ),
                  ),
                ),
                GestureDetector(
                  onTap: widget.onFollowToggle,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: widget.isFollowed
                          ? AppColors.bgSecondary
                          : AppColors.brandStart.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.isFollowed ? '已关注' : '关注',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: widget.isFollowed
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
          _CardTapArea(
            onTap: widget.onCardTap,
            child: AppImage(
              assetPath: post.imageAsset,
              networkUrl: post.imageUrl,
              localFilePath: post.localImagePath,
              height: 224,
              width: double.infinity,
            ),
          ),
          _CardTapArea(
            onTap: widget.onCardTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.cardPadding,
                AppConstants.cardPadding,
                AppConstants.cardPadding,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.content,
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(post.tags.length, (i) {
                      final color = post.tagColors.isNotEmpty
                          ? MockData.tagColor(
                              post.tagColors[i % post.tagColors.length],
                            )
                          : AppColors.brandStart;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.05),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(AppConstants.cardPadding),
            child: Column(
              children: [
                const Divider(height: 1, color: AppColors.bgSecondary),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _ActionButton(
                      icon: widget.isLiked ? Icons.favorite : Icons.favorite_border,
                      iconColor: widget.isLiked ? AppColors.rose : AppColors.textMuted,
                      label: '${widget.likeCount}',
                      labelColor: widget.isLiked ? AppColors.rose : AppColors.textSecondary,
                      onTap: () {
                        _likeAnim.forward(from: 0).then((_) => _likeAnim.reverse());
                        widget.onLikeToggle();
                      },
                      scaleAnim: _likeAnim,
                    ),
                    const SizedBox(width: 16),
                    _ActionButton(
                      icon: Icons.chat_bubble_outline,
                      label: '${post.commentCount}',
                      onTap: widget.onCommentTap,
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: widget.onMoreTap,
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Icon(
                          Icons.more_horiz,
                          size: 22,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 仅包裹可进入详情的区域，避免与点赞/评论/更多手势冲突
class _CardTapArea extends StatelessWidget {
  const _CardTapArea({required this.child, this.onTap});

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    if (onTap == null) return child;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child,
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    this.iconColor,
    this.labelColor,
    this.onTap,
    this.scaleAnim,
  });

  final IconData icon;
  final String label;
  final Color? iconColor;
  final Color? labelColor;
  final VoidCallback? onTap;
  final AnimationController? scaleAnim;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = Icon(icon, size: 18, color: iconColor ?? AppColors.textMuted);
    if (scaleAnim != null) {
      iconWidget = ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 1.3).animate(
          CurvedAnimation(parent: scaleAnim!, curve: Curves.elasticOut),
        ),
        child: iconWidget,
      );
    }
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 6),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: labelColor ?? AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
