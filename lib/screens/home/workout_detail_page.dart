import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_plan_detail.dart';
import '../../models/workout_session_result.dart';
import 'workout_prep_page.dart';

class WorkoutDetailPage extends StatefulWidget {
  const WorkoutDetailPage({
    super.key,
    required this.plan,
    required this.detail,
    required this.isCollected,
    required this.onCollectToggle,
    this.onWorkoutComplete,
  });

  final WorkoutPlan plan;
  final WorkoutPlanDetail detail;
  final bool isCollected;
  final VoidCallback onCollectToggle;
  final ValueChanged<WorkoutSessionResult>? onWorkoutComplete;

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  late bool _collected;

  @override
  void initState() {
    super.initState();
    _collected = widget.isCollected;
  }

  void _toggleCollect() {
    setState(() => _collected = !_collected);
    widget.onCollectToggle();
    AppToast.show(
      context,
      _collected ? '已加入计划夹 ❤️' : '已取消收藏',
    );
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
    final detail = widget.detail;
    final tagColor = MockData.tagColor(plan.tagColor);

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.white,
            foregroundColor: AppColors.textPrimary,
            elevation: 0,
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
                  child: Icon(
                    _collected ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: _collected ? AppColors.rose : AppColors.textMuted,
                  ),
                ),
                onPressed: _toggleCollect,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(
                    assetPath: plan.imageAsset,
                    networkUrl: plan.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.55),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: tagColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            plan.tag,
                            style: AppTextStyles.captionSmall.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          plan.title,
                          style: AppTextStyles.h1.copyWith(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.safeMargin,
                16,
                AppConstants.safeMargin,
                120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _StatsRow(plan: plan, detail: detail),
                  const SizedBox(height: 20),
                  Text('课程介绍', style: AppTextStyles.h2),
                  const SizedBox(height: 8),
                  Text(detail.description, style: AppTextStyles.bodySmall.copyWith(height: 1.6)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.highlights.map((h) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.brandStart.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          h,
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.brandStart,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Text('训练流程', style: AppTextStyles.h2),
                  const SizedBox(height: 12),
                  ...List.generate(detail.steps.length, (i) {
                    return _StepTile(index: i + 1, step: detail.steps[i]);
                  }),
                  const SizedBox(height: 24),
                  Text('所需装备', style: AppTextStyles.h2),
                  const SizedBox(height: 10),
                  ...detail.equipment.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline,
                              size: 16, color: AppColors.emerald),
                          const SizedBox(width: 8),
                          Text(e, style: AppTextStyles.bodySmall),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  _CoachCard(detail: detail, participants: detail.participants),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondary,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.people_outline,
                            size: 16, color: AppColors.textMuted),
                        const SizedBox(width: 8),
                        Text(
                          '适合人群：${detail.suitableFor}',
                          style: AppTextStyles.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: GradientButton(
            label: '立即开始训练',
            icon: Icons.play_arrow_rounded,
            height: 52,
            fontSize: 14,
            onPressed: () async {
              final result = await Navigator.push<WorkoutSessionResult>(
                context,
                MaterialPageRoute(
                  builder: (ctx) => WorkoutPrepPage(
                    plan: plan,
                    detail: detail,
                  ),
                ),
              );
              if (!context.mounted || result == null) return;
              widget.onWorkoutComplete?.call(result);
              AppToast.show(context, '训练记录已同步至我的数据 ✨');
            },
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({required this.plan, required this.detail});
  final WorkoutPlan plan;
  final WorkoutPlanDetail detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          _StatCell(icon: Icons.schedule, label: '时长', value: plan.duration),
          _divider(),
          _StatCell(icon: Icons.local_fire_department, label: '消耗', value: '${plan.calories} Kcal'),
          _divider(),
          _StatCell(icon: Icons.bar_chart, label: '难度', value: plan.level),
          _divider(),
          _StatCell(
            icon: Icons.star,
            label: '评分',
            value: detail.rating.toStringAsFixed(1),
            iconColor: AppColors.amber,
          ),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 36, color: AppColors.bgSecondary);
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: iconColor ?? AppColors.brandStart),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(label, style: AppTextStyles.captionSmall),
        ],
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  const _StepTile({required this.index, required this.step});
  final int index;
  final WorkoutStep step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        step.title,
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      step.duration,
                      style: AppTextStyles.captionSmall.copyWith(
                        color: AppColors.brandStart,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (step.tip != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    step.tip!,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CoachCard extends StatelessWidget {
  const _CoachCard({required this.detail, required this.participants});
  final WorkoutPlanDetail detail;
  final int participants;

  String _formatParticipants(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

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
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: AppColors.brandGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.coachName,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(detail.coachTitle, style: AppTextStyles.captionSmall),
                const SizedBox(height: 4),
                Text(
                  '${_formatParticipants(participants)} 人练过 · ${detail.rating} 分',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: AppColors.brandStart,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
