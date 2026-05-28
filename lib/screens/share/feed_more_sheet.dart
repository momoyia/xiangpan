import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/feed_post.dart';

enum FeedMoreAction { block, shield, report }

class FeedMoreSheet extends StatelessWidget {
  const FeedMoreSheet({
    super.key,
    required this.post,
    required this.onAction,
  });

  final FeedPost post;
  final ValueChanged<FeedMoreAction> onAction;

  static Future<void> show(
    BuildContext context, {
    required FeedPost post,
    required ValueChanged<FeedMoreAction> onAction,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => FeedMoreSheet(post: post, onAction: onAction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.bgSecondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text('更多操作', style: AppTextStyles.h2),
            const SizedBox(height: 4),
            Text(
              '针对 ${post.authorName} 的这条动态',
              style: AppTextStyles.captionSmall,
            ),
            const SizedBox(height: 16),
            _MoreTile(
              icon: Icons.block,
              iconColor: AppColors.rose,
              title: '拉黑',
              subtitle: '不再看到该用户的任何内容',
              onTap: () {
                Navigator.pop(context);
                onAction(FeedMoreAction.block);
              },
            ),
            _MoreTile(
              icon: Icons.visibility_off_outlined,
              iconColor: AppColors.textSecondary,
              title: '屏蔽',
              subtitle: '隐藏该条内容，减少类似推荐',
              onTap: () {
                Navigator.pop(context);
                onAction(FeedMoreAction.shield);
              },
            ),
            _MoreTile(
              icon: Icons.flag_outlined,
              iconColor: AppColors.amber,
              title: '举报',
              subtitle: '内容违规或令人不适',
              onTap: () {
                Navigator.pop(context);
                onAction(FeedMoreAction.report);
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  '取消',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
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

class _MoreTile extends StatelessWidget {
  const _MoreTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(subtitle, style: AppTextStyles.captionSmall),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
