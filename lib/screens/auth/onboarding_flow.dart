import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/onboarding_options.dart';
import '../../models/onboarding_result.dart';

/// 登录后三步引导：训练目标 → 感兴趣项目 → 身高体重
class OnboardingFlow extends StatefulWidget {
  const OnboardingFlow({super.key, required this.onComplete});

  final ValueChanged<OnboardingResult> onComplete;

  @override
  State<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends State<OnboardingFlow> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;

  final Set<String> _selectedGoals = {};
  final Set<String> _selectedSports = {};
  final _heightController = TextEditingController(text: '170');
  final _weightController = TextEditingController(text: '60');

  @override
  void dispose() {
    _pageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  void _toast(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg, style: AppTextStyles.caption.copyWith(color: Colors.white)),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.textPrimary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  bool _validateCurrentPage() {
    switch (_pageIndex) {
      case 0:
        if (_selectedGoals.isEmpty) {
          _toast('请至少选择一个训练目标');
          return false;
        }
        return true;
      case 1:
        if (_selectedSports.isEmpty) {
          _toast('请至少选择一个感兴趣的项目');
          return false;
        }
        return true;
      case 2:
        final height = int.tryParse(_heightController.text.trim());
        final weight = int.tryParse(_weightController.text.trim());
        if (height == null || height < 100 || height > 250) {
          _toast('请输入有效身高（100-250 cm）');
          return false;
        }
        if (weight == null || weight < 30 || weight > 200) {
          _toast('请输入有效体重（30-200 kg）');
          return false;
        }
        return true;
      default:
        return true;
    }
  }

  void _onNext() {
    if (!_validateCurrentPage()) return;
    if (_pageIndex < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 320),
        curve: Curves.easeOutCubic,
      );
      return;
    }
    final height = int.parse(_heightController.text.trim());
    final weight = int.parse(_weightController.text.trim());
    final goals = _selectedGoals
        .map((id) => OnboardingOptions.trainingGoals.firstWhere((o) => o.id == id).label)
        .toList();
    final sports = _selectedSports
        .map((id) => OnboardingOptions.interestedSports.firstWhere((o) => o.id == id).label)
        .toList();
    widget.onComplete(
      OnboardingResult(
        trainingGoals: goals,
        interestedSports: sports,
        heightCm: height,
        weightKg: weight,
      ),
    );
  }

  void _onBack() {
    if (_pageIndex == 0) return;
    _pageController.previousPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.safeMargin,
                12,
                AppConstants.safeMargin,
                8,
              ),
              child: Row(
                children: [
                  if (_pageIndex > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: _onBack,
                    )
                  else
                    const SizedBox(width: 48),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (i) {
                        final active = i == _pageIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: active ? 20 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: active ? AppColors.brandGradient : null,
                            color: active ? null : AppColors.bgSecondary,
                          ),
                        );
                      }),
                    ),
                  ),
                  Text(
                    '${_pageIndex + 1}/3',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (i) => setState(() => _pageIndex = i),
                children: [
                  _GoalsPage(
                    selected: _selectedGoals,
                    onToggle: (id) => setState(() {
                      if (_selectedGoals.contains(id)) {
                        _selectedGoals.remove(id);
                      } else {
                        _selectedGoals.add(id);
                      }
                    }),
                  ),
                  _SportsPage(
                    selected: _selectedSports,
                    onToggle: (id) => setState(() {
                      if (_selectedSports.contains(id)) {
                        _selectedSports.remove(id);
                      } else {
                        _selectedSports.add(id);
                      }
                    }),
                  ),
                  _BodyMetricsPage(
                    heightController: _heightController,
                    weightController: _weightController,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                AppConstants.safeMargin,
                8,
                AppConstants.safeMargin,
                24,
              ),
              child: GradientButton(
                label: _pageIndex == 2 ? '完成，进入相盼' : '下一步',
                height: 52,
                fontSize: 14,
                onPressed: _onNext,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingHeader extends StatelessWidget {
  const _OnboardingHeader({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppConstants.safeMargin,
        8,
        AppConstants.safeMargin,
        20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyles.displayLarge.copyWith(fontSize: 26)),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: AppTextStyles.body.copyWith(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}

class _OptionChip extends StatelessWidget {
  const _OptionChip({
    required this.option,
    required this.selected,
    required this.onTap,
  });

  final OnboardingOption option;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          gradient: selected ? AppColors.brandGradient : null,
          color: selected ? null : AppColors.bgSecondary,
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(
            color: selected ? Colors.transparent : AppColors.bgSecondary,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.brandStart.withOpacity(0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              option.icon,
              size: 18,
              color: selected ? Colors.white : AppColors.brandStart,
            ),
            const SizedBox(width: 8),
            Text(
              option.label,
              style: AppTextStyles.caption.copyWith(
                color: selected ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GoalsPage extends StatelessWidget {
  const _GoalsPage({required this.selected, required this.onToggle});

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const _OnboardingHeader(
          title: '你的训练目标',
          subtitle: '选择你想达成的方向，可多选',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: OnboardingOptions.trainingGoals
                .map(
                  (o) => _OptionChip(
                    option: o,
                    selected: selected.contains(o.id),
                    onTap: () => onToggle(o.id),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SportsPage extends StatelessWidget {
  const _SportsPage({required this.selected, required this.onToggle});

  final Set<String> selected;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const _OnboardingHeader(
          title: '感兴趣的项目',
          subtitle: '告诉我们你更想尝试哪些运动',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: OnboardingOptions.interestedSports
                .map(
                  (o) => _OptionChip(
                    option: o,
                    selected: selected.contains(o.id),
                    onTap: () => onToggle(o.id),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _BodyMetricsPage extends StatelessWidget {
  const _BodyMetricsPage({
    required this.heightController,
    required this.weightController,
  });

  final TextEditingController heightController;
  final TextEditingController weightController;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 16),
      children: [
        const _OnboardingHeader(
          title: '身体数据',
          subtitle: '填写身高体重，便于为你推荐合适训练',
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
          child: Column(
            children: [
              _MetricField(
                label: '身高',
                unit: 'cm',
                controller: heightController,
                hint: '例如 170',
              ),
              const SizedBox(height: 16),
              _MetricField(
                label: '体重',
                unit: 'kg',
                controller: weightController,
                hint: '例如 60',
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.bgSecondary,
                  borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                ),
                child: Text(
                  '数据仅用于本地训练推荐，不会对外公开。',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetricField extends StatelessWidget {
  const _MetricField({
    required this.label,
    required this.unit,
    required this.controller,
    required this.hint,
  });

  final String label;
  final String unit;
  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.bgSecondary,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 48,
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              style: AppTextStyles.h1.copyWith(fontSize: 28),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyles.body.copyWith(color: AppColors.textMuted),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          Text(
            unit,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.brandStart,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
