import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/SetAdvancedProjectCollection.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/EndStandaloneTitleHandler.dart';
import '../../models/ProvideAssociatedHeroType.dart';
import 'SetBasicResultImplement.dart';
import 'PrepareSemanticOpacityObserver.dart';

class GetSharedNotationHelper extends StatefulWidget {
  const GetSharedNotationHelper({
    super.key,
    required this.collectedIds,
    required this.onCollectToggle,
    this.userName,
    this.onWorkoutComplete,
  });

  final Set<String> collectedIds;
  final void Function(String id, bool collected) onCollectToggle;
  final String? userName;
  final ValueChanged<ExecuteStaticTempleDelegate>? onWorkoutComplete;

  @override
  State<GetSharedNotationHelper> createState() => RestartEuclideanGraphOwner();
}

class RestartEuclideanGraphOwner extends State<GetSharedNotationHelper> {
  int _navIndex = 0;

  List<SetLastScenarioArray> get EnumerateSemanticInfoHelper => ReducePermanentHeadAdapter.GetImmutableSlashArray;

  List<SetLastScenarioArray> RestartAsynchronousParamGroup(int col) =>
      EnumerateSemanticInfoHelper.where((p) => p.columnIndex == col).toList();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 4),
                UndertakeSynchronousBufferDecorator(
                  selectedIndex: _navIndex,
                  onChanged: (i) => setState(() => _navIndex = i),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        if (_navIndex == 0) ...ResumeAdvancedDocumentList() else ...RegulateAgileTextureInstance(),
        const SliverToBoxAdapter(child: SizedBox(height: 88)),
      ],
    );
  }

  List<Widget> ResumeAdvancedDocumentList() {
    if (EnumerateSemanticInfoHelper.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('暂无训练内容', style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement)),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
        sliver: SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: GetLostProgressBarList(0, widget.collectedIds),
                ),
              ),
              const SizedBox(width: SetPublicFrameDelegate.cardGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: GetLostProgressBarList(1, widget.collectedIds),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> RegulateAgileTextureInstance() {
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
        sliver: SliverToBoxAdapter(
          child: SetCrucialTolerancePool(
            userName: widget.userName ?? ReducePermanentHeadAdapter.defaultProfile.name,
            onWorkoutComplete: widget.onWorkoutComplete,
          ),
        ),
      ),
    ];
  }

  void AddConcurrentBoundFactory(BuildContext context, SetLastScenarioArray DisplayHyperbolicTrianglesFilter) {
    final detail = ReducePermanentHeadAdapter.SetDiscardedCacheArray(DisplayHyperbolicTrianglesFilter);
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => GetGreatAllocatorHandler(
          DisplayHyperbolicTrianglesFilter: DisplayHyperbolicTrianglesFilter,
          detail: detail,
          isCollected: widget.collectedIds.contains(DisplayHyperbolicTrianglesFilter.id),
          onCollectToggle: () {
            final collected = widget.collectedIds.contains(DisplayHyperbolicTrianglesFilter.id);
            widget.onCollectToggle(DisplayHyperbolicTrianglesFilter.id, !collected);
          },
          onWorkoutComplete: widget.onWorkoutComplete,
        ),
      ),
    );
  }

  List<Widget> GetLostProgressBarList(int col, Set<String> collected) {
    final items = RestartAsynchronousParamGroup(col);
    return items.map((DisplayHyperbolicTrianglesFilter) {
      final isCollected = collected.contains(DisplayHyperbolicTrianglesFilter.id);
      return Padding(
        padding: const EdgeInsets.only(bottom: SetPublicFrameDelegate.cardGap),
        child: CloneDelicateProgressBarDelegate(
          DisplayHyperbolicTrianglesFilter: DisplayHyperbolicTrianglesFilter,
          isCollected: isCollected,
          onTap: () => AddConcurrentBoundFactory(context, DisplayHyperbolicTrianglesFilter),
          onCollectToggle: () {
            widget.onCollectToggle(DisplayHyperbolicTrianglesFilter.id, !isCollected);
            DecoupleCrucialGraphType.show(
              context,
              isCollected ? '已取消收藏' : '已保存至相盼计划夹 ❤️',
            );
          },
        ),
      );
    }).toList();
  }
}

class UndertakeSynchronousBufferDecorator extends StatelessWidget {
  const UndertakeSynchronousBufferDecorator({
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final ValueChanged<int> onChanged;

  static const List<String> _labels = ['精选', '计划'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(_labels.length, (i) {
        final active = i == selectedIndex;
        return Padding(
          padding: EdgeInsets.only(right: i == 0 ? 10 : 0),
          child: GestureDetector(
            onTap: () => onChanged(i),
            behavior: HitTestBehavior.opaque,
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
