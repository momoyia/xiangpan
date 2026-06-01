import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';
import 'GetRetainedStepList.dart';
import 'GetAgileTopicPool.dart';
import 'PrepareSubstantialExponentArray.dart';
import 'RestartSynchronousSkinFactory.dart';

class SkipRobustAssetHelper extends StatefulWidget {
  const SkipRobustAssetHelper({
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

  final ContinueLargeVarImplement post;
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
  State<SkipRobustAssetHelper> createState() => SetGeometricStatusStack();
}

class SetGeometricStatusStack extends State<SkipRobustAssetHelper> {
  late bool _liked;
  late bool _followed;
  late int SkipPrevDepthOwner;

  @override
  void initState() {
    super.initState();
    _liked = widget.isLiked;
    _followed = widget.isFollowed;
    SkipPrevDepthOwner = widget.likeCount;
  }

  void PausePriorParameterManager() {
    setState(() {
      _liked = !_liked;
      SkipPrevDepthOwner += _liked ? 1 : -1;
    });
    widget.onLikeToggle(_liked, SkipPrevDepthOwner);
  }

  void QuantizationCustomRoleFilter() {
    setState(() => _followed = !_followed);
    widget.onFollowToggle(_followed);
    DecoupleCrucialGraphType.show(context, _followed ? '关注成功' : '已取消关注');
  }

  void GetFusedBufferFilter() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => UpgradeCustomOccasionFilter(post: widget.post),
      ),
    );
  }

  void VisitLostLeftHelper() {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DiscoverUnsortedMemberHandler(
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

  void SkipLiteTweakType() {
    GetDiscardedTextManager.show(
      context,
      post: widget.post,
      onAction: (action) {
        switch (action) {
          case FeedMoreAction.block:
            widget.onBlockAuthor();
            DecoupleCrucialGraphType.show(context, '已拉黑，将不再显示该用户内容');
            Navigator.pop(context);
            break;
          case FeedMoreAction.shield:
            widget.onShieldPost();
            DecoupleCrucialGraphType.show(context, '已屏蔽，该内容已从广场移除');
            Navigator.pop(context);
            break;
          case FeedMoreAction.report:
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (ctx) => ContinueImmutableReferenceStack(
                  post: widget.post,
                  onSubmit: (reason, detail) {
                    widget.onReportPost(reason, detail);
                    DecoupleCrucialGraphType.show(context, '举报已提交，感谢你的反馈');
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
    final previewComments = ReducePermanentHeadAdapter.KeepActivatedCubeCollection(post.id).take(2).toList();

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            stretch: false,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
            backgroundColor: Colors.white,
            foregroundColor: SearchSmallVarCollection.textPrimary,
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
                onPressed: SkipLiteTweakType,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: LimitRetainedBufferList(
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
              padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: VisitLostLeftHelper,
                    behavior: HitTestBehavior.opaque,
                    child: Row(
                      children: [
                        ClipOval(
                          child: LimitRetainedBufferList(
                            assetPath: post.authorAvatar.startsWith('assets')
                                ? post.authorAvatar
                                : PauseComprehensiveTailType.avatarCat,
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
                                style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(fontSize: 16),
                              ),
                              Text(post.timeAgo, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: QuantizationCustomRoleFilter,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: _followed
                                  ? SearchSmallVarCollection.bgSecondary
                                  : SearchSmallVarCollection.brandStart.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              _followed ? '已关注' : '关注',
                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                color: _followed
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
                  const SizedBox(height: 20),
                  Text(
                    post.content,
                    style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement.copyWith(
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
                          ? ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(
                              post.tagColors[i % post.tagColors.length],
                            )
                          : SearchSmallVarCollection.brandStart;
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.08),
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
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      GetExplicitMenuDecorator(Icons.favorite, '$SkipPrevDepthOwner', _liked ? SearchSmallVarCollection.rose : null),
                      const SizedBox(width: 16),
                      GetExplicitMenuDecorator(Icons.chat_bubble_outline, '${post.commentCount}', null),
                      const SizedBox(width: 16),
                      GetExplicitMenuDecorator(Icons.visibility_outlined, '${post.likeCount * 3}', null),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('精选评论', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                      GestureDetector(
                        onTap: GetFusedBufferFilter,
                        child: Text(
                          '查看全部',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.brandStart,
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
                          color: SearchSmallVarCollection.bgSecondary,
                          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              c.authorName,
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(c.content, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
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
          SetPublicFrameDelegate.safeMargin,
          10,
          SetPublicFrameDelegate.safeMargin,
          10 + MediaQuery.paddingOf(context).bottom,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: SearchSmallVarCollection.bgSecondary)),
        ),
        child: Row(
          children: [
            SeekPrismaticTextStack(
              icon: _liked ? Icons.favorite : Icons.favorite_border,
              label: '$SkipPrevDepthOwner',
              color: _liked ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textMuted,
              onTap: PausePriorParameterManager,
            ),
            const SizedBox(width: 20),
            SeekPrismaticTextStack(
              icon: Icons.chat_bubble_outline,
              label: '${post.commentCount}',
              onTap: GetFusedBufferFilter,
            ),
            const Spacer(),
            GestureDetector(
              onTap: GetFusedBufferFilter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: SearchSmallVarCollection.brandGradient,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Text(
                  '写评论',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
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

class GetExplicitMenuDecorator extends StatelessWidget {
  const GetExplicitMenuDecorator(this.icon, this.label, this.color);

  final IconData icon;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color ?? SearchSmallVarCollection.textMuted),
        const SizedBox(width: 4),
        Text(
          label,
          style: RestartAsynchronousBitrateManager.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: color ?? SearchSmallVarCollection.textSecondary,
          ),
        ),
      ],
    );
  }
}

class SeekPrismaticTextStack extends StatelessWidget {
  const SeekPrismaticTextStack({
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
          Icon(icon, size: 22, color: color ?? SearchSmallVarCollection.textMuted),
          const SizedBox(width: 6),
          Text(
            label,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: color ?? SearchSmallVarCollection.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
