import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/ReflectIterativeMechanismStack.dart';
import '../../models/AdjustAccordionParameterCreator.dart';

/// 登录后三步引导：训练目标 → 感兴趣项目 → 身高体重
class SetExplicitInfoDecorator extends StatefulWidget {
  const SetExplicitInfoDecorator({super.key, required this.onComplete});

  final ValueChanged<ScheduleSubtleRouteHandler> onComplete;

  @override
  State<SetExplicitInfoDecorator> createState() => GetArithmeticLoaderObserver();
}

class GetArithmeticLoaderObserver extends State<SetExplicitInfoDecorator> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  final Set<String> _selectedGoals = {};
  final Set<String> _selectedSports = {};
  final _heightController = TextEditingController(text: '170');
  final _weightController = TextEditingController(text: '60');

  @override
  void dispose() {
    _pageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void InitializeSortedValueInstance(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: RestartAsynchronousBitrateManager.caption.copyWith(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: SearchSmallVarCollection.textPrimary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool DetachPrimaryZoneList() {
    switch (_pageIndex) {
      case 0:
        if (_selectedGoals.isEmpty) {
          InitializeSortedValueInstance('请至少选择一个训练目标');
          return false;
        }
        return true;
      case 1:
        if (_selectedSports.isEmpty) {
          InitializeSortedValueInstance('请至少选择一个感兴趣的项目');
          return false;
        }
        return true;
      case 2:
        final height = int.tryParse(_heightController.text.trim());
        final weight = int.tryParse(_weightController.text.trim());
        if (height == null || height < 100 || height > 250) {
          InitializeSortedValueInstance('请输入有效身高（100-250 cm）');
          return false;
        }
        if (weight == null || weight < 30 || weight > 200) {
          InitializeSortedValueInstance('请输入有效体重（30-200 kg）');
          return false;
        }
        return true;
      default:
        return true;
    }
  }

  void EndDelicateParameterTarget() {
    if (!DetachPrimaryZoneList()) return;
    if (_pageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    final height = int.parse(_heightController.text.trim());
    final weight = int.parse(_weightController.text.trim());
    final goals = _selectedGoals
        .map((id) => PoolIntuitiveVarCreator.trainingGoals.firstWhere((o) => o.id == id).label)
        .toList();
    final sports = _selectedSports
        .map((id) => PoolIntuitiveVarCreator.interestedSports.firstWhere((o) => o.id == id).label)
        .toList();
    widget.onComplete(
      ScheduleSubtleRouteHandler(
        trainingGoals: goals,
        interestedSports: sports,
        heightCm: height,
        weightKg: weight,
      ),
    );
  }

  void FinishRequiredNumberCache() {
    if (_pageIndex == 0) return;
    _pageController.previousPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.safeMargin,
                12,
                SetPublicFrameDelegate.safeMargin,
                8,
              ),
              child: Row(
                children: [
                  if (_pageIndex > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: FinishRequiredNumberCache,
                    )
                  else
                    const SizedBox(width: 48),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) {
                        final active = i == _pageIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: active ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: active ? SearchSmallVarCollection.brandGradient : null,
                            color: active ? null : SearchSmallVarCollection.bgSecondary,
                          ),
                        );
                      }),
                    ),
                  ),
                  Text(
                    '${_pageIndex + 1}/3',
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: SearchSmallVarCollection.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _pageIndex = i),
                children: [
                  EraseCustomizedParameterOwner(
                    selected: _selectedGoals,
                    onToggle: (id) => setState(() {
                      if (_selectedGoals.contains(id)) {
                        _selectedGoals.remove(id);
                      } else {
                        _selectedGoals.add(id);
                      }
                    }),
                  ),
                  SetMutableFrameFilter(
                    selected: _selectedSports,
                    onToggle: (id) => setState(() {
                      if (_selectedSports.contains(id)) {
                        _selectedSports.remove(id);
                      } else {
                        _selectedSports.add(id);
                      }
                    }),
                  ),
                  ResumeBackwardSceneGroup(
                    heightController: _heightController,
                    weightController: _weightController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.safeMargin,
                8,
                SetPublicFrameDelegate.safeMargin,
                24,
              ),
              child: FindGranularPreviewPool(
                label: _pageIndex == 2 ? '完成，进入相盼' : '下一步',
                height: 52,
                fontSize: 14,
                onPressed: EndDelicateParameterTarget,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GetReusableSkewYCreator extends StatelessWidget {
  const GetReusableSkewYCreator({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        SetPublicFrameDelegate.safeMargin,
        8,
        SetPublicFrameDelegate.safeMargin,
        20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(fontSize: 26)),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement.copyWith(color: SearchSmallVarCollection.textMuted),
          ),
        ],
      ),
    );
  }
}

class WrapConcreteFlagsDelegate extends StatelessWidget {
  const WrapConcreteFlagsDelegate({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final SetConsultativeQuaternionType option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          gradient: selected ? SearchSmallVarCollection.brandGradient : null,
          color: selected ? null : SearchSmallVarCollection.bgSecondary,
          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
          border: Border.all(
            color: selected ? Colors.transparent : SearchSmallVarCollection.bgSecondary,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: SearchSmallVarCollection.brandStart.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              option.icon,
              size: 18,
              color: selected ? Colors.white : SearchSmallVarCollection.brandStart,
            ),
            const SizedBox(width: 8),
            Text(
              option.label,
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                color: selected ? Colors.white : SearchSmallVarCollection.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EraseCustomizedParameterOwner extends StatelessWidget {
  const EraseCustomizedParameterOwner({required this.selected, required this.onToggle});

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const GetReusableSkewYCreator(
          title: '你的训练目标',
          subtitle: '选择你想达成的方向，可多选',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: PoolIntuitiveVarCreator.trainingGoals
                .map(
                  (o) => WrapConcreteFlagsDelegate(
                    option: o,
                    selected: selected.contains(o.id),
                    onTap: () => onToggle(o.id),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class SetMutableFrameFilter extends StatelessWidget {
  const SetMutableFrameFilter({required this.selected, required this.onToggle});

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const GetReusableSkewYCreator(
          title: '感兴趣的项目',
          subtitle: '告诉我们你更想尝试哪些运动',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: PoolIntuitiveVarCreator.interestedSports
                .map(
                  (o) => WrapConcreteFlagsDelegate(
                    option: o,
                    selected: selected.contains(o.id),
                    onTap: () => onToggle(o.id),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class ResumeBackwardSceneGroup extends StatelessWidget {
  const ResumeBackwardSceneGroup({
    required this.heightController,
    required this.weightController,
  });

  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const GetReusableSkewYCreator(
          title: '身体数据',
          subtitle: '填写身高体重，便于为你推荐合适训练',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
          child: Column(
            children: [
              GetArithmeticDepthArray(
                label: '身高',
                unit: 'cm',
                controller: heightController,
                hint: '例如 170',
              ),
              const SizedBox(height: 16),
              GetArithmeticDepthArray(
                label: '体重',
                unit: 'kg',
                controller: weightController,
                hint: '例如 60',
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: SearchSmallVarCollection.bgSecondary,
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                ),
                child: Text(
                  '数据仅用于本地训练推荐，不会对外公开。',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.textSecondary,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class GetArithmeticDepthArray extends StatelessWidget {
  const GetArithmeticDepthArray({
    required this.label,
    required this.unit,
    required this.controller,
    required this.hint,
  });

  final String label;
  final String unit;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.bgSecondary,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              label,
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: SearchSmallVarCollection.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 28),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement.copyWith(color: SearchSmallVarCollection.textMuted),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Text(
            unit,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              color: SearchSmallVarCollection.brandStart,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
