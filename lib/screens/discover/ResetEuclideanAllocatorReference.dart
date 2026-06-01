import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/InitializeSignificantSpineContainer.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/SetBasicBufferTarget.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import '../home/DisplayRelationalBorderOwner.dart';

class DismissPublicSpriteObserver extends StatefulWidget {
  const DismissPublicSpriteObserver({
    super.key,
    required this.detail,
  });

  final FinishOtherDispatcherGroup detail;

  @override
  State<DismissPublicSpriteObserver> createState() => SetBasicStrengthContainer();
}

class SetBasicStrengthContainer extends State<DismissPublicSpriteObserver> {
  int _calibrationStep = 0;

  static const _steps = [
    '感知当前呼吸节奏',
    '确认场地与装备就绪',
    '即将进入第一章场景',
  ];

  SetLastScenarioArray get StopLostTangentDelegate {
    final base = ReducePermanentHeadAdapter.SetNextVariableList.firstWhere(
      (t) => t.id == widget.detail.id,
    );
    return SetLastScenarioArray(
      id: base.id,
      title: base.title,
      tag: '训练时空',
      SeekSemanticMatrixGroup: 0xFF047857,
      duration: base.time,
      level: widget.detail.intensityLabel,
      calories: int.tryParse(
            widget.detail.calories.replaceAll(RegExp(r'[^0-9]'), ''),
          ) ??
          300,
      imageAsset: base.imageAsset,
      imageUrl: base.imageUrl,
    );
  }

  AllocateActivatedTagReference get SpinBasicTangentObserver => AllocateActivatedTagReference(
        description: widget.detail.atmosphere,
        coachName: '相盼时空引导',
        coachTitle: widget.detail.label,
        rating: 4.8,
        participants: widget.detail.participants,
        steps: widget.detail.phases
            .map(
              (p) => CalculateSecondPositionStack(
                title: p.name,
                duration: p.duration,
                tip: '${p.scene} · ${p.bodyFeel}',
              ),
            )
            .toList(),
        equipment: widget.detail.gearList,
        highlights: widget.detail.ambienceTags,
        suitableFor: widget.detail.suitableCrowd,
      );

  Future<void> StartMediocreBitrateImplement() async {
    final result = await Navigator.push<ExecuteStaticTempleDelegate>(
      context,
      MaterialPageRoute(
        builder: (ctx) => EndNewestTrajectoryHelper(
          DisplayHyperbolicTrianglesFilter: StopLostTangentDelegate,
          detail: SpinBasicTangentObserver,
        ),
      ),
    );
    if (!mounted) return;
    if (result != null) {
      Navigator.pop(context, result);
      Navigator.pop(context, result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;

    return Scaffold(
      backgroundColor: const Color(0xFF042F2E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF042F2E),
        elevation: 0,
        foregroundColor: Colors.white,
        title: Text('时空校准', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              detail.sceneCode,
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                color: Colors.white38,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              detail.title,
              style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              detail.atmosphere,
              style: RestartAsynchronousBitrateManager.caption.copyWith(color: SearchSmallVarCollection.emerald),
            ),
            const SizedBox(height: 28),
            Text(
              '校准步骤',
              style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(height: 12),
            ...List.generate(_steps.length, (i) {
              final done = i < _calibrationStep;
              final active = i == _calibrationStep;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (i == _calibrationStep) {
                        _calibrationStep++;
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: done
                          ? SearchSmallVarCollection.emerald.withOpacity(0.2)
                          : Colors.white.withOpacity(active ? 0.12 : 0.06),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: done
                            ? SearchSmallVarCollection.emerald.withOpacity(0.5)
                            : Colors.white.withOpacity(0.1),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          done ? Icons.check_circle : Icons.radio_button_unchecked,
                          size: 20,
                          color: done ? SearchSmallVarCollection.emerald : Colors.white38,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            _steps[i],
                            style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: _calibrationStep >= _steps.length ? StartMediocreBitrateImplement : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: SearchSmallVarCollection.emerald,
                  disabledBackgroundColor: Colors.white24,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                  ),
                ),
                child: Text(
                  _calibrationStep >= _steps.length
                      ? '进入第一章'
                      : '完成 ${_steps.length - _calibrationStep} 项校准',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
