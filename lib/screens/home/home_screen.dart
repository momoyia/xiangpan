import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/workout_waterfall_card.dart';
import '../../data/mock_data.dart';
import '../../models/workout_plan.dart';
import '../../models/workout_session_result.dart';
import 'plan_tab_view.dart';
import 'workout_detail_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.collectedIds,
    required this.onCollectToggle,
    this.userName,
    this.onWorkoutComplete,
  });

  final Set<String> collectedIds;
  final void Function(String id, bool collected) onCollectToggle;
  final String? userName;
  final ValueChanged<WorkoutSessionResult>? onWorkoutComplete;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _navIndex = 0;

  List<WorkoutPlan> get _featuredPlans => MockData.homeWorkouts;

  List<WorkoutPlan> _columnPlans(int col) =>
      _featuredPlans.where((p) => p.columnIndex == col).toList();

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
                const SizedBox(height: 4),
                _HomeTextNav(
                  selectedIndex: _navIndex,
                  onChanged: (i) => setState(() => _navIndex = i),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        if (_navIndex == 0) ..._buildFeaturedSlivers() else ..._buildPlanSlivers(),
        const SliverToBoxAdapter(child: SizedBox(height: 88)),
      ],
    );
  }

  List<Widget> _buildFeaturedSlivers() {
    if (_featuredPlans.isEmpty) {
      return [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(child: Text('暂无训练内容', style: AppTextStyles.body)),
        ),
      ];
    }
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
        sliver: SliverToBoxAdapter(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildColumn(0, widget.collectedIds),
                ),
              ),
              const SizedBox(width: AppConstants.cardGap),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: _buildColumn(1, widget.collectedIds),
                ),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> _buildPlanSlivers() {
    return [
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
        sliver: SliverToBoxAdapter(
          child: PlanTabView(
            userName: widget.userName ?? MockData.defaultProfile.name,
            onWorkoutComplete: widget.onWorkoutComplete,
          ),
        ),
      ),
    ];
  }

  void _openDetail(BuildContext context, WorkoutPlan plan) {
    final detail = MockData.workoutDetail(plan);
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => WorkoutDetailPage(
          plan: plan,
          detail: detail,
          isCollected: widget.collectedIds.contains(plan.id),
          onCollectToggle: () {
            final collected = widget.collectedIds.contains(plan.id);
            widget.onCollectToggle(plan.id, !collected);
          },
          onWorkoutComplete: widget.onWorkoutComplete,
        ),
      ),
    );
  }

  List<Widget> _buildColumn(int col, Set<String> collected) {
    final items = _columnPlans(col);
    return items.map((plan) {
      final isCollected = collected.contains(plan.id);
      return Padding(
        padding: const EdgeInsets.only(bottom: AppConstants.cardGap),
        child: WorkoutWaterfallCard(
          plan: plan,
          isCollected: isCollected,
          onTap: () => _openDetail(context, plan),
          onCollectToggle: () {
            widget.onCollectToggle(plan.id, !isCollected);
            AppToast.show(
              context,
              isCollected ? '已取消收藏' : '已保存至相盼计划夹 ❤️',
            );
          },
        ),
      );
    }).toList();
  }
}

class _HomeTextNav extends StatelessWidget {
  const _HomeTextNav({
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
