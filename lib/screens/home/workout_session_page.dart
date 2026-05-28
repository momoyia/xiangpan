import 'dart:async';
import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/gradient_button.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_plan_detail.dart';
import '../../models/workout_session_result.dart';
import '../../utils/workout_duration_parser.dart';
import 'workout_complete_page.dart';

enum _SessionPhase { countdown, active, paused }

class WorkoutSessionPage extends StatefulWidget {
  const WorkoutSessionPage({
    super.key,
    required this.plan,
    required this.detail,
  });

  final WorkoutPlan plan;
  final WorkoutPlanDetail detail;

  @override
  State<WorkoutSessionPage> createState() => _WorkoutSessionPageState();
}

class _WorkoutSessionPageState extends State<WorkoutSessionPage> {
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
        .map((s) => WorkoutDurationParser.parseToSeconds(s.duration))
        .toList();
    _stepRemaining = _stepDurations.first;
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  void _onTick(Timer t) {
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
        _advanceStep();
      }
    });
  }

  void _advanceStep() {
    if (_stepIndex >= widget.detail.steps.length - 1) {
      _timer?.cancel();
      _openComplete();
      return;
    }
    _stepIndex++;
    _stepRemaining = _stepDurations[_stepIndex];
  }

  void _skipStep() {
    if (_stepIndex >= widget.detail.steps.length - 1) {
      _timer?.cancel();
      _openComplete();
      return;
    }
    setState(() {
      _stepIndex++;
      _stepRemaining = _stepDurations[_stepIndex];
    });
  }

  void _prevStep() {
    if (_stepIndex == 0) return;
    setState(() {
      _stepIndex--;
      _stepRemaining = _stepDurations[_stepIndex];
    });
  }

  void _togglePause() {
    setState(() {
      _phase = _phase == _SessionPhase.paused
          ? _SessionPhase.active
          : _SessionPhase.paused;
    });
  }

  int get _plannedTotalSeconds =>
      _stepDurations.fold<int>(0, (a, b) => a + b);

  int get _caloriesBurned {
    if (_plannedTotalSeconds <= 0) return widget.plan.calories;
    final ratio = (_elapsedTotal / _plannedTotalSeconds).clamp(0.0, 1.0);
    return (widget.plan.calories * ratio).round().clamp(1, widget.plan.calories);
  }

  WorkoutSessionResult _buildResult() {
    return WorkoutSessionResult(
      planId: widget.plan.id,
      planTitle: widget.plan.title,
      elapsedSeconds: _elapsedTotal,
      caloriesBurned: _caloriesBurned,
      completedSteps: _stepIndex + 1,
      totalSteps: widget.detail.steps.length,
    );
  }

  Future<void> _openComplete() async {
    final result = _buildResult();
    final returned = await Navigator.push<WorkoutSessionResult>(
      context,
      MaterialPageRoute(
        builder: (ctx) => WorkoutCompletePage(
          plan: widget.plan,
          result: result,
        ),
      ),
    );
    if (!mounted) return;
    Navigator.pop(context, returned ?? result);
  }

  Future<void> _confirmExit() async {
    final leave = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('结束训练？', style: AppTextStyles.h2),
        content: Text(
          '退出后本次进度不会保存，确定要离开吗？',
          style: AppTextStyles.bodySmall,
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
              style: AppTextStyles.caption.copyWith(color: AppColors.rose),
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
    final progress = (_stepIndex + 1) / widget.detail.steps.length;
    final showCountdown = _phase == _SessionPhase.countdown;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _confirmExit();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF0F172A),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Opacity(
              opacity: 0.35,
              child: AppImage(
                assetPath: widget.plan.imageAsset,
                networkUrl: widget.plan.imageUrl,
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
                          onPressed: _confirmExit,
                          icon: const Icon(Icons.close, color: Colors.white70),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                widget.plan.title,
                                style: AppTextStyles.caption.copyWith(
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
                                  value: progress,
                                  minHeight: 4,
                                  backgroundColor: Colors.white.withOpacity(0.15),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                    AppColors.brandEnd,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '环节 ${_stepIndex + 1} / ${widget.detail.steps.length}',
                                style: AppTextStyles.captionSmall.copyWith(
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
                          ? _CountdownView(value: _countdown)
                          : _ActiveStepView(
                              stepTitle: step.title,
                              tip: step.tip,
                              remaining: _stepRemaining,
                            ),
                    ),
                  ),
                  if (!showCountdown) _ControlBar(
                    canGoPrev: _stepIndex > 0,
                    isPaused: _phase == _SessionPhase.paused,
                    onPrev: _prevStep,
                    onPause: _togglePause,
                    onSkip: _skipStep,
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            if (_phase == _SessionPhase.paused)
              _PauseOverlay(onResume: _togglePause),
          ],
        ),
      ),
    );
  }
}

class _CountdownView extends StatelessWidget {
  const _CountdownView({required this.value});
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '准备开始',
          style: AppTextStyles.body.copyWith(color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Text(
          '$value',
          style: AppTextStyles.displayLarge.copyWith(
            fontSize: 72,
            color: Colors.white,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}

class _ActiveStepView extends StatelessWidget {
  const _ActiveStepView({
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
            WorkoutDurationParser.formatClock(remaining),
            style: AppTextStyles.displayLarge.copyWith(
              fontSize: 56,
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            stepTitle,
            style: AppTextStyles.h1.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          if (tip != null && tip!.isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              tip!,
              style: AppTextStyles.bodySmall.copyWith(color: Colors.white60),
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }
}

class _ControlBar extends StatelessWidget {
  const _ControlBar({
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
          _ControlBtn(
            icon: Icons.skip_previous_rounded,
            label: '上一环节',
            onTap: canGoPrev ? onPrev : null,
            enabled: canGoPrev,
          ),
          _ControlBtn(
            icon: isPaused ? Icons.play_arrow_rounded : Icons.pause_rounded,
            label: isPaused ? '继续' : '暂停',
            onTap: onPause,
            highlighted: true,
          ),
          _ControlBtn(
            icon: Icons.skip_next_rounded,
            label: '下一环节',
            onTap: onSkip,
          ),
        ],
      ),
    );
  }
}

class _ControlBtn extends StatelessWidget {
  const _ControlBtn({
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
              gradient: highlighted && enabled ? AppColors.brandGradient : null,
              color: highlighted && enabled
                  ? null
                  : Colors.white.withOpacity(enabled ? 0.12 : 0.06),
            ),
            child: Icon(icon, color: color, size: highlighted ? 28 : 22),
          ),
          const SizedBox(height: 6),
          Text(label, style: AppTextStyles.captionSmall.copyWith(color: color)),
        ],
      ),
    );
  }
}

class _PauseOverlay extends StatelessWidget {
  const _PauseOverlay({required this.onResume});
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
          Text('训练已暂停', style: AppTextStyles.h2.copyWith(color: Colors.white)),
          const SizedBox(height: 24),
          SizedBox(
            width: 200,
            child: GradientButton(
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
