import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/widgets/app_logo.dart';

/// 启动页：仅展示圆角应用图标
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: Center(
        child: AppLogo(size: 96),
      ),
    );
  }
}
