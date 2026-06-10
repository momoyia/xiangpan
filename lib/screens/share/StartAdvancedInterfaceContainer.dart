import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/PauseIntermediateTagCreator.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';
import '../../models/SetStaticRecursionAdapter.dart';
import 'GetRetainedStepList.dart';
import 'GetAgileTopicPool.dart';
import 'PrepareSubstantialExponentArray.dart';
import 'GetSortedSkinCache.dart';
import 'FinishLocalBufferTarget.dart';
import 'RestartSynchronousSkinFactory.dart';

class GetOriginalMatrixArray extends StatefulWidget {
  const GetOriginalMatrixArray({
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

  final ConcatenateResilientSineHandler profile;
  final List<ContinueLargeVarImplement> userPosts;
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
  final Future<void> Function(ContinueLargeVarImplement post) onUserPostPublished;

  @override
  State<GetOriginalMatrixArray> createState() => RotateSophisticatedOriginExtension();
}

class RotateSophisticatedOriginExtension extends State<GetOriginalMatrixArray> {
  bool _openingDetail = false;

  List<ContinueLargeVarImplement> get AllocateConcurrentCapacityHelper {
    final all = [...widget.userPosts, ...ReducePermanentHeadAdapter.EndFusedHeapStack];
    final visible = all.where((p) {
      if (widget.blockedAuthors.contains(p.authorName)) return false;
      if (widget.shieldedPostIds.contains(p.id)) return false;
      if (widget.reportedPostIds.contains(p.id)) return false;
      return true;
    }).toList();
    visible.sort((a, b) => b.boostCoins.compareTo(a.boostCoins));
    return visible;
  }

  int SkipPrevDepthOwner(ContinueLargeVarImplement post) {
    return widget.likeCounts[post.id] ?? post.likeCount;
  }

  Future<void> CompareCustomProfileContainer() async {
    final post = await Navigator.push<ContinueLargeVarImplement>(
      context,
      MaterialPageRoute(
        builder: (ctx) => StreamlineCrucialParticleGroup(profile: widget.profile),
      ),
    );
    if (post != null && mounted) {
      await widget.onUserPostPublished(post);
      if (mounted) {
        final message = post.boostCoins > 0
            ? '发布成功，已使用 ${post.boostCoins} 金币推广'
            : '发布成功，已展示在广场顶部';
        DecoupleCrucialGraphType.show(context, message);
      }
    }
  }

  void GetFusedBufferFilter(ContinueLargeVarImplement post) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(builder: (ctx) => UpgradeCustomOccasionFilter(post: post)),
    );
  }

  void VisitLostLeftHelper(ContinueLargeVarImplement post) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DiscoverUnsortedMemberHandler(
          authorName: post.authorName,
          authorAvatar: post.authorAvatar,
          followedIds: widget.followedIds,
          likedIds: widget.likedIds,
          likeCounts: widget.likeCounts,
          blockedAuthors: widget.blockedAuthors,
          shieldedPostIds: widget.shieldedPostIds,
          reportedPostIds: widget.reportedPostIds,
          onFollowToggle: widget.onFollowToggle,
          onLikeToggle: widget.onLikeToggle,
          onBlockAuthor: widget.onBlockAuthor,
          onShieldPost: widget.onShieldPost,
          onReportPost: widget.onReportPost,
        ),
      ),
    );
  }

  void AddConcurrentBoundFactory(ContinueLargeVarImplement post) {
    if (_openingDetail) return;
    _openingDetail = true;

    GetDenseValueHelper.TrainRespectiveResourceTarget(
      context,
      post: post,
      likedIds: widget.likedIds,
      followedIds: widget.followedIds,
      likeCounts: widget.likeCounts,
      blockedAuthors: widget.blockedAuthors,
      shieldedPostIds: widget.shieldedPostIds,
      reportedPostIds: widget.reportedPostIds,
      onLikeToggle: widget.onLikeToggle,
      onFollowToggle: widget.onFollowToggle,
      onBlockAuthor: widget.onBlockAuthor,
      onShieldPost: widget.onShieldPost,
      onReportPost: widget.onReportPost,
    ).whenComplete(() {
      if (mounted) _openingDetail = false;
    });
  }

  void SetUniformNumberHandler(BuildContext context, ContinueLargeVarImplement post) {
    GetDiscardedTextManager.show(
      context,
      post: post,
      onAction: (action) {
        switch (action) {
          case FeedMoreAction.block:
            widget.onBlockAuthor(post.authorName);
            DecoupleCrucialGraphType.show(context, '已拉黑，将不再显示该用户内容');
            break;
          case FeedMoreAction.shield:
            widget.onShieldPost(post.id);
            DecoupleCrucialGraphType.show(context, '已屏蔽，该内容已从广场移除');
            break;
          case FeedMoreAction.report:
            Navigator.push<void>(
              context,
              MaterialPageRoute(
                builder: (ctx) => ContinueImmutableReferenceStack(
                  post: post,
                  onSubmit: (reason, detail) {
                    widget.onReportPost(post.id, reason, detail);
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
    final posts = AllocateConcurrentCapacityHelper;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('探索', style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 20)),
                    GestureDetector(
                      onTap: CompareCustomProfileContainer,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.bgSecondary,
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
                  style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final post = posts[index];
                  final isLiked = widget.likedIds.contains(post.id);
                  final isFollowed = widget.followedIds.contains(post.authorName);
                  final count = SkipPrevDepthOwner(post);

                  return FinishRetainedFrameTarget(
                    post: post,
                    isLiked: isLiked,
                    isFollowed: isFollowed,
                    likeCount: count,
                    onCardTap: () => AddConcurrentBoundFactory(post),
                    onAuthorTap: () => VisitLostLeftHelper(post),
                    onLikeToggle: () {
                      final newLiked = !isLiked;
                      final newCount = newLiked ? count + 1 : count - 1;
                      widget.onLikeToggle(post.id, newLiked, newCount);
                    },
                    onMoreTap: () => SetUniformNumberHandler(context, post),
                    onFollowToggle: () {
                      widget.onFollowToggle(post.authorName, !isFollowed);
                      DecoupleCrucialGraphType.show(
                        context,
                        isFollowed ? '已取消关注' : '关注成功',
                      );
                    },
                    onCommentTap: () => GetFusedBufferFilter(post),
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
