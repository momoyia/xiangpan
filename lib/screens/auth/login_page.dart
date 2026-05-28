import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_logo.dart';
import '../../core/widgets/gradient_button.dart';
import '../../services/agreement_web_loader.dart';
import 'agreement_web_page.dart';

/// 无账号登录页：Logo、名称、标语、协议勾选与立即登录
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _agreed = false;
  late final TapGestureRecognizer _userAgreementRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    AgreementWebLoader.preloadAll();
    _userAgreementRecognizer = TapGestureRecognizer()
      ..onTap = () => _openAgreement(AppConstants.userAgreementUrl);
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () => _openAgreement(AppConstants.privacyPolicyUrl);
  }

  @override
  void dispose() {
    _userAgreementRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  void _openAgreement(String url) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => AgreementWebPage(url: url),
      ),
    );
  }

  Future<void> _onLoginTap() async {
    if (_agreed) {
      widget.onLogin();
      return;
    }
    final confirmed = await _showAgreementConfirmDialog();
    if (confirmed == true && mounted) {
      setState(() => _agreed = true);
      widget.onLogin();
    }
  }

  Future<bool?> _showAgreementConfirmDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        ),
        title: Text(
          '温馨提示',
          style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        content: Text(
          '登录前请阅读并同意《用户协议》和《隐私政策》。是否同意并继续登录？',
          style: AppTextStyles.bodySmall.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              '暂不同意',
              style: AppTextStyles.caption.copyWith(color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              '同意并登录',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.brandStart,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.safeMargin),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const AppLogo(size: 96),
              const SizedBox(height: 20),
              Text(
                AppConstants.appName,
                style: AppTextStyles.displayLarge.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 10),
              Text(
                AppConstants.appSlogan,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              _AgreementRow(
                agreed: _agreed,
                onAgreedChanged: (v) => setState(() => _agreed = v),
                userAgreementRecognizer: _userAgreementRecognizer,
                privacyRecognizer: _privacyRecognizer,
              ),
              const SizedBox(height: 20),
              GradientButton(
                label: '立即登录',
                height: 52,
                fontSize: 14,
                onPressed: _onLoginTap,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgreementRow extends StatelessWidget {
  const _AgreementRow({
    required this.agreed,
    required this.onAgreedChanged,
    required this.userAgreementRecognizer,
    required this.privacyRecognizer,
  });

  final bool agreed;
  final ValueChanged<bool> onAgreedChanged;
  final TapGestureRecognizer userAgreementRecognizer;
  final TapGestureRecognizer privacyRecognizer;

  @override
  Widget build(BuildContext context) {
    final linkStyle = AppTextStyles.caption.copyWith(
      color: AppColors.brandStart,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.brandStart,
    );
    final baseStyle = AppTextStyles.caption.copyWith(color: AppColors.textSecondary);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: agreed,
          activeColor: AppColors.brandStart,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          onChanged: (v) => onAgreedChanged(v ?? false),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text.rich(
            TextSpan(
              style: baseStyle,
              children: [
                const TextSpan(text: '我已阅读并同意'),
                TextSpan(
                  text: '《用户协议》',
                  style: linkStyle,
                  recognizer: userAgreementRecognizer,
                ),
                const TextSpan(text: '和'),
                TextSpan(
                  text: '《隐私政策》',
                  style: linkStyle,
                  recognizer: privacyRecognizer,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
