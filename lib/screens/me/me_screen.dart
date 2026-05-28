import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';
import '../../models/user_profile.dart';
import '../share/feed_post_navigation.dart';
import 'edit_profile_sheet.dart';
import 'my_post_more_sheet.dart';
import 'settings_page.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({
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

  final UserProfile profile;
  final List<FeedPost> userPosts;
  final Set<String> likedIds;
  final Set<String> followedIds;
  final Map<String, int> likeCounts;
  final Set<String> blockedAuthors;
  final Set<String> shieldedPostIds;
  final ValueChanged<UserProfile> onEditProfile;
  final ValueChanged<bool> onTeenModeChanged;
  final bool teenModeEnabled;
  final ValueChanged<String> onUnblockAuthor;
  final ValueChanged<String> onUnshieldPost;
  final void Function(String id, bool liked, int newCount) onLikeToggle;
  final void Function(String author, bool followed) onFollowToggle;
  final void Function(String author) onBlockAuthor;
  final void Function(String postId) onShieldPost;
  final void Function(String postId, String reason, String? detail) onReportPost;
  final Future<void> Function(String postId) onDeletePost;
  final VoidCallback onGoPlaza;

  String _formatCount(int n) {
    if (n >= 1000) {
      return '${(n / 1000).toStringAsFixed(1)}K';
    }
    return '$n';
  }

  void _openEdit(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (ctx) => EditProfileSheet(
        profile: profile,
        onSave: (p) {
          onEditProfile(p);
          AppToast.show(context, '名片更新成功 ✨');
        },
      ),
    );
  }

  void _openSettings(BuildContext context) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => SettingsPage(
          teenModeEnabled: teenModeEnabled,
          blockedAuthors: blockedAuthors,
          shieldedPostIds: shieldedPostIds,
          userPosts: userPosts,
          onTeenModeChanged: onTeenModeChanged,
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
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () => _openSettings(context),
                      icon: const Icon(Icons.settings_outlined, size: 18),
                      style: IconButton.styleFrom(
                        backgroundColor: AppColors.bgSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => _openEdit(context),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                          border: Border.all(color: AppColors.brandStart, width: 2),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: AppImage(
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
                            style: AppTextStyles.h2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            profile.bio,
                            style: AppTextStyles.caption,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _openEdit(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.brandStart),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          '编辑资料',
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.brandStart,
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
                    color: AppColors.bgSecondary.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(color: AppColors.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      _StatItem('${profile.following}', '关注'),
                      _StatItem(_formatCount(profile.followers), '粉丝'),
                      _StatItem(_formatCount(profile.likes), '获赞'),
                      _StatItem('${profile.collections}', '收藏夹'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _FitnessStatsModule(profile: profile),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Icon(Icons.eco, size: 14, color: AppColors.amber),
                    const SizedBox(width: 4),
                    Text(
                      '今日绿色饮食',
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _MealCard(profile: profile),
                const SizedBox(height: 24),
                _MyPublishedPostsSection(
                  posts: userPosts,
                  likeCounts: likeCounts,
                  onPostTap: (post) {
                    FeedPostNavigation.openDetail(
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

class _MyPublishedPostsSection extends StatelessWidget {
  const _MyPublishedPostsSection({
    required this.posts,
    required this.likeCounts,
    required this.onPostTap,
    required this.onDeletePost,
    required this.onGoPlaza,
  });

  final List<FeedPost> posts;
  final Map<String, int> likeCounts;
  final ValueChanged<FeedPost> onPostTap;
  final Future<void> Function(String postId) onDeletePost;
  final VoidCallback onGoPlaza;

  void _confirmDelete(BuildContext context, FeedPost post) {
    MyPostMoreSheet.show(
      context,
      onDelete: () async {
        await onDeletePost(post.id);
        if (context.mounted) {
          AppToast.show(context, '帖子已删除');
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
                const Icon(Icons.article_outlined, size: 14, color: AppColors.brandStart),
                const SizedBox(width: 4),
                Text(
                  '我的发布',
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.brandStart.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${posts.length}',
                    style: AppTextStyles.captionSmall.copyWith(
                      color: AppColors.brandStart,
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
                  style: AppTextStyles.captionSmall.copyWith(
                    color: AppColors.brandStart,
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
              color: AppColors.bgSecondary,
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              border: Border.all(color: AppColors.bgSecondary),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.edit_note_outlined,
                  size: 36,
                  color: AppColors.textMuted.withOpacity(0.6),
                ),
                const SizedBox(height: 8),
                Text(
                  '还没有发布记录',
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '在广场分享你的训练瞬间吧',
                  style: AppTextStyles.captionSmall,
                ),
                const SizedBox(height: 12),
                GestureDetector(
                  onTap: onGoPlaza,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradient,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '去广场发布',
                      style: AppTextStyles.captionSmall.copyWith(
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
            final tagColor = post.tagColors.isNotEmpty
                ? MockData.tagColor(post.tagColors.first)
                : AppColors.brandStart;
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                  border: Border.all(color: AppColors.bgSecondary),
                  boxShadow: AppColors.cardShadow,
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
                            AppImage(
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
                                      style: AppTextStyles.caption.copyWith(
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
                                              color: tagColor.withOpacity(0.08),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                            child: Text(
                                              tagPreview,
                                              style: AppTextStyles.captionSmall.copyWith(
                                                color: tagColor,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 9,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                        ],
                                        Text(
                                          post.timeAgo,
                                          style: AppTextStyles.captionSmall,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$likes 赞 · ${post.commentCount} 评论',
                                      style: AppTextStyles.captionSmall.copyWith(
                                        color: AppColors.textMuted,
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
                          onTap: () => _confirmDelete(context, post),
                          customBorder: const CircleBorder(),
                          child: const Padding(
                            padding: EdgeInsets.all(6),
                            child: Icon(
                              Icons.more_horiz,
                              size: 20,
                              color: AppColors.textMuted,
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
                style: AppTextStyles.captionSmall.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem(this.value, this.label);
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: AppTextStyles.h2.copyWith(fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.captionSmall),
        ],
      ),
    );
  }
}

class _FitnessStatsModule extends StatelessWidget {
  const _FitnessStatsModule({required this.profile});
  final UserProfile profile;

  String get _durationText {
    final hours = profile.exerciseMinutes / 60;
    if (hours >= 1) {
      return hours >= 10 ? hours.toStringAsFixed(0) : hours.toStringAsFixed(1);
    }
    return '${profile.exerciseMinutes}';
  }

  String get _durationUnit {
    return profile.exerciseMinutes >= 60 ? '小时' : '分钟';
  }

  String get _caloriesText {
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
            const Icon(Icons.insights, size: 14, color: AppColors.brandStart),
            const SizedBox(width: 4),
            Text(
              '数据统计',
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
            border: Border.all(color: AppColors.bgSecondary),
            boxShadow: AppColors.cardShadow,
          ),
          child: Row(
            children: [
              Expanded(
                child: _MetricCell(
                  icon: Icons.timer_outlined,
                  iconColor: AppColors.brandStart,
                  value: _durationText,
                  unit: _durationUnit,
                  label: '运动时长',
                ),
              ),
              Container(width: 1, height: 48, color: AppColors.bgSecondary),
              Expanded(
                child: _MetricCell(
                  icon: Icons.local_fire_department_outlined,
                  iconColor: AppColors.rose,
                  value: _caloriesText,
                  unit: 'Kcal',
                  label: '消耗卡路里',
                ),
              ),
              Container(width: 1, height: 48, color: AppColors.bgSecondary),
              Expanded(
                child: _GoalRateCell(percent: goalPercent, rate: profile.goalCompletionRate),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricCell extends StatelessWidget {
  const _MetricCell({
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
              style: AppTextStyles.displayLarge.copyWith(fontSize: 20),
            ),
            const SizedBox(width: 2),
            Text(unit, style: AppTextStyles.captionSmall),
          ],
        ),
        const SizedBox(height: 4),
        Text(label, style: AppTextStyles.captionSmall),
      ],
    );
  }
}

class _GoalRateCell extends StatelessWidget {
  const _GoalRateCell({required this.percent, required this.rate});
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
                  backgroundColor: AppColors.bgSecondary,
                  valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandStart),
                  strokeCap: StrokeCap.round,
                ),
              ),
              Text(
                '$percent%',
                style: AppTextStyles.captionSmall.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.brandStart,
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text('目标完成率', style: AppTextStyles.captionSmall),
      ],
    );
  }
}

class _MealCard extends StatelessWidget {
  const _MealCard({required this.profile});
  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            child: const AppImage(
              assetPath: ImageAssets.mealSalad,
              networkUrl: ImageAssets.pexelsMeal,
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
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.emerald.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '轻脂',
                        style: AppTextStyles.captionSmall.copyWith(
                          color: AppColors.emerald,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '碳水 ${profile.mealCarbs}g · 蛋白质 ${profile.mealProtein}g · 热量 ${profile.mealCalories}Kcal',
                  style: AppTextStyles.captionSmall,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('饮食状态：已达成', style: AppTextStyles.captionSmall),
                    const Icon(Icons.check_circle, color: AppColors.emerald, size: 16),
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
