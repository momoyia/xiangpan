import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/SetBasicBufferTarget.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import '../../utils/PauseSeamlessHeadInstance.dart';
import 'SkipMissedValueTarget.dart';

enum _SessionPhase { countdown, active, paused }

class EndNewestTrajectoryHelper extends StatefulWidget {
  const EndNewestTrajectoryHelper({
    super.key,
    required this.DisplayHyperbolicTrianglesFilter,
    required this.detail,
  });

  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final AllocateActivatedTagReference detail;

  @override
  State<EndNewestTrajectoryHelper> createState() => SkipMutableScaleHandler();
}

class SkipMutableScaleHandler extends State<EndNewestTrajectoryHelper> {
  _SessionPhase _phase = _SessionPhase.countdown;
  int _countdown = 3;
  int _stepIndex = 0;
  late int _stepRemaining;
  late final List<int> _stepDurations;
  int _elapsedTotal = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _stepDurations = widget.detail.steps
        .map((s) => SetGreatInterfaceCreator.PrepareOldValueFilter(s.duration))
        .toList();
    _stepRemaining = _stepDurations.first;
    AddConcreteCoordObserver();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void AddConcreteCoordObserver() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), SetConcurrentTempleArray);
  }

  void SetConcurrentTempleArray(Timer t) {
    if (!mounted) return;
    if (_phase == _SessionPhase.paused) return;

    if (_phase == _SessionPhase.countdown) {
      setState(() {
        if (_countdown > 1) {
          _countdown--;
        } else {
          _phase = _SessionPhase.active;
        }
      });
      return;
    }

    setState(() {
      _elapsedTotal++;
      if (_stepRemaining > 1) {
        _stepRemaining--;
      } else {
        FloatStandaloneVariableList();
      }
    });
  }

  void FloatStandaloneVariableList() {
    if (_stepIndex >= widget.detail.steps.length - 1) {
      _timer?.cancel();
      SetMissedProvisionImplement();
      return;
    }
    _stepIndex++;
    _stepRemaining = _stepDurations[_stepIndex];
  }

  void SetRequiredFrameProtocol() {
    if (_stepIndex >= widget.detail.steps.length - 1) {
      _timer?.cancel();
      SetMissedProvisionImplement();
      return;
    }
    setState(() {
      _stepIndex++;
      _stepRemaining = _stepDurations[_stepIndex];
    });
  }

  void ShearKeyColorCreator() {
    if (_stepIndex == 0) return;
    setState(() {
      _stepIndex--;
      _stepRemaining = _stepDurations[_stepIndex];
    });
  }

  void EnumerateExplicitGraphFilter() {
    setState(() {
      _phase = _phase == _SessionPhase.paused
          ? _SessionPhase.active
          : _SessionPhase.paused;
    });
  }

  int get GetAssociatedNodeFilter =>
      _stepDurations.fold<int>(0, (a, b) => a + b);

  int get ContinueSustainableAnalogyGroup {
    if (GetAssociatedNodeFilter <= 0) return widget.DisplayHyperbolicTrianglesFilter.calories;
    final ratio = (_elapsedTotal / GetAssociatedNodeFilter).clamp(0.0, 1.0);
    return (widget.DisplayHyperbolicTrianglesFilter.calories * ratio).round().clamp(1, widget.DisplayHyperbolicTrianglesFilter.calories);
  }

  ExecuteStaticTempleDelegate SetConcreteIndicatorCreator() {
    return ExecuteStaticTempleDelegate(
      planId: widget.DisplayHyperbolicTrianglesFilter.id,
      planTitle: widget.DisplayHyperbolicTrianglesFilter.title,
      elapsedSeconds: _elapsedTotal,
      caloriesBurned: ContinueSustainableAnalogyGroup,
      completedSteps: _stepIndex + 1,
      totalSteps: widget.detail.steps.length,
    );
  }

  Future<void> SetMissedProvisionImplement() async {
    final result = SetConcreteIndicatorCreator();
    final returned = await Navigator.push<ExecuteStaticTempleDelegate>(
      context,
      MaterialPageRoute(
        builder: (ctx) => GetActivatedObjectCache(
          DisplayHyperbolicTrianglesFilter: widget.DisplayHyperbolicTrianglesFilter,
          result: result,
        ),
      ),
    );
    if (!mounted) return;
    Navigator.pop(context, returned ?? result);
  }

  Future<void> AugmentCurrentParamCollection() async {
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('结束训练？', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        content: Text(
          '退出后本次进度不会保存，确定要离开吗？',
          style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('继续训练'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              '退出',
              style: RestartAsynchronousBitrateManager.caption.copyWith(color: SearchSmallVarCollection.rose),
            ),
          ),
        ],
      ),
    );
    if (leave == true && mounted) {
      _timer?.cancel();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final step = widget.detail.steps[_stepIndex];
    final GetNewestValueCache = (_stepIndex + 1) / widget.detail.steps.length;
    final showCountdown = _phase == _SessionPhase.countdown;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) AugmentCurrentParamCollection();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.35,
              child: LimitRetainedBufferList(
                assetPath: widget.DisplayHyperbolicTrianglesFilter.imageAsset,
                networkUrl: widget.DisplayHyperbolicTrianglesFilter.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF0F172A).withOpacity(0.7),
                    const Color(0xFF0F172A).withOpacity(0.92),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: AugmentCurrentParamCollection,
                          icon: const Icon(Icons.close, color: Colors.white70),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                widget.DisplayHyperbolicTrianglesFilter.title,
                                style: RestartAsynchronousBitrateManager.caption.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: GetNewestValueCache,
                                  minHeight: 4,
                                  backgroundColor: Colors.white.withOpacity(0.15),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    SearchSmallVarCollection.brandEnd,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '环节 ${_stepIndex + 1} / ${widget.detail.steps.length}',
                                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                  color: Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: showCountdown
                          ? LimitHierarchicalOriginBase(value: _countdown)
                          : ProvideDisplayableOpacityDelegate(
                              stepTitle: step.title,
                              tip: step.tip,
                              remaining: _stepRemaining,
                            ),
                    ),
                  ),
                  if (!showCountdown) ObtainCrucialBulletHelper(
                    canGoPrev: _stepIndex > 0,
                    isPaused: _phase == _SessionPhase.paused,
                    onPrev: ShearKeyColorCreator,
                    onPause: EnumerateExplicitGraphFilter,
                    onSkip: SetRequiredFrameProtocol,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            if (_phase == _SessionPhase.paused)
              GetNumericalFormatDecorator(onResume: EnumerateExplicitGraphFilter),
          ],
        ),
      ),
    );
  }
}

class LimitHierarchicalOriginBase extends StatelessWidget {
  const LimitHierarchicalOriginBase({required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '准备开始',
          style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Text(
          '$value',
          style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(
            fontSize: 72,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class ProvideDisplayableOpacityDelegate extends StatelessWidget {
  const ProvideDisplayableOpacityDelegate({
    required this.stepTitle,
    required this.tip,
    required this.remaining,
  });

  final String stepTitle;
  final String? tip;
  final int remaining;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            SetGreatInterfaceCreator.EndImmutableParamReference(remaining),
            style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(
              fontSize: 56,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            stepTitle,
            style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          if (tip != null && tip!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              tip!,
              style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(color: Colors.white60),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class ObtainCrucialBulletHelper extends StatelessWidget {
  const ObtainCrucialBulletHelper({
    required this.canGoPrev,
    required this.isPaused,
    required this.onPrev,
    required this.onPause,
    required this.onSkip,
  });

  final bool canGoPrev;
  final bool isPaused;
  final VoidCallback onPrev;
  final VoidCallback onPause;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SetEasyDescriptionInstance(
            icon: Icons.skip_previous_rounded,
            label: '上一环节',
            onTap: canGoPrev ? onPrev : null,
            enabled: canGoPrev,
          ),
          SetEasyDescriptionInstance(
            icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
            label: isPaused ? '继续' : '暂停',
            onTap: onPause,
            highlighted: true,
          ),
          SetEasyDescriptionInstance(
            icon: Icons.skip_next_rounded,
            label: '下一环节',
            onTap: onSkip,
          ),
        ],
      ),
    );
  }
}

class SetEasyDescriptionInstance extends StatelessWidget {
  const SetEasyDescriptionInstance({
    required this.icon,
    required this.label,
    this.onTap,
    this.enabled = true,
    this.highlighted = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final bool enabled;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = enabled
        ? (highlighted ? Colors.white : Colors.white70)
        : Colors.white24;
    return GestureDetector(
      onTap: enabled ? onTap : null,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: highlighted ? 56 : 44,
            height: highlighted ? 56 : 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: highlighted && enabled ? SearchSmallVarCollection.brandGradient : null,
              color: highlighted && enabled
                  ? null
                  : Colors.white.withOpacity(enabled ? 0.12 : 0.06),
            ),
            child: Icon(icon, color: color, size: highlighted ? 28 : 22),
          ),
          const SizedBox(height: 6),
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: color)),
        ],
      ),
    );
  }
}

class GetNumericalFormatDecorator extends StatelessWidget {
  const GetNumericalFormatDecorator({required this.onResume});
  final VoidCallback onResume;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.pause_circle_outline, size: 48, color: Colors.white70),
          const SizedBox(height: 12),
          Text('训练已暂停', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(color: Colors.white)),
          const SizedBox(height: 24),
          SizedBox(
            width: 200,
            child: FindGranularPreviewPool(
              label: '继续训练',
              icon: Icons.play_arrow_rounded,
              onPressed: onResume,
            ),
          ),
        ],
      ),
    );
  }
}
