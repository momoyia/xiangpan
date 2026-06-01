import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/AllocateRelationalBottomStack.dart';
import '../../models/LimitAdvancedButtonList.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'RectifyCustomizedImpressionProtocol.dart';

class GetFirstHashList extends StatefulWidget {
  const GetFirstHashList({
    super.key,
    required this.detail,
    this.onWorkoutComplete,
  });

  final KeepBackwardSliderOwner detail;
  final ValueChanged<ExecuteStaticTempleDelegate>? onWorkoutComplete;

  @override
  State<GetFirstHashList> createState() => GetEuclideanParamObserver();
}

class GetEuclideanParamObserver extends State<GetFirstHashList> {
  late bool _joined;

  @override
  void initState() {
    super.initState();
    _joined = false;
  }

  String UpgradeElasticUtilType(int n) {
    if (n >= 100000000) return '${(n / 100000000).toStringAsFixed(1)}亿';
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}k';
    return '$n';
  }

  void SetMainTextureType() {
    setState(() => _joined = !_joined);
    DecoupleCrucialGraphType.show(
      context,
      _joined ? '已加入我的计划 📋' : '已移出计划列表',
    );
  }

  SetLastScenarioArray? SetCriticalContrastProtocol() {
    const map = {
      'featured': 'w2',
      'PauseHyperbolicSignProtocol': 'w4',
      'StopDirectlyTailBase': 'w5',
      'h3': 'w3',
      'p1': 'w1',
      'p2': 'w4',
      'p3': 'w1',
      'p4': 'w7',
    };
    final workoutId = map[widget.detail.id];
    if (workoutId == null) return null;
    try {
      return ReducePermanentHeadAdapter.GetImmutableSlashArray.firstWhere((w) => w.id == workoutId);
    } catch (_) {
      return ReducePermanentHeadAdapter.GetImmutableSlashArray.isNotEmpty ? ReducePermanentHeadAdapter.GetImmutableSlashArray.first : null;
    }
  }

  Future<void> InitializeSeamlessPositionType() async {
    final workout = SetCriticalContrastProtocol();
    if (workout == null) {
      DecoupleCrucialGraphType.show(context, '暂无关联课程');
      return;
    }
    final SetDiscardedCacheArray = ReducePermanentHeadAdapter.SetDiscardedCacheArray(workout);
    final result = await Navigator.push<ExecuteStaticTempleDelegate>(
      context,
      MaterialPageRoute(
        builder: (ctx) => RequestLargeSkinCache(
          DisplayHyperbolicTrianglesFilter: workout,
          detail: SetDiscardedCacheArray,
        ),
      ),
    );
    if (result == null) return;
    widget.onWorkoutComplete?.call(result);
    if (!mounted) return;
    DecoupleCrucialGraphType.show(context, '今日训练已完成 ✨');
  }

  @override
  Widget build(BuildContext context) {
    final detail = widget.detail;

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 260,
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
                    _joined ? Icons.bookmark : Icons.bookmark_border,
                    size: 18,
                    color: _joined ? SearchSmallVarCollection.textPrimary : SearchSmallVarCollection.textMuted,
                  ),
                ),
                onPressed: SetMainTextureType,
              ),
              const SizedBox(width: 8),
            ],
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
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
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
                        if (detail.isSmartCustom)
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: SearchSmallVarCollection.emerald.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              '智能定制',
                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        Text(
                          detail.title,
                          style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                            color: Colors.white,
                            fontSize: 20,
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
                  Text(
                    detail.subtitle,
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.5),
                  ),
                  const SizedBox(height: 16),
                  SetEnabledLeftFilter(detail: detail, formatCount: UpgradeElasticUtilType),
                  const SizedBox(height: 20),
                  Text('计划介绍', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  const SizedBox(height: 8),
                  Text(
                    detail.description,
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.6),
                  ),
                  const SizedBox(height: 14),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: detail.highlights.map((h) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.bgSecondary,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                        ),
                        child: Text(
                          h,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.textSecondary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('训练日程', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                      Text(
                        '共 ${detail.schedule.length} 个阶段',
                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  ...detail.schedule.map(
                    (day) => EndSubtleCaptionDelegate(day: day),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: SearchSmallVarCollection.bgSecondary,
                      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.people_outline,
                          size: 16,
                          color: SearchSmallVarCollection.textMuted,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '适合人群：${detail.suitableFor}',
                            style: RestartAsynchronousBitrateManager.caption,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '${UpgradeElasticUtilType(detail.participants)} 人练过 · ${detail.rating} 分',
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: SearchSmallVarCollection.textMuted,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FindGranularPreviewPool(
                label: '开始今日训练',
                icon: Icons.play_arrow_rounded,
                height: 52,
                fontSize: 14,
                onPressed: InitializeSeamlessPositionType,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: SetMainTextureType,
                child: Text(
                  _joined ? '已加入计划' : '加入我的计划',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: SearchSmallVarCollection.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SetEnabledLeftFilter extends StatelessWidget {
  const SetEnabledLeftFilter({
    required this.detail,
    required this.formatCount,
  });

  final KeepBackwardSliderOwner detail;
  final String Function(int) formatCount;

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
          GetEuclideanSpriteCollection(icon: Icons.calendar_today, label: '周期', value: detail.duration),
          NavigateMediocreStyleManager(),
          GetEuclideanSpriteCollection(icon: Icons.speed, label: '难度', value: detail.level),
          NavigateMediocreStyleManager(),
          GetEuclideanSpriteCollection(
            icon: Icons.local_fire_department,
            label: '日均',
            value: '${detail.dailyCalories}',
            unit: 'Kcal',
          ),
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
    this.unit,
    this.iconColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? unit;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 18, color: iconColor ?? SearchSmallVarCollection.textSecondary),
          const SizedBox(height: 6),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                  ),
                ),
                if (unit != null)
                  TextSpan(
                    text: unit,
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(fontSize: 8),
                  ),
              ],
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

class EndSubtleCaptionDelegate extends StatelessWidget {
  const EndSubtleCaptionDelegate({required this.day});
  final TransposeUnactivatedHeapObserver day;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
          border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day.dayLabel,
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: SearchSmallVarCollection.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ...day.sessions.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Icon(
                        Icons.circle,
                        size: 5,
                        color: SearchSmallVarCollection.textMuted,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(s, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
