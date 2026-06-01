import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../models/MarkActivatedSceneHelper.dart';

class UpgradePrismaticVariableDelegate extends StatelessWidget {
  const UpgradePrismaticVariableDelegate({
    super.key,
    required this.challenge,
  });

  final SetSubsequentCycleStack challenge;

  String UpgradeElasticUtilType(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final GetNewestValueCache = challenge.GetNewestValueCache;
    final percent = (GetNewestValueCache * 100).round();

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: SearchSmallVarCollection.textPrimary,
        title: Text('挑战详情', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(
          SetPublicFrameDelegate.safeMargin,
          8,
          SetPublicFrameDelegate.safeMargin,
          32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: SearchSmallVarCollection.brandGradientLight,
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusLarge),
                border: Border.all(color: SearchSmallVarCollection.brandStart.withOpacity(0.12)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.brandStart.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.emoji_events,
                          color: SearchSmallVarCollection.brandStart,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              challenge.title,
                              style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(fontSize: 17),
                            ),
                            const SizedBox(height: 4),
                            Text(challenge.subtitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${challenge.currentKm.toStringAsFixed(0)} / ${challenge.targetKm.toStringAsFixed(0)} KM',
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: SearchSmallVarCollection.textPrimary,
                        ),
                      ),
                      Text(
                        '$percent%',
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          color: SearchSmallVarCollection.brandStart,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: GetNewestValueCache,
                      minHeight: 8,
                      backgroundColor: Colors.white,
                      valueColor: const AlwaysStoppedAnimation<Color>(SearchSmallVarCollection.brandStart),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SetPermanentStrengthCache(Icons.schedule, '截止 ${challenge.endDate}'),
                      const SizedBox(width: 8),
                      SetPermanentStrengthCache(
                        Icons.people_outline,
                        '${UpgradeElasticUtilType(challenge.participants)} 人参与',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text('挑战说明', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 8),
            Text(
              challenge.description,
              style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.6),
            ),
            const SizedBox(height: 24),
            Text('里程里程碑', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 12),
            ...challenge.milestones.map((m) => AccelerateAccordionTempleBase(milestone: m)),
            const SizedBox(height: 24),
            Text('完成奖励', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 10),
            ...challenge.rewards.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.card_giftcard, size: 16, color: SearchSmallVarCollection.amber),
                    const SizedBox(width: 8),
                    Expanded(child: Text(r, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text('活动规则', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 10),
            ...challenge.rules.map(
              (r) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('· ', style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
                    Expanded(child: Text(r, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget SetPermanentStrengthCache(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: SearchSmallVarCollection.textMuted),
          const SizedBox(width: 4),
          Text(text, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
        ],
      ),
    );
  }
}

class AccelerateAccordionTempleBase extends StatelessWidget {
  const AccelerateAccordionTempleBase({required this.milestone});
  final PoolPrevLayerHelper milestone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            milestone.unlocked ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 20,
            color: milestone.unlocked ? SearchSmallVarCollection.emerald : SearchSmallVarCollection.textMuted,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${milestone.distanceKm.toStringAsFixed(0)} KM',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                  ),
                ),
                Text(milestone.reward, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
              ],
            ),
          ),
          if (milestone.unlocked)
            Text(
              '已达成',
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                color: SearchSmallVarCollection.emerald,
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }
}
