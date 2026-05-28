import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/hot_plan_detail.dart';
import '../../models/workout_session_result.dart';
import 'hot_plan_prep_page.dart';

class HotPlanDetailPage extends StatelessWidget {
  const HotPlanDetailPage({
    super.key,
    required this.detail,
    this.onWorkoutComplete,
  });

  final HotPlanDetail detail;
  final ValueChanged<WorkoutSessionResult>? onWorkoutComplete;

  String _formatParticipants(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  Future<void> _startTraining(BuildContext context) async {
    const map = {'h1': 'w4', 'h2': 'w5', 'h3': 'w3'};
    final workoutId = map[detail.id] ?? 'w1';
    final workout = MockData.homeWorkouts.firstWhere(
      (w) => w.id == workoutId,
      orElse: () => MockData.homeWorkouts.first,
    );
    final prepInfo = MockData.hotPlanPrepInfo(detail.id);
    final workoutDetail = MockData.workoutDetail(workout);
    final result = await Navigator.push<WorkoutSessionResult>(
      context,
      MaterialPageRoute(
        builder: (ctx) => HotPlanPrepPage(
          planDetail: detail,
          prepInfo: prepInfo,
          workout: workout,
          workoutDetail: workoutDetail,
        ),
      ),
    );
    if (!context.mounted || result == null) return;
    onWorkoutComplete?.call(result);
    AppToast.show(context, '本节训练已完成 ✨');
  }

  @override
  Widget build(BuildContext context) {
    final badgeColor = Color(detail.badgeColor);

    return Scaffold(
      backgroundColor: AppColors.bgSecondary,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: AppImage(
                    assetPath: detail.imageAsset,
                    networkUrl: detail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: ColoredBox(color: Color(0x1A000000)),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 4,
                  left: 8,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.92),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      detail.badge,
                      style: AppTextStyles.captionSmall.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -12),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.canvasWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(AppConstants.radiusLarge),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(
                  AppConstants.safeMargin,
                  28,
                  AppConstants.safeMargin,
                  100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.title,
                      style: AppTextStyles.h1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      detail.subtitle,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _MetricTile(
                            label: '单次时长',
                            value: '${detail.totalMinutes}',
                            unit: '分钟',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            label: '预计消耗',
                            value: '${detail.calories}',
                            unit: 'Kcal',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _MetricTile(
                            label: '难度',
                            value: detail.level,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('为什么推荐', style: AppTextStyles.h2),
                    const SizedBox(height: 10),
                    ...detail.reasons.map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check,
                              size: 16,
                              color: AppColors.textPrimary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                r,
                                style: AppTextStyles.bodySmall.copyWith(height: 1.45),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('本节包含', style: AppTextStyles.h2),
                    const SizedBox(height: 4),
                    Text(
                      '共 ${detail.sessions.length} 个环节 · 按顺序完成',
                      style: AppTextStyles.captionSmall,
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(detail.sessions.length, (i) {
                      final s = detail.sessions[i];
                      return _SessionCard(index: i + 1, session: s);
                    }),
                    const SizedBox(height: 20),
                    Text('课程说明', style: AppTextStyles.h2),
                    const SizedBox(height: 8),
                    Text(
                      detail.description,
                      style: AppTextStyles.bodySmall.copyWith(height: 1.6),
                    ),
                    if (detail.testimonial != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(
                            AppConstants.radiusMedium,
                          ),
                        ),
                        child: Text(
                          detail.testimonial!,
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: AppColors.amber),
                        const SizedBox(width: 4),
                        Text(
                          '${detail.rating} 分',
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          ' · ${_formatParticipants(detail.participants)} 人练过',
                          style: AppTextStyles.captionSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '适合：${detail.suitableFor}',
                      style: AppTextStyles.captionSmall,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: GradientButton(
            label: '立即开练',
            icon: Icons.play_arrow_rounded,
            height: 52,
            fontSize: 14,
            onPressed: () => _startTraining(context),
          ),
        ),
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  const _MetricTile({
    required this.label,
    required this.value,
    this.unit,
  });

  final String label;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
      ),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontSize: 13,
                  ),
                ),
                if (unit != null)
                  TextSpan(
                    text: unit,
                    style: AppTextStyles.captionSmall.copyWith(fontSize: 9),
                  ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.captionSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SessionCard extends StatelessWidget {
  const _SessionCard({required this.index, required this.session});

  final int index;
  final HotPlanSessionItem session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textPrimary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '$index',
              style: AppTextStyles.captionSmall.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.bgSecondary),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.name,
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          session.intensity,
                          style: AppTextStyles.captionSmall,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    session.duration,
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
