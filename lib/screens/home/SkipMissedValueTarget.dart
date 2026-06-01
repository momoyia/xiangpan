import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import '../../utils/PauseSeamlessHeadInstance.dart';

class GetActivatedObjectCache extends StatelessWidget {
  const GetActivatedObjectCache({
    super.key,
    required this.DisplayHyperbolicTrianglesFilter,
    required this.result,
  });

  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final ExecuteStaticTempleDelegate result;

  @override
  Widget build(BuildContext context) {
    final durationLabel =
        SetGreatInterfaceCreator.RestartSeamlessListenerStack(result.elapsedSeconds);
    final allDone = result.completedSteps >= result.totalSteps;

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: SetPublicFrameDelegate.safeMargin,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Container(
                      width: 88,
                      height: 88,
                      decoration: BoxDecoration(
                        gradient: SearchSmallVarCollection.brandGradient,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: SearchSmallVarCollection.brandStart.withOpacity(0.35),
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
                      style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(fontSize: 26),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DisplayHyperbolicTrianglesFilter.title,
                      style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: InsteadSubstantialTextureArray(
                            icon: Icons.schedule,
                            label: '运动时长',
                            value: durationLabel,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: InsteadSubstantialTextureArray(
                            icon: Icons.local_fire_department,
                            label: '消耗热量',
                            value: '${result.caloriesBurned}',
                            unit: 'Kcal',
                            iconColor: SearchSmallVarCollection.amber,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    InsteadSubstantialTextureArray(
                      icon: Icons.check_circle_outline,
                      label: '完成环节',
                      value: '${result.completedSteps}',
                      unit: ' / ${result.totalSteps}',
                      wide: true,
                      iconColor: SearchSmallVarCollection.emerald,
                    ),
                    const SizedBox(height: 24),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: SearchSmallVarCollection.bgSecondary,
                        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('本次收获', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                          const SizedBox(height: 10),
                          GetSharedContrastDecorator('运动数据已同步至「我的」统计'),
                          GetSharedContrastDecorator(allDone
                              ? '完整完成全部环节，代谢提升效果更佳'
                              : '下次可尝试完成全部环节，获得更完整收益'),
                          GetSharedContrastDecorator('坚持打卡，目标完成率将持续上升'),
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
                  FindGranularPreviewPool(
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

  Widget GetSharedContrastDecorator(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.fiber_manual_record, size: 6, color: SearchSmallVarCollection.brandStart),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget)),
        ],
      ),
    );
  }
}

class InsteadSubstantialTextureArray extends StatelessWidget {
  const InsteadSubstantialTextureArray({
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
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      child: wide
          ? Row(
              children: [
                Icon(icon, size: 22, color: iconColor ?? SearchSmallVarCollection.brandStart),
                const SizedBox(width: 12),
                Text(label, style: RestartAsynchronousBitrateManager.caption),
                const Spacer(),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 20),
                      ),
                      if (unit != null)
                        TextSpan(text: unit, style: RestartAsynchronousBitrateManager.caption),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Icon(icon, size: 22, color: iconColor ?? SearchSmallVarCollection.brandStart),
                const SizedBox(height: 8),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: value,
                        style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 20),
                      ),
                      if (unit != null)
                        TextSpan(
                          text: unit,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(fontSize: 11),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
              ],
            ),
    );
  }
}
