import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../models/hot_plan_detail.dart';
import '../../models/hot_plan_prep_info.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_plan_detail.dart';
import '../../models/workout_session_result.dart';
import 'workout_session_page.dart';

class HotPlanPrepPage extends StatefulWidget {
  const HotPlanPrepPage({
    super.key,
    required this.planDetail,
    required this.prepInfo,
    required this.workout,
    required this.workoutDetail,
  });

  final HotPlanDetail planDetail;
  final HotPlanPrepInfo prepInfo;
  final WorkoutPlan workout;
  final WorkoutPlanDetail workoutDetail;

  @override
  State<HotPlanPrepPage> createState() => _HotPlanPrepPageState();
}

class _HotPlanPrepPageState extends State<HotPlanPrepPage> {
  int _sceneIndex = 0;
  String _bodyState = '一般';
  final Set<int> _checked = {};

  HotPlanPrepInfo get prep => widget.prepInfo;
  HotPlanDetail get plan => widget.planDetail;

  bool get _allChecked => _checked.length >= prep.checklist.length;

  WorkoutPlanDetail get _sessionDetail {
    final steps = prep.sessionDetails
        .map(
          (s) => WorkoutStep(
            title: s.name,
            duration: s.duration,
            tip: '${s.focus}\n心率：${s.heartRateZone}\n动作：${s.keyMoves.join(' · ')}',
          ),
        )
        .toList();
    return WorkoutPlanDetail(
      description: prep.coachTips[_bodyState] ?? prep.prepSubtitle,
      coachName: '相盼热门教练',
      coachTitle: '单次课程引导',
      rating: plan.rating,
      participants: plan.participants,
      steps: steps,
      equipment: prep.gearSuggestions,
      highlights: plan.reasons,
      suitableFor: plan.suitableFor,
    );
  }

  Future<void> _startSession() async {
    if (!_allChecked) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '请先完成全部开练清单',
            style: AppTextStyles.caption.copyWith(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    final result = await Navigator.push<WorkoutSessionResult>(
      context,
      MaterialPageRoute(
        builder: (ctx) => WorkoutSessionPage(
          plan: widget.workout,
          detail: _sessionDetail,
        ),
      ),
    );
    if (!mounted) return;
    if (result != null) {
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final coachTip = prep.coachTips[_bodyState] ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          prep.prepTitle,
          style: AppTextStyles.caption.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderBanner(
                    subtitle: prep.prepSubtitle,
                    minutes: plan.totalMinutes,
                    calories: plan.calories,
                    checked: _checked.length,
                    total: prep.checklist.length,
                  ),
                  const SizedBox(height: 20),
                  _SectionLabel(step: '01', title: '选择训练场景'),
                  const SizedBox(height: 10),
                  _SceneSelector(
                    options: prep.sceneOptions,
                    selected: _sceneIndex,
                    onSelected: (i) => setState(() => _sceneIndex = i),
                  ),
                  const SizedBox(height: 20),
                  _SectionLabel(step: '02', title: '开练清单'),
                  const SizedBox(height: 4),
                  Text(
                    '全部勾选后方可开始（${_checked.length}/${prep.checklist.length}）',
                    style: AppTextStyles.captionSmall.copyWith(color: Colors.white38),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(prep.checklist.length, (i) {
                    final item = prep.checklist[i];
                    final done = _checked.contains(i);
                    return _ChecklistTile(
                      item: item,
                      done: done,
                      onTap: () {
                        setState(() {
                          if (done) {
                            _checked.remove(i);
                          } else {
                            _checked.add(i);
                          }
                        });
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  _SectionLabel(step: '03', title: '今日身体状态'),
                  const SizedBox(height: 10),
                  _BodyStatePicker(
                    selected: _bodyState,
                    onSelected: (s) => setState(() => _bodyState = s),
                  ),
                  const SizedBox(height: 20),
                  _SectionLabel(step: '04', title: '3 分钟热身（建议）'),
                  const SizedBox(height: 10),
                  _WarmUpCard(steps: prep.warmUpSteps),
                  const SizedBox(height: 20),
                  _SectionLabel(step: '05', title: '本节训练路线'),
                  const SizedBox(height: 10),
                  ...prep.sessionDetails.map(
                    (s) => _RouteCard(session: s),
                  ),
                  const SizedBox(height: 16),
                  _GearRow(items: prep.gearSuggestions),
                  const SizedBox(height: 16),
                  _SafetyCard(notes: prep.safetyNotes),
                  if (coachTip.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _CoachBubble(tip: coachTip),
                  ],
                ],
              ),
            ),
          ),
          Container(
            color: const Color(0xFF0F172A),
            padding: EdgeInsets.fromLTRB(
              20,
              8,
              20,
              MediaQuery.paddingOf(context).bottom + 12,
            ),
            child: Column(
              children: [
                GradientButton(
                  label: _allChecked ? '开始第一节' : '完成清单后开始',
                  icon: Icons.play_arrow_rounded,
                  height: 52,
                  fontSize: 14,
                  onPressed: _startSession,
                ),
                const SizedBox(height: 6),
                Text(
                  '${plan.title} · ${prep.sceneOptions[_sceneIndex]}',
                  style: AppTextStyles.captionSmall.copyWith(color: Colors.white38),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBanner extends StatelessWidget {
  const _HeaderBanner({
    required this.subtitle,
    required this.minutes,
    required this.calories,
    required this.checked,
    required this.total,
  });

  final String subtitle;
  final int minutes;
  final int calories;
  final int checked;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _pill('$minutes 分钟'),
              const SizedBox(width: 8),
              _pill('$calories Kcal'),
              const Spacer(),
              Text(
                '清单 $checked/$total',
                style: AppTextStyles.captionSmall.copyWith(
                  color: checked == total ? AppColors.emerald : Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.85),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _pill(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: AppTextStyles.captionSmall.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.step, required this.title});

  final String step;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          step,
          style: AppTextStyles.captionSmall.copyWith(
            color: Colors.white38,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: AppTextStyles.h2.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class _SceneSelector extends StatelessWidget {
  const _SceneSelector({
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final List<String> options;
  final int selected;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(options.length, (i) {
        final active = i == selected;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: GestureDetector(
            onTap: () => onSelected(i),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                color: active ? Colors.white : Colors.white.withOpacity(0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: active ? Colors.white : Colors.white.withOpacity(0.12),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    active ? Icons.radio_button_checked : Icons.radio_button_off,
                    size: 18,
                    color: active ? AppColors.textPrimary : Colors.white38,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    options[i],
                    style: AppTextStyles.caption.copyWith(
                      color: active ? AppColors.textPrimary : Colors.white70,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

class _ChecklistTile extends StatelessWidget {
  const _ChecklistTile({
    required this.item,
    required this.done,
    required this.onTap,
  });

  final HotPlanPrepCheckItem item;
  final bool done;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.white.withOpacity(done ? 0.14 : 0.06),
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  done ? Icons.check_box : Icons.check_box_outline_blank,
                  size: 20,
                  color: done ? AppColors.emerald : Colors.white54,
                ),
                const SizedBox(width: 10),
                Icon(item.icon, size: 18, color: Colors.white54),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.label,
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          decoration: done ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.hint,
                        style: AppTextStyles.captionSmall.copyWith(
                          color: Colors.white38,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BodyStatePicker extends StatelessWidget {
  const _BodyStatePicker({
    required this.selected,
    required this.onSelected,
  });

  final String selected;
  final ValueChanged<String> onSelected;

  static const _options = [
    ('精神好', Icons.sentiment_very_satisfied_outlined),
    ('一般', Icons.sentiment_neutral_outlined),
    ('疲惫', Icons.sentiment_dissatisfied_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _options.map((o) {
        final active = selected == o.$1;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: o.$1 != '疲惫' ? 8 : 0),
            child: GestureDetector(
              onTap: () => onSelected(o.$1),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                decoration: BoxDecoration(
                  color: active ? Colors.white : Colors.white.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Icon(
                      o.$2,
                      size: 22,
                      color: active ? AppColors.textPrimary : Colors.white54,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      o.$1,
                      style: AppTextStyles.captionSmall.copyWith(
                        color: active ? AppColors.textPrimary : Colors.white54,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _WarmUpCard extends StatelessWidget {
  const _WarmUpCard({required this.steps});
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.15)),
      ),
      child: Column(
        children: List.generate(steps.length, (i) {
          return Padding(
            padding: EdgeInsets.only(bottom: i == steps.length - 1 ? 0 : 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${i + 1}',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: Colors.white38,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    steps[i],
                    style: AppTextStyles.bodySmall.copyWith(
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _RouteCard extends StatelessWidget {
  const _RouteCard({required this.session});
  final HotPlanPrepSessionDetail session;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  session.name,
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                session.duration,
                style: AppTextStyles.captionSmall.copyWith(color: Colors.white54),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  session.intensity,
                  style: AppTextStyles.captionSmall.copyWith(
                    color: Colors.white70,
                    fontSize: 8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            session.focus,
            style: AppTextStyles.captionSmall.copyWith(
              color: Colors.white60,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '心率 ${session.heartRateZone}',
            style: AppTextStyles.captionSmall.copyWith(color: Colors.white38),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: session.keyMoves.map((m) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  m,
                  style: AppTextStyles.captionSmall.copyWith(
                    color: Colors.white70,
                    fontSize: 9,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _GearRow extends StatelessWidget {
  const _GearRow({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '建议装备',
          style: AppTextStyles.caption.copyWith(
            color: Colors.white54,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items.map((g) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                g,
                style: AppTextStyles.captionSmall.copyWith(color: Colors.white70),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _SafetyCard extends StatelessWidget {
  const _SafetyCard({required this.notes});
  final List<String> notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.amber.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.amber.withOpacity(0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, size: 16, color: AppColors.amber),
              const SizedBox(width: 6),
              Text(
                '注意事项',
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.amber,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ...notes.map(
            (n) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                '· $n',
                style: AppTextStyles.captionSmall.copyWith(
                  color: Colors.white.withOpacity(0.75),
                  height: 1.4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CoachBubble extends StatelessWidget {
  const _CoachBubble({required this.tip});
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.emerald.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.emerald.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.support_agent, size: 20, color: AppColors.emerald),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '教练根据你的状态建议',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: AppColors.emerald,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tip,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.9),
                    height: 1.45,
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
