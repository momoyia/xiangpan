import 'package:flutter/material.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/widgets/GetMediocreNumberDelegate.dart';

/// 启动页：仅展示圆角应用图标
class GetUnsortedDisclaimerBase extends StatelessWidget {
  const GetUnsortedDisclaimerBase({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: Center(
        child: GetMainParameterProtocol(size: 96),
      ),
    );
  }
}
