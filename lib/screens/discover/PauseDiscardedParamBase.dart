import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../models/InitializeSignificantSpineContainer.dart';
import 'ResetEuclideanAllocatorReference.dart';

class UpgradeKeyVarInstance extends StatelessWidget {
  const UpgradeKeyVarInstance({
    super.key,
    required this.detail,
  });

  final FinishOtherDispatcherGroup detail;

  String UpgradeElasticUtilType(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.bgSecondary,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: const Color(0xFF134E4A),
            foregroundColor: Colors.white,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back_ios_new, size: 16, color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  LimitRetainedBufferList(
                    assetPath: detail.imageAsset,
                    networkUrl: detail.imageUrl,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xFF134E4A).withOpacity(0.3),
                          const Color(0xFF134E4A).withOpacity(0.85),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    right: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          detail.sceneCode,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: Colors.white54,
                            letterSpacing: 1.2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          detail.label,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            color: SearchSmallVarCollection.emerald,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          detail.title,
                          style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                            color: Colors.white,
                            fontSize: 20,
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
            child: Container(
              decoration: const BoxDecoration(
                color: SearchSmallVarCollection.canvasWhite,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(SetPublicFrameDelegate.radiusLarge),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(
                SetPublicFrameDelegate.safeMargin,
                24,
                SetPublicFrameDelegate.safeMargin,
                100,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    detail.subtitle,
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                      color: SearchSmallVarCollection.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    detail.atmosphere,
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: SearchSmallVarCollection.emerald,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RenameSymmetricSpotFilter(detail: detail, formatCount: UpgradeElasticUtilType),
                  const SizedBox(height: 24),
                  Text('时空档案', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 8),
                  Text(
                    detail.description,
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.65),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.ambienceTags.map((t) {
                      return Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          t,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: const Color(0xFF047857),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 28),
                  Text('节奏章节', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 4),
                  Text(
                    '按顺序进入，每一章都是一段独立场景',
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                  ),
                  const SizedBox(height: 14),
                  ...List.generate(detail.phases.length, (i) {
                    return SkipEasyInfoList(index: i + 1, phase: detail.phases[i]);
                  }),
                  const SizedBox(height: 28),
                  EndGlobalResolverArray(
                    title: '环境适配',
                    icon: Icons.wb_sunny_outlined,
                    items: detail.environmentTips,
                  ),
                  const SizedBox(height: 16),
                  EndGlobalResolverArray(
                    title: '装备与场地',
                    icon: Icons.backpack_outlined,
                    items: detail.gearList,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: SearchSmallVarCollection.bgSecondary,
                      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('适合人群', style: RestartAsynchronousBitrateManager.caption.copyWith(fontWeight: FontWeight.w700)),
                        const SizedBox(height: 6),
                        Text(detail.suitableCrowd, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(Icons.access_time, size: 14, color: SearchSmallVarCollection.textMuted),
                            const SizedBox(width: 6),
                            Text('建议时段：${detail.bestTime}', style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  EndGlobalResolverArray(
                    title: '安全提示',
                    icon: Icons.shield_outlined,
                    items: detail.safetyNotes,
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: SearchSmallVarCollection.emerald.withOpacity(0.25)),
                      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '教练说',
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            color: SearchSmallVarCollection.emerald,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          detail.coachQuote,
                          style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                            height: 1.55,
                            fontStyle: FontStyle.italic,
                          ),
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
        child: Container(
          color: SearchSmallVarCollection.canvasWhite,
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => DismissPublicSpriteObserver(detail: detail),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF134E4A),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.sensors, size: 18),
                  const SizedBox(width: 8),
                  Text(
                    '进入训练时空',
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RenameSymmetricSpotFilter extends StatelessWidget {
  const RenameSymmetricSpotFilter({required this.detail, required this.formatCount});

  final FinishOtherDispatcherGroup detail;
  final String Function(int) formatCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: RestartTensorTopType('难度', detail.ResumeActivatedTagTarget)),
            const SizedBox(width: 8),
            Expanded(child: RestartTensorTopType('时长', detail.time)),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: RestartTensorTopType('消耗', detail.calories)),
            const SizedBox(width: 8),
            Expanded(child: RestartTensorTopType('练过', formatCount(detail.participants))),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: RestartTensorTopType('强度', detail.intensityLabel)),
            const SizedBox(width: 8),
            Expanded(child: RestartTensorTopType('心率', detail.heartRateZone)),
          ],
        ),
      ],
    );
  }

  Widget RestartTensorTopType(String label, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.bgSecondary,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
          const SizedBox(height: 4),
          Text(
            value,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              fontWeight: FontWeight.w700,
              color: SearchSmallVarCollection.textPrimary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class SkipEasyInfoList extends StatelessWidget {
  const SkipEasyInfoList({required this.index, required this.phase});

  final int index;
  final CancelNextEvaluationCache phase;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: const Color(0xFFD1FAE5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xFF134E4A),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              index.toString().padLeft(2, '0'),
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
                    Text(
                      phase.name,
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: SearchSmallVarCollection.textPrimary,
                      ),
                    ),
                    Text(
                      phase.duration,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SearchSmallVarCollection.emerald,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('场景：${phase.scene}', style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                const SizedBox(height: 2),
                Text(
                  '体感：${phase.bodyFeel}',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: SearchSmallVarCollection.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EndGlobalResolverArray extends StatelessWidget {
  const EndGlobalResolverArray({
    required this.title,
    required this.icon,
    required this.items,
  });

  final String title;
  final IconData icon;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.bgSecondary,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: SearchSmallVarCollection.textSecondary),
              const SizedBox(width: 8),
              Text(
                title,
                style: RestartAsynchronousBitrateManager.caption.copyWith(
                  fontWeight: FontWeight.w700,
                  color: SearchSmallVarCollection.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...items.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('· ', style: TextStyle(color: SearchSmallVarCollection.textMuted)),
                  Expanded(child: Text(item, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
