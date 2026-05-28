import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class GlassBottomBar extends StatelessWidget {
  const GlassBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<_TabItem> _tabs = [
    _TabItem(Icons.explore, '首页'),
    _TabItem(Icons.fitness_center, '发现'),
    _TabItem(Icons.favorite, '广场'),
    _TabItem(Icons.person, '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.75),
            border: Border(
              top: BorderSide(color: AppColors.bgSecondary.withOpacity(0.8)),
            ),
            boxShadow: AppColors.softShadow,
          ),
          child: SafeArea(
            top: false,
            child: SizedBox(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_tabs.length, (i) {
                  final active = i == currentIndex;
                  final tab = _tabs[i];
                  return SizedBox(
                    width: AppConstants.minTapSize + 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onTap(i),
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _GradientIcon(tab.icon, active: active, size: 20),
                            const SizedBox(height: 2),
                            active
                                ? ShaderMask(
                                    shaderCallback: (bounds) =>
                                        AppColors.brandGradient.createShader(bounds),
                                    child: Text(
                                      tab.label,
                                      style: AppTextStyles.captionSmall.copyWith(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        height: 1.1,
                                      ),
                                    ),
                                  )
                                : Text(
                                    tab.label,
                                    style: AppTextStyles.captionSmall.copyWith(
                                      fontSize: 8,
                                      height: 1.1,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientIcon extends StatelessWidget {
  const _GradientIcon(this.icon, {required this.active, this.size = 20});
  final IconData icon;
  final bool active;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return Icon(icon, size: size, color: AppColors.textMuted);
    }
    return ShaderMask(
      shaderCallback: (bounds) => AppColors.brandGradient.createShader(bounds),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}

class _TabItem {
  const _TabItem(this.icon, this.label);
  final IconData icon;
  final String label;
}
