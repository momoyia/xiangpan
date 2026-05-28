import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/discover_training.dart';
import 'achievement_challenge_detail_page.dart';
import 'discover_training_detail_page.dart';
import 'discover_training_launch_page.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<DiscoverTraining> _trainings = MockData.discoverTrainings;
  final PageController _heroController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  void _selectTab(int index) {
    if (_selectedIndex == index) return;
    setState(() => _selectedIndex = index);
    _heroController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _openTrainingDetail(BuildContext context, DiscoverTraining training) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DiscoverTrainingDetailPage(
          detail: MockData.discoverTrainingDetail(training.id),
        ),
      ),
    );
  }

  void _openTrainingLaunch(BuildContext context, DiscoverTraining training) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DiscoverTrainingLaunchPage(
          detail: MockData.discoverTrainingDetail(training.id),
        ),
      ),
    );
  }

  IconData _tabIcon(String id) {
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
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text('专项锻炼', style: AppTextStyles.h2),
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
                        onTap: () => _selectTab(index),
                        behavior: HitTestBehavior.opaque,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          curve: Curves.easeInOut,
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: active ? AppColors.textPrimary : AppColors.bgSecondary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                _tabIcon(t.id),
                                size: 16,
                                color: active ? Colors.white : AppColors.textSecondary,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                t.label,
                                style: AppTextStyles.caption.copyWith(
                                  color: active
                                      ? Colors.white
                                      : AppColors.textSecondary,
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
                _DiscoverHeroCarousel(
                  trainings: _trainings,
                  controller: _heroController,
                  currentIndex: _selectedIndex,
                  onPageChanged: (index) {
                    if (_selectedIndex != index) {
                      setState(() => _selectedIndex = index);
                    }
                  },
                  onImageTap: (t) => _openTrainingDetail(context, t),
                  onEnterTraining: (t) => _openTrainingLaunch(context, t),
                ),
                const SizedBox(height: 24),
                _AchievementBanner(),
                const SizedBox(height: 88),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DiscoverHeroCarousel extends StatelessWidget {
  const _DiscoverHeroCarousel({
    required this.trainings,
    required this.controller,
    required this.currentIndex,
    required this.onPageChanged,
    required this.onImageTap,
    required this.onEnterTraining,
  });

  final List<DiscoverTraining> trainings;
  final PageController controller;
  final int currentIndex;
  final ValueChanged<int> onPageChanged;
  final ValueChanged<DiscoverTraining> onImageTap;
  final ValueChanged<DiscoverTraining> onEnterTraining;

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
              return _HeroCard(
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
                color: active ? AppColors.textPrimary : AppColors.bgSecondary,
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.training,
    required this.onImageTap,
    required this.onEnterTraining,
  });

  final DiscoverTraining training;
  final VoidCallback onImageTap;
  final VoidCallback onEnterTraining;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
        boxShadow: AppColors.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppImage(
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
                        style: AppTextStyles.caption.copyWith(
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
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.brandEnd,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  training.title,
                  style: AppTextStyles.h1.copyWith(
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
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(color: Colors.white.withOpacity(0.1)),
                  ),
                  child: Row(
                    children: [
                      _StatCell('难度等级', training.starsDisplay),
                      _divider(),
                      _StatCell('建议用时', training.time),
                      _divider(),
                      _StatCell('预计消耗', training.calories, highlight: true),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                GradientButton(
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

  Widget _divider() => Container(
        width: 1,
        height: 24,
        color: Colors.white.withOpacity(0.2),
        margin: const EdgeInsets.symmetric(horizontal: 8),
      );
}

class _StatCell extends StatelessWidget {
  const _StatCell(this.label, this.value, {this.highlight = false});
  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: AppTextStyles.captionSmall.copyWith(color: Colors.white70)),
          const SizedBox(height: 2),
          Text(
            value,
            style: AppTextStyles.caption.copyWith(
              color: highlight ? AppColors.brandEnd : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _AchievementBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final challenge = MockData.hikingMedalChallenge;

    return Container(
      padding: const EdgeInsets.all(AppConstants.cardPadding),
      decoration: BoxDecoration(
        gradient: AppColors.brandGradientLight,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.brandStart.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.brandStart.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: const Icon(Icons.emoji_events, color: AppColors.brandStart),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge.title,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(challenge.subtitle, style: AppTextStyles.captionSmall),
              ],
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(
                  builder: (ctx) => AchievementChallengeDetailPage(
                    challenge: challenge,
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.textPrimary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                '查看详情',
                style: AppTextStyles.captionSmall.copyWith(
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
