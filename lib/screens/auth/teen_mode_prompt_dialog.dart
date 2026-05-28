import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

/// 首次登录引导完成后，询问是否开启青少年模式
class TeenModePromptDialog {
  TeenModePromptDialog._();

  /// 返回 true 表示开启，false 表示暂不开启
  static Future<bool> show(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        title: Text(
          '开启青少年模式？',
          style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        content: Text(
          '青少年模式可限制部分敏感内容，呵护健康成长。'
          '你可在「我的 → 设置」中随时开启或关闭。',
          style: AppTextStyles.bodySmall.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              '暂不开启',
              style: AppTextStyles.caption.copyWith(color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              '立即开启',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.brandStart,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
