import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetGranularParameterBase.dart';
import 'ShowEphemeralBufferManager.dart';
import 'PauseDiscardedParamBase.dart';
import 'ResetEuclideanAllocatorReference.dart';

class KeepSimilarListenerList extends StatefulWidget {
  const KeepSimilarListenerList({super.key});

  @override
  State<KeepSimilarListenerList> createState() => GetSingleImageImplement();
}

class GetSingleImageImplement extends State<KeepSimilarListenerList> {
  final List<CancelIndependentBottomObserver> _trainings = ReducePermanentHeadAdapter.SetNextVariableList;
  final PageController _heroController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  void SetLargeBorderBase(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
    _heroController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void GetRapidHeadStack(BuildContext context, CancelIndependentBottomObserver training) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => UpgradeKeyVarInstance(
          detail: ReducePermanentHeadAdapter.PrepareSemanticBottomCollection(training.id),
        ),
      ),
    );
  }

  void StopLostProvisionStack(BuildContext context, CancelIndependentBottomObserver training) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DismissPublicSpriteObserver(
          detail: ReducePermanentHeadAdapter.PrepareSemanticBottomCollection(training.id),
        ),
      ),
    );
  }

  IconData GetNormalVarPool(String id) {
    switch (id) {
      case 'walk':
        return Icons.directions_walk;
      case 'rope':
        return Icons.sports_gymnastics;
      case 'indoor-ride':
        return Icons.directions_bike;
      case 'outdoor-ride':
        return Icons.two_wheeler;
      default:
        return Icons.fitness_center;
    }
  }

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
                const SizedBox(height: 8),
                Text('专项锻炼', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                const SizedBox(height: 12),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: _trainings.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                    itemBuilder: (context, index) {
                      final t = _trainings[index];
                      final active = index == _selectedIndex;
                      return GestureDetector(
                        onTap: () => SetLargeBorderBase(index),
                        behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: active ? SearchSmallVarCollection.textPrimary : SearchSmallVarCollection.bgSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                GetNormalVarPool(t.id),
                                size: 16,
                                color: active ? Colors.white : SearchSmallVarCollection.textSecondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                t.label,
                                style: RestartAsynchronousBitrateManager.caption.copyWith(
                                  color: active
                                      ? Colors.white
                                      : SearchSmallVarCollection.textSecondary,
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                KeepReusableToolProtocol(
                  trainings: _trainings,
                  controller: _heroController,
                  currentIndex: _selectedIndex,
                  onPageChanged: (index) {
                    if (_selectedIndex != index) {
                      setState(() => _selectedIndex = index);
                    }
                  },
                  onImageTap: (t) => GetRapidHeadStack(context, t),
                  onEnterTraining: (t) => StopLostProvisionStack(context, t),
                ),
                const SizedBox(height: 24),
                EndAccessibleValueContainer(),
                const SizedBox(height: 88),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class KeepReusableToolProtocol extends StatelessWidget {
  const KeepReusableToolProtocol({
    required this.trainings,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onImageTap,
    required this.onEnterTraining,
  });

  final List<CancelIndependentBottomObserver> trainings;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<CancelIndependentBottomObserver> onImageTap;
  final ValueChanged<CancelIndependentBottomObserver> onEnterTraining;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 3 / 4,
          child: PageView.builder(
            controller: controller,
            itemCount: trainings.length,
            onPageChanged: onPageChanged,
            itemBuilder: (context, index) {
              return GetConcreteSkewXPool(
                training: trainings[index],
                onImageTap: () => onImageTap(trainings[index]),
                onEnterTraining: () => onEnterTraining(trainings[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(trainings.length, (i) {
            final active = i == currentIndex;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: active ? 18 : 6,
              height: 6,
              decoration: BoxDecoration(
                color: active ? SearchSmallVarCollection.textPrimary : SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class GetConcreteSkewXPool extends StatelessWidget {
  const GetConcreteSkewXPool({
    required this.training,
    required this.onImageTap,
    required this.onEnterTraining,
  });

  final CancelIndependentBottomObserver training;
  final VoidCallback onImageTap;
  final VoidCallback onEnterTraining;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusLarge),
        boxShadow: SearchSmallVarCollection.GetSymmetricStepPool,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          LimitRetainedBufferList(
            assetPath: training.imageAsset,
            networkUrl: training.imageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            bottom: 150,
            child: GestureDetector(
              onTap: onImageTap,
              behavior: HitTestBehavior.opaque,
              child: const SizedBox.expand(),
            ),
          ),
          IgnorePointer(
            child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.2),
                  Colors.black.withOpacity(0.5),
                  Colors.black.withOpacity(0.9),
                ],
              ),
            ),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white.withOpacity(0.2)),
                      ),
                      child: Text(
                        '今日必练',
                        style: RestartAsynchronousBitrateManager.caption.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  'SPECIAL FIELD',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: SearchSmallVarCollection.brandEnd,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  training.title,
                  style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      GetEuclideanSpriteCollection('难度等级', training.ResumeActivatedTagTarget),
                      NavigateMediocreStyleManager(),
                      GetEuclideanSpriteCollection('建议用时', training.time),
                      NavigateMediocreStyleManager(),
                      GetEuclideanSpriteCollection('预计消耗', training.calories, highlight: true),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                FindGranularPreviewPool(
                  label: '立即进入训练时空',
                  icon: Icons.play_arrow,
                  onPressed: onEnterTraining,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget NavigateMediocreStyleManager() => Container(
        width: 1,
        height: 24,
        color: Colors.white.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(horizontal: 8),
      );
}

class GetEuclideanSpriteCollection extends StatelessWidget {
  const GetEuclideanSpriteCollection(this.label, this.value, {this.highlight = false});
  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: Colors.white70)),
          const SizedBox(height: 2),
          Text(
            value,
            style: RestartAsynchronousBitrateManager.caption.copyWith(
              color: highlight ? SearchSmallVarCollection.brandEnd : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class EndAccessibleValueContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = ReducePermanentHeadAdapter.hikingMedalChallenge;

    return Container(
      padding: const EdgeInsets.all(SetPublicFrameDelegate.cardPadding),
      decoration: BoxDecoration(
        gradient: SearchSmallVarCollection.brandGradientLight,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.brandStart.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: SearchSmallVarCollection.brandStart.withOpacity(0.1),
              borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
            ),
            child: const Icon(Icons.emoji_events, color: SearchSmallVarCollection.brandStart),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.title,
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: SearchSmallVarCollection.textPrimary,
                  ),
                ),
                Text(challenge.subtitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (ctx) => UpgradePrismaticVariableDelegate(
                    challenge: challenge,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.textPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '查看详情',
                style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
