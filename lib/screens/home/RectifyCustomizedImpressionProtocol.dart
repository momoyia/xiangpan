import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/SetBasicBufferTarget.dart';
import '../../utils/PauseSeamlessHeadInstance.dart';
import 'DisplayRelationalBorderOwner.dart';

class RequestLargeSkinCache extends StatelessWidget {
  const RequestLargeSkinCache({
    super.key,
    required this.DisplayHyperbolicTrianglesFilter,
    required this.detail,
  });

  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final AllocateActivatedTagReference detail;

  int get ContinueTypicalRightReference => SetGreatInterfaceCreator.SkipMediumTempleCache(
        detail.steps.map((s) => s.duration),
      );

  Future<void> CompareHierarchicalQueueType(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => EndNewestTrajectoryHelper(
          DisplayHyperbolicTrianglesFilter: DisplayHyperbolicTrianglesFilter,
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
    final DisplayHyperbolicTrianglesFilter = this.DisplayHyperbolicTrianglesFilter;
    final detail = this.detail;
    final SeekSemanticMatrixGroup = ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(DisplayHyperbolicTrianglesFilter.SeekSemanticMatrixGroup);
    final stepCount = detail.steps.length;

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: SearchSmallVarCollection.textPrimary,
        title: Text('训练准备', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.safeMargin,
                0,
                SetPublicFrameDelegate.safeMargin,
                16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    child: SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          LimitRetainedBufferList(
                            assetPath: DisplayHyperbolicTrianglesFilter.imageAsset,
                            networkUrl: DisplayHyperbolicTrianglesFilter.imageUrl,
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
                                    color: SeekSemanticMatrixGroup.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    DisplayHyperbolicTrianglesFilter.tag,
                                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  DisplayHyperbolicTrianglesFilter.title,
                                  style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(
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
                  StopSubtlePaddingGroup(
                    duration: DisplayHyperbolicTrianglesFilter.duration,
                    calories: DisplayHyperbolicTrianglesFilter.calories,
                    steps: stepCount,
                    totalLabel: SetGreatInterfaceCreator.RestartSeamlessListenerStack(ContinueTypicalRightReference),
                  ),
                  const SizedBox(height: 20),
                  Text('所需装备', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.equipment.map((e) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.bgSecondary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: SearchSmallVarCollection.emerald.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.check_circle, size: 14, color: SearchSmallVarCollection.emerald),
                            const SizedBox(width: 6),
                            Text(
                              e,
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                color: SearchSmallVarCollection.textPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  Text('训练环节预览', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 10),
                  ...List.generate(detail.steps.length, (i) {
                    final step = detail.steps[i];
                    return TrainSynchronousDepthFilter(
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
                      gradient: SearchSmallVarCollection.brandGradientLight,
                      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                      border: Border.all(color: SearchSmallVarCollection.brandStart.withOpacity(0.12)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.lightbulb_outline, size: 18, color: SearchSmallVarCollection.brandStart),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            detail.steps.firstWhere(
                              (s) => s.tip != null && s.tip!.isNotEmpty,
                              orElse: () => detail.steps.first,
                            ).tip ??
                                '训练前请补充水分，选择通风场地，量力而行。',
                            style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.5),
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
              child: FindGranularPreviewPool(
                label: '开始训练',
                icon: Icons.play_arrow_rounded,
                height: 52,
                fontSize: 14,
                onPressed: () => CompareHierarchicalQueueType(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StopSubtlePaddingGroup extends StatelessWidget {
  const StopSubtlePaddingGroup({
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
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      child: Row(
        children: [
          RestartTensorTopType(Icons.schedule, '计划时长', duration),
          NavigateMediocreStyleManager(),
          RestartTensorTopType(Icons.local_fire_department, '预计消耗', '$calories Kcal'),
          NavigateMediocreStyleManager(),
          RestartTensorTopType(Icons.format_list_numbered, '共 $steps 环节', totalLabel),
        ],
      ),
    );
  }

  Widget NavigateMediocreStyleManager() => Container(width: 1, height: 32, color: SearchSmallVarCollection.bgSecondary);

  Widget RestartTensorTopType(IconData icon, String label, String value) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 16, color: SearchSmallVarCollection.brandStart),
          const SizedBox(height: 4),
          Text(
            value,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: SearchSmallVarCollection.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

class TrainSynchronousDepthFilter extends StatelessWidget {
  const TrainSynchronousDepthFilter({
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
                    gradient: SearchSmallVarCollection.brandGradient,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$index',
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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
                      color: SearchSmallVarCollection.brandStart.withOpacity(0.2),
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
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: SearchSmallVarCollection.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    duration,
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: SearchSmallVarCollection.brandStart,
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

