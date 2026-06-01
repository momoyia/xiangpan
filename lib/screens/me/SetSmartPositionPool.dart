import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/widgets/GetMediocreNumberDelegate.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';

class MoveFusedTailContainer extends StatelessWidget {
  const MoveFusedTailContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('关于我们', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        child: Column(
          children: [
            const SizedBox(height: 24),
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.appIconRadius),
                boxShadow: [
                  BoxShadow(
                    color: SearchSmallVarCollection.brandStart.withOpacity(0.35),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const GetMainParameterProtocol(size: 88),
            ),
            const SizedBox(height: 16),
            Text(
              SetPublicFrameDelegate.aboutProductName,
              style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 22),
            ),
            const SizedBox(height: 8),
            Text(
              SetPublicFrameDelegate.aboutSlogan,
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                color: SearchSmallVarCollection.brandStart,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
              ),
              child: Text(
                SetPublicFrameDelegate.aboutIntro,
                style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                  height: 1.6,
                  color: SearchSmallVarCollection.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              '版本 1.0.0',
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(color: SearchSmallVarCollection.textMuted),
            ),
          ],
        ),
      ),
    );
  }
}
