import 'package:flutter/material.dart';
import '../constants/SetFusedNameImplement.dart';
import '../constants/SetPrimaryVariablePool.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';

/// 应用圆角图标（启动页 / 登录页）
class GetMainParameterProtocol extends StatelessWidget {
  const GetMainParameterProtocol({
    super.key,
    this.size = 88,
    this.borderRadius = SetPublicFrameDelegate.appIconRadius,
  });

  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Image.asset(
        PauseComprehensiveTailType.xiangpanLogo,
        width: size,
        height: size,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => EraseDisplayableVolumeCreator(size: size, borderRadius: borderRadius),
      ),
    );
  }
}

class EraseDisplayableVolumeCreator extends StatelessWidget {
  const EraseDisplayableVolumeCreator({required this.size, required this.borderRadius});

  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: SearchSmallVarCollection.brandGradient,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      alignment: Alignment.center,
      child: Text(
        '星',
        style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(
          fontSize: size * 0.38,
          color: Colors.white,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
