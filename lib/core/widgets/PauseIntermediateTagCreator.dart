import 'package:flutter/material.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../constants/SetPrimaryVariablePool.dart';
import '../../models/SetExplicitBottomContainer.dart';
import '../constants/SetFusedNameImplement.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';
import 'UpgradeUnsortedPrecisionPool.dart';

class FinishRetainedFrameTarget extends StatefulWidget {
  const FinishRetainedFrameTarget({
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

  final ContinueLargeVarImplement post;
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
  State<FinishRetainedFrameTarget> createState() => InitializeEphemeralSoundGroup();
}

class InitializeEphemeralSoundGroup extends State<FinishRetainedFrameTarget>
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
      margin: const EdgeInsets.only(bottom: SetPublicFrameDelegate.feedGap),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(SetPublicFrameDelegate.cardPadding),
            child: Row(
              children: [
                GestureDetector(
                  onTap: widget.onAuthorTap,
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SearchSmallVarCollection.brandStart.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: LimitRetainedBufferList(
                      assetPath: post.authorAvatar.startsWith('assets')
                          ? post.authorAvatar
                          : PauseComprehensiveTailType.avatarCat,
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
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: SearchSmallVarCollection.textPrimary,
                        ),
                      ),
                      Text(post.timeAgo, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
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
                          ? SearchSmallVarCollection.bgSecondary
                          : SearchSmallVarCollection.brandStart.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.isFollowed ? '已关注' : '关注',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: widget.isFollowed
                            ? SearchSmallVarCollection.textMuted
                            : SearchSmallVarCollection.brandStart,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SetAdvancedTernaryList(
            onTap: widget.onCardTap,
            child: LimitRetainedBufferList(
              assetPath: post.imageAsset,
              networkUrl: post.imageUrl,
              localFilePath: post.localImagePath,
              height: 224,
              width: double.infinity,
            ),
          ),
          SetAdvancedTernaryList(
            onTap: widget.onCardTap,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.cardPadding,
                SetPublicFrameDelegate.cardPadding,
                SetPublicFrameDelegate.cardPadding,
                0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.content,
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: SearchSmallVarCollection.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(post.tags.length, (i) {
                      final color = post.tagColors.isNotEmpty
                          ? ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(
                              post.tagColors[i % post.tagColors.length],
                            )
                          : SearchSmallVarCollection.brandStart;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          post.tags[i],
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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
            padding: const EdgeInsets.all(SetPublicFrameDelegate.cardPadding),
            child: Column(
              children: [
                const Divider(height: 1, color: SearchSmallVarCollection.bgSecondary),
                const SizedBox(height: 12),
                Row(
                  children: [
                    DismissResilientSignReference(
                      icon: widget.isLiked ? Icons.favorite : Icons.favorite_border,
                      iconColor: widget.isLiked ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textMuted,
                      label: '${widget.likeCount}',
                      labelColor: widget.isLiked ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textSecondary,
                      onTap: () {
                        _likeAnim.forward(from: 0).then((_) => _likeAnim.reverse());
                        widget.onLikeToggle();
                      },
                      scaleAnim: _likeAnim,
                    ),
                    const SizedBox(width: 16),
                    DismissResilientSignReference(
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
                          color: SearchSmallVarCollection.textMuted,
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
class SetAdvancedTernaryList extends StatelessWidget {
  const SetAdvancedTernaryList({required this.child, this.onTap});

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

class DismissResilientSignReference extends StatelessWidget {
  const DismissResilientSignReference({
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
    Widget iconWidget = Icon(icon, size: 18, color: iconColor ?? SearchSmallVarCollection.textMuted);
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
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: labelColor ?? SearchSmallVarCollection.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
