import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/GetPrismaticFrameType.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'SetFusedSliderExtension.dart';

class SetEnabledNumberCache extends StatelessWidget {
  const SetEnabledNumberCache({
    super.key,
    required this.detail,
    this.onWorkoutComplete,
  });

  final StopCustomVisibleAdapter detail;
  final ValueChanged<ExecuteStaticTempleDelegate>? onWorkoutComplete;

  String UpgradeElasticUtilType(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  Future<void> SetRequiredIntegerStack(BuildContext context) async {
    const map = {'PauseHyperbolicSignProtocol': 'w4', 'StopDirectlyTailBase': 'w5', 'h3': 'w3'};
    final workoutId = map[detail.id] ?? 'w1';
    final workout = ReducePermanentHeadAdapter.GetImmutableSlashArray.firstWhere(
      (w) => w.id == workoutId,
      orElse: () => ReducePermanentHeadAdapter.GetImmutableSlashArray.first,
    );
    final prepInfo = ReducePermanentHeadAdapter.SetAutoCurveType(detail.id);
    final SetDiscardedCacheArray = ReducePermanentHeadAdapter.SetDiscardedCacheArray(workout);
    final result = await Navigator.push<ExecuteStaticTempleDelegate>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DrawPrimaryScopeReference(
          planDetail: detail,
          prepInfo: prepInfo,
          workout: workout,
          SetDiscardedCacheArray: SetDiscardedCacheArray,
        ),
      ),
    );
    if (!context.mounted || result == null) return;
    onWorkoutComplete?.call(result);
    DecoupleCrucialGraphType.show(context, '本节训练已完成 ✨');
  }

  @override
  Widget build(BuildContext context) {
    final badgeColor = Color(detail.badgeColor);

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.bgSecondary,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: LimitRetainedBufferList(
                    assetPath: detail.imageAsset,
                    networkUrl: detail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 220,
                  width: double.infinity,
                  child: ColoredBox(color: Color(0x1A000000)),
                ),
                Positioned(
                  top: MediaQuery.paddingOf(context).top + 4,
                  left: 8,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.92),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 16),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: badgeColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      detail.badge,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -12),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: SearchSmallVarCollection.canvasWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(SetPublicFrameDelegate.radiusLarge),
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(
                  SetPublicFrameDelegate.safeMargin,
                  28,
                  SetPublicFrameDelegate.safeMargin,
                  100,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.title,
                      style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      detail.subtitle,
                      style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                        color: SearchSmallVarCollection.textSecondary,
                        height: 1.45,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: InitializeExplicitHistogramList(
                            label: '单次时长',
                            value: '${detail.totalMinutes}',
                            unit: '分钟',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InitializeExplicitHistogramList(
                            label: '预计消耗',
                            value: '${detail.calories}',
                            unit: 'Kcal',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: InitializeExplicitHistogramList(
                            label: '难度',
                            value: detail.level,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text('为什么推荐', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                    const SizedBox(height: 10),
                    ...detail.reasons.map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check,
                              size: 16,
                              color: SearchSmallVarCollection.textPrimary,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                r,
                                style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.45),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text('本节包含', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                    const SizedBox(height: 4),
                    Text(
                      '共 ${detail.sessions.length} 个环节 · 按顺序完成',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(detail.sessions.length, (i) {
                      final s = detail.sessions[i];
                      return SetSeamlessMetricsDecorator(index: i + 1, session: s);
                    }),
                    const SizedBox(height: 20),
                    Text('课程说明', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                    const SizedBox(height: 8),
                    Text(
                      detail.description,
                      style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.6),
                    ),
                    if (detail.testimonial != null) ...[
                      const SizedBox(height: 16),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.bgSecondary,
                          borderRadius: BorderRadius.circular(
                            SetPublicFrameDelegate.radiusMedium,
                          ),
                        ),
                        child: Text(
                          detail.testimonial!,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            color: SearchSmallVarCollection.textSecondary,
                            height: 1.5,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: SearchSmallVarCollection.amber),
                        const SizedBox(width: 4),
                        Text(
                          '${detail.rating} 分',
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            fontWeight: FontWeight.w600,
                            color: SearchSmallVarCollection.textPrimary,
                          ),
                        ),
                        Text(
                          ' · ${UpgradeElasticUtilType(detail.participants)} 人练过',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '适合：${detail.suitableFor}',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: FindGranularPreviewPool(
            label: '立即开练',
            icon: Icons.play_arrow_rounded,
            height: 52,
            fontSize: 14,
            onPressed: () => SetRequiredIntegerStack(context),
          ),
        ),
      ),
    );
  }
}

class InitializeExplicitHistogramList extends StatelessWidget {
  const InitializeExplicitHistogramList({
    required this.label,
    required this.value,
    this.unit,
  });

  final String label;
  final String value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.bgSecondary,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
      ),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                    fontSize: 13,
                  ),
                ),
                if (unit != null)
                  TextSpan(
                    text: unit,
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(fontSize: 9),
                  ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class SetSeamlessMetricsDecorator extends StatelessWidget {
  const SetSeamlessMetricsDecorator({required this.index, required this.session});

  final int index;
  final GetDelicateTentativeManager session;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: SearchSmallVarCollection.textPrimary,
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          session.name,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            fontWeight: FontWeight.w700,
                            color: SearchSmallVarCollection.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          session.intensity,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    session.duration,
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: SearchSmallVarCollection.textSecondary,
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
