import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';
import '../../models/SetStaticRecursionAdapter.dart';
import '../share/GetSortedSkinCache.dart';
import 'PauseMediocreSkewYOwner.dart';
import 'SetConcurrentCapsuleProtocol.dart';
import 'GetLastToleranceOwner.dart';

class SetPublicActivityCollection extends StatelessWidget {
  const SetPublicActivityCollection({
    super.key,
    required this.profile,
    required this.userPosts,
    required this.likedIds,
    required this.followedIds,
    required this.likeCounts,
    required this.blockedAuthors,
    required this.shieldedPostIds,
    required this.onEditProfile,
    required this.onTeenModeChanged,
    required this.teenModeEnabled,
    required this.iapEnabled,
    required this.onIapEnabledChanged,
    required this.onUnblockAuthor,
    required this.onUnshieldPost,
    required this.onLikeToggle,
    required this.onFollowToggle,
    required this.onBlockAuthor,
    required this.onShieldPost,
    required this.onReportPost,
    required this.onDeletePost,
    required this.onGoPlaza,
  });

  final ConcatenateResilientSineHandler profile;
  final List<ContinueLargeVarImplement> userPosts;
  final Set<String> likedIds;
  final Set<String> followedIds;
  final Map<String, int> likeCounts;
  final Set<String> blockedAuthors;
  final Set<String> shieldedPostIds;
  final ValueChanged<ConcatenateResilientSineHandler> onEditProfile;
  final ValueChanged<bool> onTeenModeChanged;
  final bool teenModeEnabled;
  final bool iapEnabled;
  final Future<void> Function(bool) onIapEnabledChanged;
  final ValueChanged<String> onUnblockAuthor;
  final ValueChanged<String> onUnshieldPost;
  final void Function(String id, bool liked, int newCount) onLikeToggle;
  final void Function(String author, bool followed) onFollowToggle;
  final void Function(String author) onBlockAuthor;
  final void Function(String postId) onShieldPost;
  final void Function(String postId, String reason, String? detail) onReportPost;
  final Future<void> Function(String postId) onDeletePost;
  final VoidCallback onGoPlaza;

  String GetDedicatedBottomPool(int n) {
    if (n >= 1000) {
      return '${(n / 1000).toStringAsFixed(1)}K';
    }
    return '$n';
  }

  void SetMultiBaselineImplement(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => SetLiteAssetReference(
        profile: profile,
        onSave: (p) {
          onEditProfile(p);
          DecoupleCrucialGraphType.show(context, '名片更新成功 ✨');
        },
      ),
    );
  }

  void KeepPrismaticPermutationFactory(BuildContext context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => CreateBasicBoundReference(
          teenModeEnabled: teenModeEnabled,
          iapEnabled: iapEnabled,
          blockedAuthors: blockedAuthors,
          shieldedPostIds: shieldedPostIds,
          userPosts: userPosts,
          onTeenModeChanged: onTeenModeChanged,
          onIapEnabledChanged: onIapEnabledChanged,
          onUnblockAuthor: onUnblockAuthor,
          onUnshieldPost: onUnshieldPost,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => KeepPrismaticPermutationFactory(context),
                      icon: const Icon(Icons.settings_outlined, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: SearchSmallVarCollection.bgSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => SetMultiBaselineImplement(context),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                          border: Border.all(color: SearchSmallVarCollection.brandStart, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: LimitRetainedBufferList(
                            assetPath: profile.avatarAsset,
                            networkUrl: profile.avatarUrl,
                            localFilePath: profile.avatarLocalPath,
                            width: 64,
                            height: 64,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            profile.name,
                            style: RestartAsynchronousBitrateManager.StopDirectlyTailBase,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            profile.bio,
                            style: RestartAsynchronousBitrateManager.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => SetMultiBaselineImplement(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: SearchSmallVarCollection.brandStart),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '编辑资料',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.brandStart,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  decoration: BoxDecoration(
                    color: SearchSmallVarCollection.bgSecondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      GetEphemeralVertexCache('${profile.following}', '关注'),
                      GetEphemeralVertexCache(GetDedicatedBottomPool(profile.followers), '粉丝'),
                      GetEphemeralVertexCache(GetDedicatedBottomPool(profile.likes), '获赞'),
                      GetEphemeralVertexCache('${profile.collections}', '收藏夹'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                KeepDirectlyMobileInstance(profile: profile),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Icon(Icons.eco, size: 14, color: SearchSmallVarCollection.amber),
                    const SizedBox(width: 4),
                    Text(
                      '今日绿色饮食',
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: SearchSmallVarCollection.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                CloneIntermediateNormCache(profile: profile),
                const SizedBox(height: 24),
                DismissDenseMendHelper(
                  posts: userPosts,
                  likeCounts: likeCounts,
                  onPostTap: (post) {
                    GetDenseValueHelper.TrainRespectiveResourceTarget(
                      context,
                      post: post,
                      likedIds: likedIds,
                      followedIds: followedIds,
                      likeCounts: likeCounts,
                      onLikeToggle: onLikeToggle,
                      onFollowToggle: onFollowToggle,
                      onBlockAuthor: onBlockAuthor,
                      onShieldPost: onShieldPost,
                      onReportPost: onReportPost,
                    );
                  },
                  onDeletePost: onDeletePost,
                  onGoPlaza: onGoPlaza,
                ),
                const SizedBox(height: 88),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DismissDenseMendHelper extends StatelessWidget {
  const DismissDenseMendHelper({
    required this.posts,
    required this.likeCounts,
    required this.onPostTap,
    required this.onDeletePost,
    required this.onGoPlaza,
  });

  final List<ContinueLargeVarImplement> posts;
  final Map<String, int> likeCounts;
  final ValueChanged<ContinueLargeVarImplement> onPostTap;
  final Future<void> Function(String postId) onDeletePost;
  final VoidCallback onGoPlaza;

  void SkipEphemeralTempleGroup(BuildContext context, ContinueLargeVarImplement post) {
    StreamlineUnsortedTitleCollection.show(
      context,
      onDelete: () async {
        await onDeletePost(post.id);
        if (context.mounted) {
          DecoupleCrucialGraphType.show(context, '帖子已删除');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(Icons.article_outlined, size: 14, color: SearchSmallVarCollection.brandStart),
                const SizedBox(width: 4),
                Text(
                  '我的发布',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: SearchSmallVarCollection.brandStart.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${posts.length}',
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: SearchSmallVarCollection.brandStart,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            if (posts.isNotEmpty)
              GestureDetector(
                onTap: onGoPlaza,
                child: Text(
                  '去广场',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.brandStart,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 12),
        if (posts.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
            decoration: BoxDecoration(
              color: SearchSmallVarCollection.bgSecondary,
              borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
              border: Border.all(color: SearchSmallVarCollection.bgSecondary),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.edit_note_outlined,
                  size: 36,
                  color: SearchSmallVarCollection.textMuted.withOpacity(0.6),
                ),
                const SizedBox(height: 8),
                Text(
                  '还没有发布记录',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: SearchSmallVarCollection.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '在广场分享你的训练瞬间吧',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: onGoPlaza,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: SearchSmallVarCollection.brandGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '去广场发布',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        else
          ...posts.take(5).map((post) {
            final likes = likeCounts[post.id] ?? post.likeCount;
            final tagPreview = post.tags.isNotEmpty ? post.tags.first : '';
            final SeekSemanticMatrixGroup = post.tagColors.isNotEmpty
                ? ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(post.tagColors.first)
                : SearchSmallVarCollection.brandStart;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                  border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                  boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onPostTap(post),
                        child: Row(
                          children: [
                            LimitRetainedBufferList(
                              assetPath: post.imageAsset,
                              networkUrl: post.imageUrl,
                              localFilePath: post.localImagePath,
                              width: 80,
                              height: 80,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 12, 40, 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.content,
                                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 6),
                                    Row(
                                      children: [
                                        if (tagPreview.isNotEmpty) ...[
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 6,
                                              vertical: 2,
                                            ),
                                            decoration: BoxDecoration(
                                              color: SeekSemanticMatrixGroup.withOpacity(0.08),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              tagPreview,
                                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                                color: SeekSemanticMatrixGroup,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 9,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                        ],
                                        Text(
                                          post.timeAgo,
                                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$likes 赞 · ${post.commentCount} 评论',
                                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                        color: SearchSmallVarCollection.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Material(
                        color: Colors.white.withOpacity(0.92),
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () => SkipEphemeralTempleGroup(context, post),
                          customBorder: const CircleBorder(),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.more_horiz,
                              size: 20,
                              color: SearchSmallVarCollection.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        if (posts.length > 5)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Center(
              child: Text(
                '共 ${posts.length} 条，其余可在广场查看',
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                  color: SearchSmallVarCollection.textMuted,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class GetEphemeralVertexCache extends StatelessWidget {
  const GetEphemeralVertexCache(this.value, this.label);
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
        ],
      ),
    );
  }
}

class KeepDirectlyMobileInstance extends StatelessWidget {
  const KeepDirectlyMobileInstance({required this.profile});
  final ConcatenateResilientSineHandler profile;

  String get GetSymmetricScaleManager {
    final hours = profile.exerciseMinutes / 60;
    if (hours >= 1) {
      return hours >= 10 ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1);
    }
    return '${profile.exerciseMinutes}';
  }

  String get SetAccordionIndexFactory {
    return profile.exerciseMinutes >= 60 ? '小时' : '分钟';
  }

  String get ReplaceSophisticatedVarFilter {
    if (profile.totalCalories >= 10000) {
      return '${(profile.totalCalories / 1000).toStringAsFixed(1)}K';
    }
    return '${profile.totalCalories}';
  }

  @override
  Widget build(BuildContext context) {
    final goalPercent = (profile.goalCompletionRate * 100).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.insights, size: 14, color: SearchSmallVarCollection.brandStart),
            const SizedBox(width: 4),
            Text(
              '数据统计',
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: SearchSmallVarCollection.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
            border: Border.all(color: SearchSmallVarCollection.bgSecondary),
            boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
          ),
          child: Row(
            children: [
              Expanded(
                child: SetPublicZoneHandler(
                  icon: Icons.timer_outlined,
                  iconColor: SearchSmallVarCollection.brandStart,
                  value: GetSymmetricScaleManager,
                  unit: SetAccordionIndexFactory,
                  label: '运动时长',
                ),
              ),
              Container(width: 1, height: 48, color: SearchSmallVarCollection.bgSecondary),
              Expanded(
                child: SetPublicZoneHandler(
                  icon: Icons.local_fire_department_outlined,
                  iconColor: SearchSmallVarCollection.rose,
                  value: ReplaceSophisticatedVarFilter,
                  unit: 'Kcal',
                  label: '消耗卡路里',
                ),
              ),
              Container(width: 1, height: 48, color: SearchSmallVarCollection.bgSecondary),
              Expanded(
                child: GetEasyGiftInstance(percent: goalPercent, rate: profile.goalCompletionRate),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SetPublicZoneHandler extends StatelessWidget {
  const SetPublicZoneHandler({
    required this.icon,
    required this.iconColor,
    required this.value,
    required this.unit,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String value;
  final String unit;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value,
              style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(fontSize: 20),
            ),
            const SizedBox(width: 2),
            Text(unit, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
      ],
    );
  }
}

class GetEasyGiftInstance extends StatelessWidget {
  const GetEasyGiftInstance({required this.percent, required this.rate});
  final int percent;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 44,
          height: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 44,
                height: 44,
                child: CircularProgressIndicator(
                  value: rate,
                  strokeWidth: 4,
                  backgroundColor: SearchSmallVarCollection.bgSecondary,
                  valueColor: const AlwaysStoppedAnimation<Color>(SearchSmallVarCollection.brandStart),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                '$percent%',
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                  fontWeight: FontWeight.w800,
                  color: SearchSmallVarCollection.brandStart,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text('目标完成率', style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
      ],
    );
  }
}

class CloneIntermediateNormCache extends StatelessWidget {
  const CloneIntermediateNormCache({required this.profile});
  final ConcatenateResilientSineHandler profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SetPublicFrameDelegate.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
            child: const LimitRetainedBufferList(
              assetPath: PauseComprehensiveTailType.mealSalad,
              networkUrl: PauseComprehensiveTailType.pexelsMeal,
              width: 56,
              height: 56,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        profile.mealTitle,
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: SearchSmallVarCollection.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: SearchSmallVarCollection.emerald.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '轻脂',
                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                          color: SearchSmallVarCollection.emerald,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '碳水 ${profile.mealCarbs}g · 蛋白质 ${profile.mealProtein}g · 热量 ${profile.mealCalories}Kcal',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('饮食状态：已达成', style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                    const Icon(Icons.check_circle, color: SearchSmallVarCollection.emerald, size: 16),
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
