import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../models/workout_plan.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'app_image.dart';

class WorkoutWaterfallCard extends StatefulWidget {
  const WorkoutWaterfallCard({
    super.key,
    required this.plan,
    required this.isCollected,
    required this.onCollectToggle,
    this.onTap,
  });

  final WorkoutPlan plan;
  final bool isCollected;
  final VoidCallback onCollectToggle;
  final VoidCallback? onTap;

  @override
  State<WorkoutWaterfallCard> createState() => _WorkoutWaterfallCardState();
}

class _WorkoutWaterfallCardState extends State<WorkoutWaterfallCard>
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

  void _onHeartTap() {
    _heartController.forward(from: 0).then((_) => _heartController.reverse());
    widget.onCollectToggle();
  }

  @override
  Widget build(BuildContext context) {
    final plan = widget.plan;
    final tagColor = MockData.tagColor(plan.tagColor);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
        boxShadow: AppColors.cardShadow,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: plan.imageHeight,
            width: double.infinity,
            child: Stack(
              fit: StackFit.expand,
              children: [
                AppImage(
                  assetPath: plan.imageAsset,
                  networkUrl: plan.imageUrl,
                  height: plan.imageHeight,
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
                      plan.duration,
                      style: AppTextStyles.captionSmall.copyWith(color: Colors.white),
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
                      _onHeartTap();
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
                          color: widget.isCollected ? AppColors.rose : AppColors.textMuted,
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
                      color: tagColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      plan.tag,
                      style: AppTextStyles.captionSmall.copyWith(
                        color: tagColor,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  plan.title,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    fontSize: 12,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.bar_chart, size: 10, color: tagColor),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        '${plan.level} · ${plan.calories}大卡',
                        style: AppTextStyles.captionSmall,
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
