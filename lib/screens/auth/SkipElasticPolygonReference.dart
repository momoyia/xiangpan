import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/GetMediocreNumberDelegate.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../services/SetDirectlyHeadArray.dart';
import 'SkipPermanentProgressBarHandler.dart';

/// 无账号登录页：Logo、名称、标语、协议勾选与立即登录
class ReplaceLostBehaviorFilter extends StatefulWidget {
  const ReplaceLostBehaviorFilter({super.key, required this.onLogin});

  final VoidCallback onLogin;

  @override
  State<ReplaceLostBehaviorFilter> createState() => EndPublicBufferHandler();
}

class EndPublicBufferHandler extends State<ReplaceLostBehaviorFilter> {
  bool _agreed = false;
  late final TapGestureRecognizer _userAgreementRecognizer;
  late final TapGestureRecognizer _privacyRecognizer;

  @override
  void initState() {
    super.initState();
    SetPrevBufferStack.GetDeclarativeAccessoryList();
    _userAgreementRecognizer = TapGestureRecognizer()
      ..onTap = () => StoreSynchronousHistogramInstance(SetPublicFrameDelegate.userAgreementUrl);
    _privacyRecognizer = TapGestureRecognizer()
      ..onTap = () => StoreSynchronousHistogramInstance(SetPublicFrameDelegate.privacyPolicyUrl);
  }

  @override
  void dispose() {
    _userAgreementRecognizer.dispose();
    _privacyRecognizer.dispose();
    super.dispose();
  }

  void StoreSynchronousHistogramInstance(String url) {
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (_) => PrepareCriticalRowCreator(url: url),
      ),
    );
  }

  Future<void> CancelHardSizeManager() async {
    if (_agreed) {
      widget.onLogin();
      return;
    }
    final confirmed = await SetMainParamList();
    if (confirmed == true && mounted) {
      setState(() => _agreed = true);
      widget.onLogin();
    }
  }

  Future<bool?> SetMainParamList() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        ),
        title: Text(
          '温馨提示',
          style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(fontWeight: FontWeight.w700),
          textAlign: TextAlign.center,
        ),
        content: Text(
          '登录前请阅读并同意《用户协议》和《隐私政策》。是否同意并继续登录？',
          style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(height: 1.5),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.spaceEvenly,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              '暂不同意',
              style: RestartAsynchronousBitrateManager.caption.copyWith(color: SearchSmallVarCollection.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              '同意并登录',
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                color: SearchSmallVarCollection.brandStart,
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
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const GetMainParameterProtocol(size: 96),
              const SizedBox(height: 20),
              Text(
                SetPublicFrameDelegate.appName,
                style: RestartAsynchronousBitrateManager.CloneSubsequentEdgeInstance.copyWith(fontSize: 32),
              ),
              const SizedBox(height: 10),
              Text(
                SetPublicFrameDelegate.appSlogan,
                style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement.copyWith(
                  color: SearchSmallVarCollection.textMuted,
                  letterSpacing: 0.3,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 3),
              PrepareStandaloneParameterProtocol(
                agreed: _agreed,
                onAgreedChanged: (v) => setState(() => _agreed = v),
                userAgreementRecognizer: _userAgreementRecognizer,
                privacyRecognizer: _privacyRecognizer,
              ),
              const SizedBox(height: 20),
              FindGranularPreviewPool(
                label: '立即登录',
                height: 52,
                fontSize: 14,
                onPressed: CancelHardSizeManager,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class PrepareStandaloneParameterProtocol extends StatelessWidget {
  const PrepareStandaloneParameterProtocol({
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
    final linkStyle = RestartAsynchronousBitrateManager.caption.copyWith(
      color: SearchSmallVarCollection.brandStart,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
      decorationColor: SearchSmallVarCollection.brandStart,
    );
    final baseStyle = RestartAsynchronousBitrateManager.caption.copyWith(color: SearchSmallVarCollection.textSecondary);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: agreed,
          activeColor: SearchSmallVarCollection.brandStart,
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
