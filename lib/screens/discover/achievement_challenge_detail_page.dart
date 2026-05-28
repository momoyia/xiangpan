import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/achievement_challenge.dart';

class AchievementChallengeDetailPage extends StatelessWidget {
  const AchievementChallengeDetailPage({
    super.key,
    required this.challenge,
  });

  final AchievementChallenge challenge;

  String _formatParticipants(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final progress = challenge.progress;
    final percent = (progress * 100).round();

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        title: Text('挑战详情', style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          AppConstants.safeMargin,
          8,
          AppConstants.safeMargin,
          32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppColors.brandGradientLight,
                borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
                border: Border.all(color: AppColors.brandStart.withOpacity(0.12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppColors.brandStart.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.emoji_events,
                          color: AppColors.brandStart,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              challenge.title,
                              style: AppTextStyles.h2.copyWith(fontSize: 17),
                            ),
                            const SizedBox(height: 4),
                            Text(challenge.subtitle, style: AppTextStyles.captionSmall),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${challenge.currentKm.toStringAsFixed(0)} / ${challenge.targetKm.toStringAsFixed(0)} KM',
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      Text(
                        '$percent%',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.brandStart,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 8,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(AppColors.brandStart),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      _metaChip(Icons.schedule, '截止 ${challenge.endDate}'),
                      const SizedBox(width: 8),
                      _metaChip(
                        Icons.people_outline,
                        '${_formatParticipants(challenge.participants)} 人参与',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('挑战说明', style: AppTextStyles.h2),
            const SizedBox(height: 8),
            Text(
              challenge.description,
              style: AppTextStyles.bodySmall.copyWith(height: 1.6),
            ),
            const SizedBox(height: 24),
            Text('里程里程碑', style: AppTextStyles.h2),
            const SizedBox(height: 12),
            ...challenge.milestones.map((m) => _MilestoneTile(milestone: m)),
            const SizedBox(height: 24),
            Text('完成奖励', style: AppTextStyles.h2),
            const SizedBox(height: 10),
            ...challenge.rewards.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.card_giftcard, size: 16, color: AppColors.amber),
                    const SizedBox(width: 8),
                    Expanded(child: Text(r, style: AppTextStyles.bodySmall)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('活动规则', style: AppTextStyles.h2),
            const SizedBox(height: 10),
            ...challenge.rules.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('· ', style: AppTextStyles.bodySmall),
                    Expanded(child: Text(r, style: AppTextStyles.bodySmall)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metaChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.textMuted),
          const SizedBox(width: 4),
          Text(text, style: AppTextStyles.captionSmall),
        ],
      ),
    );
  }
}

class _MilestoneTile extends StatelessWidget {
  const _MilestoneTile({required this.milestone});
  final ChallengeMilestone milestone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            milestone.unlocked ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 20,
            color: milestone.unlocked ? AppColors.emerald : AppColors.textMuted,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${milestone.distanceKm.toStringAsFixed(0)} KM',
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(milestone.reward, style: AppTextStyles.captionSmall),
              ],
            ),
          ),
          if (milestone.unlocked)
            Text(
              '已达成',
              style: AppTextStyles.captionSmall.copyWith(
                color: AppColors.emerald,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
