import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/fitness_plan_detail.dart';
import '../../models/fitness_plan_item.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_session_result.dart';
import 'workout_prep_page.dart';

class FitnessPlanDetailPage extends StatefulWidget {
  const FitnessPlanDetailPage({
    super.key,
    required this.detail,
    this.onWorkoutComplete,
  });

  final FitnessPlanDetail detail;
  final ValueChanged<WorkoutSessionResult>? onWorkoutComplete;

  @override
  State<FitnessPlanDetailPage> createState() => _FitnessPlanDetailPageState();
}

class _FitnessPlanDetailPageState extends State<FitnessPlanDetailPage> {
  late bool _joined;

  @override
  void initState() {
    super.initState();
    _joined = false;
  }

  String _formatParticipants(int n) {
    if (n >= 100000000) return '${(n / 100000000).toStringAsFixed(1)}亿';
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  void _toggleJoin() {
    setState(() => _joined = !_joined);
    AppToast.show(
      context,
      _joined ? '已加入我的计划 📋' : '已移出计划列表',
    );
  }

  WorkoutPlan? _linkedWorkout() {
    const map = {
      'featured': 'w2',
      'h1': 'w4',
      'h2': 'w5',
      'h3': 'w3',
      'p1': 'w1',
      'p2': 'w4',
      'p3': 'w1',
      'p4': 'w7',
    };
    final workoutId = map[widget.detail.id];
    if (workoutId == null) return null;
    try {
      return MockData.homeWorkouts.firstWhere((w) => w.id == workoutId);
    } catch (_) {
      return MockData.homeWorkouts.isNotEmpty ? MockData.homeWorkouts.first : null;
    }
  }

  Future<void> _startTodayTraining() async {
    final workout = _linkedWorkout();
    if (workout == null) {
      AppToast.show(context, '暂无关联课程');
      return;
    }
    final workoutDetail = MockData.workoutDetail(workout);
    final result = await Navigator.push<WorkoutSessionResult>(
      context,
      MaterialPageRoute(
        builder: (ctx) => WorkoutPrepPage(
          plan: workout,
          detail: workoutDetail,
        ),
      ),
    );
    if (result == null) return;
    widget.onWorkoutComplete?.call(result);
    if (!mounted) return;
    AppToast.show(context, '今日训练已完成 ✨');
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
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
                    _joined ? Icons.bookmark : Icons.bookmark_border,
                    size: 18,
                    color: _joined ? AppColors.textPrimary : AppColors.textMuted,
                  ),
                ),
                onPressed: _toggleJoin,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  AppImage(
                    assetPath: detail.imageAsset,
                    networkUrl: detail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
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
                        if (detail.isSmartCustom)
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.emerald.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '智能定制',
                              style: AppTextStyles.captionSmall.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        Text(
                          detail.title,
                          style: AppTextStyles.h1.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                  Text(
                    detail.subtitle,
                    style: AppTextStyles.bodySmall.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  _StatsRow(detail: detail, formatCount: _formatParticipants),
                  const SizedBox(height: 20),
                  Text('计划介绍', style: AppTextStyles.h2),
                  const SizedBox(height: 8),
                  Text(
                    detail.description,
                    style: AppTextStyles.bodySmall.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.highlights.map((h) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.bgSecondary),
                        ),
                        child: Text(
                          h,
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('训练日程', style: AppTextStyles.h2),
                      Text(
                        '共 ${detail.schedule.length} 个阶段',
                        style: AppTextStyles.captionSmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...detail.schedule.map(
                    (day) => _ScheduleDayTile(day: day),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.bgSecondary,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: 16,
                          color: AppColors.textMuted,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '适合人群：${detail.suitableFor}',
                            style: AppTextStyles.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${_formatParticipants(detail.participants)} 人练过 · ${detail.rating} 分',
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
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GradientButton(
                label: '开始今日训练',
                icon: Icons.play_arrow_rounded,
                height: 52,
                fontSize: 14,
                onPressed: _startTodayTraining,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: _toggleJoin,
                child: Text(
                  _joined ? '已加入计划' : '加入我的计划',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow({
    required this.detail,
    required this.formatCount,
  });

  final FitnessPlanDetail detail;
  final String Function(int) formatCount;

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
          _StatCell(icon: Icons.calendar_today, label: '周期', value: detail.duration),
          _divider(),
          _StatCell(icon: Icons.speed, label: '难度', value: detail.level),
          _divider(),
          _StatCell(
            icon: Icons.local_fire_department,
            label: '日均',
            value: '${detail.dailyCalories}',
            unit: 'Kcal',
          ),
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
    this.unit,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? unit;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: iconColor ?? AppColors.textSecondary),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                if (unit != null)
                  TextSpan(
                    text: unit,
                    style: AppTextStyles.captionSmall.copyWith(fontSize: 8),
                  ),
              ],
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

class _ScheduleDayTile extends StatelessWidget {
  const _ScheduleDayTile({required this.day});
  final PlanDayPreview day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(color: AppColors.bgSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day.dayLabel,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ...day.sessions.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.circle,
                        size: 5,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(s, style: AppTextStyles.bodySmall),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
