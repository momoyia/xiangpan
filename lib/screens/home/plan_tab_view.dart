import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../data/mock_data.dart';
import '../../models/fitness_plan_item.dart';
import '../../models/workout_session_result.dart';
import 'fitness_plan_detail_page.dart';
import 'hot_plan_detail_page.dart';

class PlanTabView extends StatefulWidget {
  const PlanTabView({
    super.key,
    this.userName = '欢快的番茄',
    this.onWorkoutComplete,
  });

  final String userName;
  final ValueChanged<WorkoutSessionResult>? onWorkoutComplete;

  @override
  State<PlanTabView> createState() => _PlanTabViewState();
}

class _PlanTabViewState extends State<PlanTabView> {
  int _filterIndex = 0;

  FeaturedFitnessPlan get _featured => MockData.featuredPlan(widget.userName);

  List<FitnessPlanCard> get _listPlans {
    final all = MockData.fitnessPlanCards;
    if (_filterIndex == 1) {
      return all.where((p) => p.isSmartCustom).toList();
    }
    return all;
  }

  void _openDetail(BuildContext context, String id) {
    final detail = MockData.fitnessPlanDetail(
      id,
      userName: widget.userName,
    );
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => FitnessPlanDetailPage(
          detail: detail,
          onWorkoutComplete: widget.onWorkoutComplete,
        ),
      ),
    );
  }

  void _openHotDetail(BuildContext context, String id) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => HotPlanDetailPage(
          detail: MockData.hotPlanDetail(id),
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
        _FeaturedPlanHero(
          plan: _featured,
          onTap: () => _openDetail(context, 'featured'),
        ),
        const SizedBox(height: 24),
        Text('热门推荐', style: AppTextStyles.h2),
        const SizedBox(height: 12),
        SizedBox(
          height: 168,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: MockData.hotPlanRecommends.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              return _HotRecommendCard(
                item: MockData.hotPlanRecommends[i],
                onTap: () => _openHotDetail(
                  context,
                  MockData.hotPlanRecommends[i].id,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        _FilterPills(
          selectedIndex: _filterIndex,
          onChanged: (i) => setState(() => _filterIndex = i),
        ),
        const SizedBox(height: 16),
        ..._listPlans.map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: _PlanListCard(
                plan: p,
                onTap: () => _openDetail(context, p.id),
              ),
            )),
      ],
    );
  }
}

class _FeaturedPlanHero extends StatelessWidget {
  const _FeaturedPlanHero({
    required this.plan,
    required this.onTap,
  });

  final FeaturedFitnessPlan plan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
      borderRadius: BorderRadius.circular(AppConstants.radiusLarge),
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(
              assetPath: plan.imageAsset,
              networkUrl: plan.imageUrl,
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
                    plan.title,
                    style: AppTextStyles.h2.copyWith(
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
                    plan.subtitle,
                    style: AppTextStyles.caption.copyWith(
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

class _HotRecommendCard extends StatelessWidget {
  const _HotRecommendCard({
    required this.item,
    required this.onTap,
  });

  final HotPlanRecommend item;
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
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    AppImage(
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
                          style: AppTextStyles.captionSmall.copyWith(
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
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              item.subtitle,
              style: AppTextStyles.captionSmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterPills extends StatelessWidget {
  const _FilterPills({
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
                color: active ? AppColors.textPrimary : AppColors.bgSecondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                _labels[i],
                style: AppTextStyles.caption.copyWith(
                  color: active ? Colors.white : AppColors.textSecondary,
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

class _PlanListCard extends StatelessWidget {
  const _PlanListCard({
    required this.plan,
    required this.onTap,
  });

  final FitnessPlanCard plan;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          boxShadow: AppColors.cardShadow,
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AppImage(
              assetPath: plan.imageAsset,
              networkUrl: plan.imageUrl,
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
                  if (plan.isSmartCustom)
                    const Row(
                      children: [
                        _BadgeChip(
                          label: '智能定制',
                          bgColor: AppColors.emerald,
                        ),
                      ],
                    ),
                  const Spacer(),
                  Text(
                    plan.title,
                    style: AppTextStyles.h2.copyWith(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    plan.description,
                    style: AppTextStyles.captionSmall.copyWith(
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

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({
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
            style: AppTextStyles.captionSmall.copyWith(
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
