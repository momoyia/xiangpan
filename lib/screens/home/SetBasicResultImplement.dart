import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/LimitAdvancedButtonList.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'GetSemanticMetricsGroup.dart';
import 'GetConcreteMechanismType.dart';

class SetCrucialTolerancePool extends StatefulWidget {
  const SetCrucialTolerancePool({
    super.key,
    this.userName = '欢快的番茄',
    this.onWorkoutComplete,
  });

  final String userName;
  final ValueChanged<ExecuteStaticTempleDelegate>? onWorkoutComplete;

  @override
  State<SetCrucialTolerancePool> createState() => SetLostLogTarget();
}

class SetLostLogTarget extends State<SetCrucialTolerancePool> {
  int _filterIndex = 0;

  EscalateExplicitLatencyManager get CancelHierarchicalVarPool => ReducePermanentHeadAdapter.ContinueSmartChallengeBase(widget.userName);

  List<NavigateDisparateRowPool> get AssociateConcurrentTentativeStack {
    final all = ReducePermanentHeadAdapter.SkipDifficultParamDelegate;
    if (_filterIndex == 1) {
      return all.where((p) => p.isSmartCustom).toList();
    }
    return all;
  }

  void AddConcurrentBoundFactory(BuildContext context, String id) {
    final detail = ReducePermanentHeadAdapter.DecoupleIndependentMapCache(
      id,
      userName: widget.userName,
    );
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => GetFirstHashList(
          detail: detail,
          onWorkoutComplete: widget.onWorkoutComplete,
        ),
      ),
    );
  }

  void RectifyAsynchronousTempleContainer(BuildContext context, String id) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => SetEnabledNumberCache(
          detail: ReducePermanentHeadAdapter.SetSustainableIndexDelegate(id),
          onWorkoutComplete: widget.onWorkoutComplete,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SetEnabledParameterProtocol(
          DisplayHyperbolicTrianglesFilter: CancelHierarchicalVarPool,
          onTap: () => AddConcurrentBoundFactory(context, 'featured'),
        ),
        const SizedBox(height: 24),
        Text('热门推荐', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        const SizedBox(height: 12),
        SizedBox(
          height: 168,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: ReducePermanentHeadAdapter.CancelKeySpineReference.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              return SetGlobalVisibleHandler(
                item: ReducePermanentHeadAdapter.CancelKeySpineReference[i],
                onTap: () => RectifyAsynchronousTempleContainer(
                  context,
                  ReducePermanentHeadAdapter.CancelKeySpineReference[i].id,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        SetSubstantialParameterCollection(
          selectedIndex: _filterIndex,
          onChanged: (i) => setState(() => _filterIndex = i),
        ),
        const SizedBox(height: 16),
        ...AssociateConcurrentTentativeStack.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: SetStandaloneAxisExtension(
                DisplayHyperbolicTrianglesFilter: p,
                onTap: () => AddConcurrentBoundFactory(context, p.id),
              ),
            )),
      ],
    );
  }
}

class SetEnabledParameterProtocol extends StatelessWidget {
  const SetEnabledParameterProtocol({
    required this.DisplayHyperbolicTrianglesFilter,
    required this.onTap,
  });

  final EscalateExplicitLatencyManager DisplayHyperbolicTrianglesFilter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusLarge),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            LimitRetainedBufferList(
              assetPath: DisplayHyperbolicTrianglesFilter.imageAsset,
              networkUrl: DisplayHyperbolicTrianglesFilter.imageUrl,
              fit: BoxFit.cover,
            ),
            ColoredBox(color: Colors.black.withOpacity(0.1)),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    DisplayHyperbolicTrianglesFilter.title,
                    style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      height: 1.3,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.35),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    DisplayHyperbolicTrianglesFilter.subtitle,
                    style: RestartAsynchronousBitrateManager.caption.copyWith(
                      color: Colors.white.withOpacity(0.92),
                      height: 1.4,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 4,
                        ),
                      ],
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
    );
  }
}

class SetGlobalVisibleHandler extends StatelessWidget {
  const SetGlobalVisibleHandler({
    required this.item,
    required this.onTap,
  });

  final SkipSynchronousQueueBase item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final badgeColor = Color(item.badgeColor);
    return SizedBox(
      width: 120,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    LimitRetainedBufferList(
                      assetPath: item.imageAsset,
                      networkUrl: item.imageUrl,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          item.badge,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item.title,
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: SearchSmallVarCollection.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              item.subtitle,
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class SetSubstantialParameterCollection extends StatelessWidget {
  const SetSubstantialParameterCollection({
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const _labels = ['全部', '智能定制计划'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_labels.length, (i) {
        final active = i == selectedIndex;
        return Padding(
          padding: EdgeInsets.only(right: i == 0 ? 10 : 0),
          child: GestureDetector(
            onTap: () => onChanged(i),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: active ? SearchSmallVarCollection.textPrimary : SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _labels[i],
                style: RestartAsynchronousBitrateManager.caption.copyWith(
                  color: active ? Colors.white : SearchSmallVarCollection.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

class SetStandaloneAxisExtension extends StatelessWidget {
  const SetStandaloneAxisExtension({
    required this.DisplayHyperbolicTrianglesFilter,
    required this.onTap,
  });

  final NavigateDisparateRowPool DisplayHyperbolicTrianglesFilter;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
          boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            LimitRetainedBufferList(
              assetPath: DisplayHyperbolicTrianglesFilter.imageAsset,
              networkUrl: DisplayHyperbolicTrianglesFilter.imageUrl,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(0.65),
                    Colors.black.withOpacity(0.2),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (DisplayHyperbolicTrianglesFilter.isSmartCustom)
                    const Row(
                      children: [
                        SkipRetainedCompositionContainer(
                          label: '智能定制',
                          bgColor: SearchSmallVarCollection.emerald,
                        ),
                      ],
                    ),
                  const Spacer(),
                  Text(
                    DisplayHyperbolicTrianglesFilter.title,
                    style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DisplayHyperbolicTrianglesFilter.description,
                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: Colors.white.withOpacity(0.85),
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
    );
  }
}

class SkipRetainedCompositionContainer extends StatelessWidget {
  const SkipRetainedCompositionContainer({
    required this.label,
    this.icon,
    required this.bgColor,
  });

  final String label;
  final IconData? icon;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 10, color: Colors.white),
            const SizedBox(width: 2),
          ],
          Text(
            label,
            style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
              color: Colors.white,
              fontSize: 8,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
