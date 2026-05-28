import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_plan_detail.dart';
import '../../utils/workout_duration_parser.dart';
import 'workout_session_page.dart';

class WorkoutPrepPage extends StatelessWidget {
  const WorkoutPrepPage({
    super.key,
    required this.plan,
    required this.detail,
  });

  final WorkoutPlan plan;
  final WorkoutPlanDetail detail;

  int get _totalSeconds => WorkoutDurationParser.totalSeconds(
        detail.steps.map((s) => s.duration),
      );

  Future<void> _startSession(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => WorkoutSessionPage(
          plan: plan,
          detail: detail,
        ),
      ),
    );
    if (!context.mounted) return;
    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final plan = this.plan;
    final detail = this.detail;
    final tagColor = MockData.tagColor(plan.tagColor);
    final stepCount = detail.steps.length;

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: AppColors.textPrimary,
        title: Text('训练准备', style: AppTextStyles.h2),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.safeMargin,
                0,
                AppConstants.safeMargin,
                16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: Stack(
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
                                  Colors.black.withOpacity(0.5),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 14,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 3,
                                  ),
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
                                const SizedBox(height: 6),
                                Text(
                                  plan.title,
                                  style: AppTextStyles.h2.copyWith(
                                    color: Colors.white,
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
                  const SizedBox(height: 16),
                  _PrepStatsRow(
                    duration: plan.duration,
                    calories: plan.calories,
                    steps: stepCount,
                    totalLabel: WorkoutDurationParser.formatDurationLabel(_totalSeconds),
                  ),
                  const SizedBox(height: 20),
                  Text('所需装备', style: AppTextStyles.h2),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.equipment.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.emerald.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, size: 14, color: AppColors.emerald),
                            const SizedBox(width: 6),
                            Text(
                              e,
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text('训练环节预览', style: AppTextStyles.h2),
                  const SizedBox(height: 10),
                  ...List.generate(detail.steps.length, (i) {
                    final step = detail.steps[i];
                    return _PrepStepRow(
                      index: i + 1,
                      title: step.title,
                      duration: step.duration,
                      isLast: i == detail.steps.length - 1,
                    );
                  }),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      gradient: AppColors.brandGradientLight,
                      borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                      border: Border.all(color: AppColors.brandStart.withOpacity(0.12)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 18, color: AppColors.brandStart),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            detail.steps.firstWhere(
                              (s) => s.tip != null && s.tip!.isNotEmpty,
                              orElse: () => detail.steps.first,
                            ).tip ??
                                '训练前请补充水分，选择通风场地，量力而行。',
                            style: AppTextStyles.bodySmall.copyWith(height: 1.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
              child: GradientButton(
                label: '开始训练',
                icon: Icons.play_arrow_rounded,
                height: 52,
                fontSize: 14,
                onPressed: () => _startSession(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PrepStatsRow extends StatelessWidget {
  const _PrepStatsRow({
    required this.duration,
    required this.calories,
    required this.steps,
    required this.totalLabel,
  });

  final String duration;
  final int calories;
  final int steps;
  final String totalLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          _cell(Icons.schedule, '计划时长', duration),
          _divider(),
          _cell(Icons.local_fire_department, '预计消耗', '$calories Kcal'),
          _divider(),
          _cell(Icons.format_list_numbered, '共 $steps 环节', totalLabel),
        ],
      ),
    );
  }

  Widget _divider() => Container(width: 1, height: 32, color: AppColors.bgSecondary);

  Widget _cell(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 16, color: AppColors.brandStart),
          const SizedBox(height: 4),
          Text(
            value,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(label, style: AppTextStyles.captionSmall, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class _PrepStepRow extends StatelessWidget {
  const _PrepStepRow({
    required this.index,
    required this.title,
    required this.duration,
    required this.isLast,
  });

  final int index;
  final String title;
  final String duration;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 28,
            child: Column(
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
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      color: AppColors.brandStart.withOpacity(0.2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 14),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    duration,
                    style: AppTextStyles.captionSmall.copyWith(
                      color: AppColors.brandStart,
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

