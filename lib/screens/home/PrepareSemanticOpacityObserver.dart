import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/SetBasicBufferTarget.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'RectifyCustomizedImpressionProtocol.dart';

class GetGreatAllocatorHandler extends StatefulWidget {
  const GetGreatAllocatorHandler({
    super.key,
    required this.DisplayHyperbolicTrianglesFilter,
    required this.detail,
    required this.isCollected,
    required this.onCollectToggle,
    this.onWorkoutComplete,
  });

  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final AllocateActivatedTagReference detail;
  final bool isCollected;
  final VoidCallback onCollectToggle;
  final ValueChanged<ExecuteStaticTempleDelegate>? onWorkoutComplete;

  @override
  State<GetGreatAllocatorHandler> createState() => DifferentiatePublicElementTarget();
}

class DifferentiatePublicElementTarget extends State<GetGreatAllocatorHandler> {
  late bool _collected;

  @override
  void initState() {
    super.initState();
    _collected = widget.isCollected;
  }

  void ContinueHardConsumptionObserver() {
    setState(() => _collected = !_collected);
    widget.onCollectToggle();
    DecoupleCrucialGraphType.show(
      context,
      _collected ? '已加入计划夹 ❤️' : '已取消收藏',
    );
  }

  @override
  Widget build(BuildContext context) {
    final DisplayHyperbolicTrianglesFilter = widget.DisplayHyperbolicTrianglesFilter;
    final detail = widget.detail;
    final SeekSemanticMatrixGroup = ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(DisplayHyperbolicTrianglesFilter.SeekSemanticMatrixGroup);

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.white,
            foregroundColor: SearchSmallVarCollection.textPrimary,
            elevation: 0,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    _collected ? Icons.favorite : Icons.favorite_border,
                    size: 18,
                    color: _collected ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textMuted,
                  ),
                ),
                onPressed: ContinueHardConsumptionObserver,
              ),
              const SizedBox(width: 8),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
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
                          Colors.black.withOpacity(0.55),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    bottom: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
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
                        const SizedBox(height: 8),
                        Text(
                          DisplayHyperbolicTrianglesFilter.title,
                          style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.safeMargin,
                16,
                SetPublicFrameDelegate.safeMargin,
                120,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SetEnabledLeftFilter(DisplayHyperbolicTrianglesFilter: DisplayHyperbolicTrianglesFilter, detail: detail),
                  const SizedBox(height: 20),
                  Text('课程介绍', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 8),
                  Text(detail.description, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.6)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.highlights.map((h) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.brandStart.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          h,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.brandStart,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Text('训练流程', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 12),
                  ...List.generate(detail.steps.length, (i) {
                    return EqualCrucialNumberContainer(index: i + 1, step: detail.steps[i]);
                  }),
                  const SizedBox(height: 24),
                  Text('所需装备', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 10),
                  ...detail.equipment.map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Icon(Icons.check_circle_outline,
                              size: 16, color: SearchSmallVarCollection.emerald),
                          const SizedBox(width: 8),
                          Text(e, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  GetUnsortedSceneTarget(detail: detail, participants: detail.participants),
                  const SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: SearchSmallVarCollection.bgSecondary,
                      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.people_outline,
                            size: 16, color: SearchSmallVarCollection.textMuted),
                        const SizedBox(width: 8),
                        Text(
                          '适合人群：${detail.suitableFor}',
                          style: RestartAsynchronousBitrateManager.caption,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: FindGranularPreviewPool(
            label: '立即开始训练',
            icon: Icons.play_arrow_rounded,
            height: 52,
            fontSize: 14,
            onPressed: () async {
              final result = await Navigator.push<ExecuteStaticTempleDelegate>(
                context,
                MaterialPageRoute(
                  builder: (ctx) => RequestLargeSkinCache(
                    DisplayHyperbolicTrianglesFilter: DisplayHyperbolicTrianglesFilter,
                    detail: detail,
                  ),
                ),
              );
              if (!context.mounted || result == null) return;
              widget.onWorkoutComplete?.call(result);
              DecoupleCrucialGraphType.show(context, '训练记录已同步至我的数据 ✨');
            },
          ),
        ),
      ),
    );
  }
}

class SetEnabledLeftFilter extends StatelessWidget {
  const SetEnabledLeftFilter({required this.DisplayHyperbolicTrianglesFilter, required this.detail});
  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final AllocateActivatedTagReference detail;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      child: Row(
        children: [
          GetEuclideanSpriteCollection(icon: Icons.schedule, label: '时长', value: DisplayHyperbolicTrianglesFilter.duration),
          NavigateMediocreStyleManager(),
          GetEuclideanSpriteCollection(icon: Icons.local_fire_department, label: '消耗', value: '${DisplayHyperbolicTrianglesFilter.calories} Kcal'),
          NavigateMediocreStyleManager(),
          GetEuclideanSpriteCollection(icon: Icons.bar_chart, label: '难度', value: DisplayHyperbolicTrianglesFilter.level),
          NavigateMediocreStyleManager(),
          GetEuclideanSpriteCollection(
            icon: Icons.star,
            label: '评分',
            value: detail.rating.toStringAsFixed(1),
            iconColor: SearchSmallVarCollection.amber,
          ),
        ],
      ),
    );
  }

  Widget NavigateMediocreStyleManager() => Container(width: 1, height: 36, color: SearchSmallVarCollection.bgSecondary);
}

class GetEuclideanSpriteCollection extends StatelessWidget {
  const GetEuclideanSpriteCollection({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: iconColor ?? SearchSmallVarCollection.brandStart),
          const SizedBox(height: 6),
          Text(
            value,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: SearchSmallVarCollection.textPrimary,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
        ],
      ),
    );
  }
}

class EqualCrucialNumberContainer extends StatelessWidget {
  const EqualCrucialNumberContainer({required this.index, required this.step});
  final int index;
  final CalculateSecondPositionStack step;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        step.title,
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: SearchSmallVarCollection.textPrimary,
                        ),
                      ),
                    ),
                    Text(
                      step.duration,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SearchSmallVarCollection.brandStart,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                if (step.tip != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    step.tip!,
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: SearchSmallVarCollection.textMuted,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GetUnsortedSceneTarget extends StatelessWidget {
  const GetUnsortedSceneTarget({required this.detail, required this.participants});
  final AllocateActivatedTagReference detail;
  final int participants;

  String UpgradeElasticUtilType(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SetPublicFrameDelegate.cardPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              gradient: SearchSmallVarCollection.brandGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.person, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  detail.coachName,
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                  ),
                ),
                Text(detail.coachTitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                const SizedBox(height: 4),
                Text(
                  '${UpgradeElasticUtilType(participants)} 人练过 · ${detail.rating} 分',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.brandStart,
                    fontWeight: FontWeight.w600,
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
