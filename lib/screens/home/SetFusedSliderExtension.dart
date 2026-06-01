import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/GetPrismaticFrameType.dart';
import '../../models/OffsetMediocreLabelList.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/SetBasicBufferTarget.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'DisplayRelationalBorderOwner.dart';

class DrawPrimaryScopeReference extends StatefulWidget {
  const DrawPrimaryScopeReference({
    super.key,
    required this.planDetail,
    required this.prepInfo,
    required this.workout,
    required this.SetDiscardedCacheArray,
  });

  final StopCustomVisibleAdapter planDetail;
  final SkipImmutableIndexContainer prepInfo;
  final SetLastScenarioArray workout;
  final AllocateActivatedTagReference SetDiscardedCacheArray;

  @override
  State<DrawPrimaryScopeReference> createState() => GetDisplayableNumberAdapter();
}

class GetDisplayableNumberAdapter extends State<DrawPrimaryScopeReference> {
  int _sceneIndex = 0;
  String _bodyState = '一般';
  final Set<int> _checked = {};

  SkipImmutableIndexContainer get SetTensorVarStack => widget.prepInfo;
  StopCustomVisibleAdapter get DisplayHyperbolicTrianglesFilter => widget.planDetail;

  bool get GetCrudeValueProtocol => _checked.length >= SetTensorVarStack.checklist.length;

  AllocateActivatedTagReference get SpinBasicTangentObserver {
    final steps = SetTensorVarStack.sessionDetails
        .map(
          (s) => CalculateSecondPositionStack(
            title: s.name,
            duration: s.duration,
            tip: '${s.focus}\n心率：${s.heartRateZone}\n动作：${s.keyMoves.join(' · ')}',
          ),
        )
        .toList();
    return AllocateActivatedTagReference(
      description: SetTensorVarStack.coachTips[_bodyState] ?? SetTensorVarStack.prepSubtitle,
      coachName: '相盼热门教练',
      coachTitle: '单次课程引导',
      rating: DisplayHyperbolicTrianglesFilter.rating,
      participants: DisplayHyperbolicTrianglesFilter.participants,
      steps: steps,
      equipment: SetTensorVarStack.gearSuggestions,
      highlights: DisplayHyperbolicTrianglesFilter.reasons,
      suitableFor: DisplayHyperbolicTrianglesFilter.suitableFor,
    );
  }

  Future<void> CompareHierarchicalQueueType() async {
    if (!GetCrudeValueProtocol) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '请先完成全部开练清单',
            style: RestartAsynchronousBitrateManager.caption.copyWith(color: Colors.white),
          ),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
      return;
    }
    final result = await Navigator.push<ExecuteStaticTempleDelegate>(
      context,
      MaterialPageRoute(
        builder: (ctx) => EndNewestTrajectoryHelper(
          DisplayHyperbolicTrianglesFilter: widget.workout,
          detail: SpinBasicTangentObserver,
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
    final coachTip = SetTensorVarStack.coachTips[_bodyState] ?? '';

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F172A),
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text(
          SetTensorVarStack.prepTitle,
          style: RestartAsynchronousBitrateManager.caption.copyWith(
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
                  LimitSymmetricDimensionStack(
                    subtitle: SetTensorVarStack.prepSubtitle,
                    minutes: DisplayHyperbolicTrianglesFilter.totalMinutes,
                    calories: DisplayHyperbolicTrianglesFilter.calories,
                    checked: _checked.length,
                    total: SetTensorVarStack.checklist.length,
                  ),
                  const SizedBox(height: 20),
                  PrepareRetainedVarDelegate(step: '01', title: '选择训练场景'),
                  const SizedBox(height: 10),
                  InitializeElasticChapterHandler(
                    options: SetTensorVarStack.sceneOptions,
                    selected: _sceneIndex,
                    onSelected: (i) => setState(() => _sceneIndex = i),
                  ),
                  const SizedBox(height: 20),
                  PrepareRetainedVarDelegate(step: '02', title: '开练清单'),
                  const SizedBox(height: 4),
                  Text(
                    '全部勾选后方可开始（${_checked.length}/${SetTensorVarStack.checklist.length}）',
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white38),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(SetTensorVarStack.checklist.length, (i) {
                    final item = SetTensorVarStack.checklist[i];
                    final done = _checked.contains(i);
                    return NavigateMediumRotationObserver(
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
                  PrepareRetainedVarDelegate(step: '03', title: '今日身体状态'),
                  const SizedBox(height: 10),
                  SetHierarchicalUtilGroup(
                    selected: _bodyState,
                    onSelected: (s) => setState(() => _bodyState = s),
                  ),
                  const SizedBox(height: 20),
                  PrepareRetainedVarDelegate(step: '04', title: '3 分钟热身（建议）'),
                  const SizedBox(height: 10),
                  InitializeBeginnerCosineTarget(steps: SetTensorVarStack.warmUpSteps),
                  const SizedBox(height: 20),
                  PrepareRetainedVarDelegate(step: '05', title: '本节训练路线'),
                  const SizedBox(height: 10),
                  ...SetTensorVarStack.sessionDetails.map(
                    (s) => SkipOriginalChapterManager(session: s),
                  ),
                  const SizedBox(height: 16),
                  KeepUniqueBufferObserver(items: SetTensorVarStack.gearSuggestions),
                  const SizedBox(height: 16),
                  GetSecondCatalystHelper(notes: SetTensorVarStack.safetyNotes),
                  if (coachTip.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    SetStandaloneIntensityManager(tip: coachTip),
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
                FindGranularPreviewPool(
                  label: GetCrudeValueProtocol ? '开始第一节' : '完成清单后开始',
                  icon: Icons.play_arrow_rounded,
                  height: 52,
                  fontSize: 14,
                  onPressed: CompareHierarchicalQueueType,
                ),
                const SizedBox(height: 6),
                Text(
                  '${DisplayHyperbolicTrianglesFilter.title} · ${SetTensorVarStack.sceneOptions[_sceneIndex]}',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white38),
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

class LimitSymmetricDimensionStack extends StatelessWidget {
  const LimitSymmetricDimensionStack({
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
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SearchMutableGiftHelper('$minutes 分钟'),
              const SizedBox(width: 8),
              SearchMutableGiftHelper('$calories Kcal'),
              const Spacer(),
              Text(
                '清单 $checked/$total',
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                  color: checked == total ? SearchSmallVarCollection.emerald : Colors.white54,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
              color: Colors.white.withOpacity(0.85),
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget SearchMutableGiftHelper(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class PrepareRetainedVarDelegate extends StatelessWidget {
  const PrepareRetainedVarDelegate({required this.step, required this.title});

  final String step;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          step,
          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
            color: Colors.white38,
            fontWeight: FontWeight.w800,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}

class InitializeElasticChapterHandler extends StatelessWidget {
  const InitializeElasticChapterHandler({
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
                    color: active ? SearchSmallVarCollection.textPrimary : Colors.white38,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    options[i],
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: active ? SearchSmallVarCollection.textPrimary : Colors.white70,
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

class NavigateMediumRotationObserver extends StatelessWidget {
  const NavigateMediumRotationObserver({
    required this.item,
    required this.done,
    required this.onTap,
  });

  final QuantizationDiversifiedLoaderStack item;
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
                  color: done ? SearchSmallVarCollection.emerald : Colors.white54,
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
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          decoration: done ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        item.hint,
                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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

class SetHierarchicalUtilGroup extends StatelessWidget {
  const SetHierarchicalUtilGroup({
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
                      color: active ? SearchSmallVarCollection.textPrimary : Colors.white54,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      o.$1,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: active ? SearchSmallVarCollection.textPrimary : Colors.white54,
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

class InitializeBeginnerCosineTarget extends StatelessWidget {
  const InitializeBeginnerCosineTarget({required this.steps});
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
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: Colors.white38,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    steps[i],
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
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

class SkipOriginalChapterManager extends StatelessWidget {
  const SkipOriginalChapterManager({required this.session});
  final FinishImmutableFlagsContainer session;

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
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
              Text(
                session.duration,
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white54),
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
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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
            style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
              color: Colors.white60,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '心率 ${session.heartRateZone}',
            style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white38),
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
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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

class KeepUniqueBufferObserver extends StatelessWidget {
  const KeepUniqueBufferObserver({required this.items});
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '建议装备',
          style: RestartAsynchronousBitrateManager.caption.copyWith(
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
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white70),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class GetSecondCatalystHelper extends StatelessWidget {
  const GetSecondCatalystHelper({required this.notes});
  final List<String> notes;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.amber.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SearchSmallVarCollection.amber.withOpacity(0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.warning_amber_rounded, size: 16, color: SearchSmallVarCollection.amber),
              const SizedBox(width: 6),
              Text(
                '注意事项',
                style: RestartAsynchronousBitrateManager.caption.copyWith(
                  color: SearchSmallVarCollection.amber,
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
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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

class SetStandaloneIntensityManager extends StatelessWidget {
  const SetStandaloneIntensityManager({required this.tip});
  final String tip;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.emerald.withOpacity(0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SearchSmallVarCollection.emerald.withOpacity(0.3)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.support_agent, size: 20, color: SearchSmallVarCollection.emerald),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '教练根据你的状态建议',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.emerald,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tip,
                  style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
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
