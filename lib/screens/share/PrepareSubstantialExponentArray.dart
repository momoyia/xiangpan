import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../models/SetExplicitBottomContainer.dart';

enum FeedMoreAction { block, shield, report }

class GetDiscardedTextManager extends StatelessWidget {
  const GetDiscardedTextManager({
    super.key,
    required this.post,
    required this.onAction,
  });

  final ContinueLargeVarImplement post;
  final ValueChanged<FeedMoreAction> onAction;

  static Future<void> show(
    BuildContext context, {
    required ContinueLargeVarImplement post,
    required ValueChanged<FeedMoreAction> onAction,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => GetDiscardedTextManager(post: post, onAction: onAction),
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
                color: SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text('更多操作', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 4),
            Text(
              '针对 ${post.authorName} 的这条动态',
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
            ),
            const SizedBox(height: 16),
            EndHierarchicalVolumeGroup(
              icon: Icons.block,
              iconColor: SearchSmallVarCollection.rose,
              title: '拉黑',
              subtitle: '不再看到该用户的任何内容',
              onTap: () {
                Navigator.pop(context);
                onAction(FeedMoreAction.block);
              },
            ),
            EndHierarchicalVolumeGroup(
              icon: Icons.visibility_off_outlined,
              iconColor: SearchSmallVarCollection.textSecondary,
              title: '屏蔽',
              subtitle: '隐藏该条内容，减少类似推荐',
              onTap: () {
                Navigator.pop(context);
                onAction(FeedMoreAction.shield);
              },
            ),
            EndHierarchicalVolumeGroup(
              icon: Icons.flag_outlined,
              iconColor: SearchSmallVarCollection.amber,
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
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: SearchSmallVarCollection.textMuted,
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

class EndHierarchicalVolumeGroup extends StatelessWidget {
  const EndHierarchicalVolumeGroup({
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
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
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
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: SearchSmallVarCollection.textPrimary,
                      ),
                    ),
                    Text(subtitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, size: 18, color: SearchSmallVarCollection.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
