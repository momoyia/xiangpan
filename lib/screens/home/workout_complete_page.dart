import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_session_result.dart';
import '../../utils/workout_duration_parser.dart';

class WorkoutCompletePage extends StatelessWidget {
  const WorkoutCompletePage({
    super.key,
    required this.plan,
    required this.result,
  });

  final WorkoutPlan plan;
  final WorkoutSessionResult result;

  @override
  Widget build(BuildContext context) {
    final durationLabel =
        WorkoutDurationParser.formatDurationLabel(result.elapsedSeconds);
    final allDone = result.completedSteps >= result.totalSteps;

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConstants.safeMargin,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: AppColors.brandGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.brandStart.withOpacity(0.35),
                            blurRadius: 24,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.emoji_events_rounded,
                        color: Colors.white,
                        size: 44,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      allDone ? '训练完成！' : '训练已结束',
                      style: AppTextStyles.displayLarge.copyWith(fontSize: 26),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      plan.title,
                      style: AppTextStyles.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: _ResultCard(
                            icon: Icons.schedule,
                            label: '运动时长',
                            value: durationLabel,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ResultCard(
                            icon: Icons.local_fire_department,
                            label: '消耗热量',
                            value: '${result.caloriesBurned}',
                            unit: 'Kcal',
                            iconColor: AppColors.amber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    _ResultCard(
                      icon: Icons.check_circle_outline,
                      label: '完成环节',
                      value: '${result.completedSteps}',
                      unit: ' / ${result.totalSteps}',
                      wide: true,
                      iconColor: AppColors.emerald,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.bgSecondary,
                        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('本次收获', style: AppTextStyles.h2),
                          const SizedBox(height: 10),
                          _bullet('运动数据已同步至「我的」统计'),
                          _bullet(allDone
                              ? '完整完成全部环节，代谢提升效果更佳'
                              : '下次可尝试完成全部环节，获得更完整收益'),
                          _bullet('坚持打卡，目标完成率将持续上升'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: Column(
                children: [
                  GradientButton(
                    label: '完成',
                    icon: Icons.check_rounded,
                    height: 52,
                    fontSize: 14,
                    onPressed: () => Navigator.pop(context, result),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.fiber_manual_record, size: 6, color: AppColors.brandStart),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: AppTextStyles.bodySmall)),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({
    required this.icon,
    required this.label,
    required this.value,
    this.unit,
    this.iconColor,
    this.wide = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? unit;
  final Color? iconColor;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wide ? double.infinity : null,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      child: wide
          ? Row(
              children: [
                Icon(icon, size: 22, color: iconColor ?? AppColors.brandStart),
                const SizedBox(width: 12),
                Text(label, style: AppTextStyles.caption),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: AppTextStyles.h1.copyWith(fontSize: 20),
                      ),
                      if (unit != null)
                        TextSpan(text: unit, style: AppTextStyles.caption),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Icon(icon, size: 22, color: iconColor ?? AppColors.brandStart),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: AppTextStyles.h1.copyWith(fontSize: 20),
                      ),
                      if (unit != null)
                        TextSpan(
                          text: unit,
                          style: AppTextStyles.caption.copyWith(fontSize: 11),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(label, style: AppTextStyles.captionSmall),
              ],
            ),
    );
  }
}
