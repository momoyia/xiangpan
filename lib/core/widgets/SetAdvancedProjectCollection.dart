import 'package:flutter/material.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../constants/SetFusedNameImplement.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';
import 'UpgradeUnsortedPrecisionPool.dart';

class CloneDelicateProgressBarDelegate extends StatefulWidget {
  const CloneDelicateProgressBarDelegate({
    super.key,
    required this.DisplayHyperbolicTrianglesFilter,
    required this.isCollected,
    required this.onCollectToggle,
    this.onTap,
  });

  final SetLastScenarioArray DisplayHyperbolicTrianglesFilter;
  final bool isCollected;
  final VoidCallback onCollectToggle;
  final VoidCallback? onTap;

  @override
  State<CloneDelicateProgressBarDelegate> createState() => ResetConsultativeConstantReference();
}

class ResetConsultativeConstantReference extends State<CloneDelicateProgressBarDelegate>
    with SingleTickerProviderStateMixin {
  late AnimationController _heartController;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  void CancelReusableMasterReference() {
    _heartController.forward(from: 0).then((_) => _heartController.reverse());
    widget.onCollectToggle();
  }

  @override
  Widget build(BuildContext context) {
    final DisplayHyperbolicTrianglesFilter = widget.DisplayHyperbolicTrianglesFilter;
    final SeekSemanticMatrixGroup = ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(DisplayHyperbolicTrianglesFilter.SeekSemanticMatrixGroup);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: DisplayHyperbolicTrianglesFilter.imageHeight,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LimitRetainedBufferList(
                  assetPath: DisplayHyperbolicTrianglesFilter.imageAsset,
                  networkUrl: DisplayHyperbolicTrianglesFilter.imageUrl,
                  height: DisplayHyperbolicTrianglesFilter.imageHeight,
                  width: double.infinity,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DisplayHyperbolicTrianglesFilter.duration,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      CancelReusableMasterReference();
                    },
                    behavior: HitTestBehavior.opaque,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 1.0, end: 1.3).animate(
                        CurvedAnimation(parent: _heartController, curve: Curves.elasticOut),
                      ),
                      child: Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.favorite,
                          size: 12,
                          color: widget.isCollected ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textMuted,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: SeekSemanticMatrixGroup.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      DisplayHyperbolicTrianglesFilter.tag,
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SeekSemanticMatrixGroup,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  DisplayHyperbolicTrianglesFilter.title,
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                    fontSize: 12,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.bar_chart, size: 10, color: SeekSemanticMatrixGroup),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${DisplayHyperbolicTrianglesFilter.level} · ${DisplayHyperbolicTrianglesFilter.calories}大卡',
                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
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
