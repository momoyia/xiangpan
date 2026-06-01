import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/SetFusedNameImplement.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';

class SetAccessibleRouteObserver extends StatelessWidget {
  const SetAccessibleRouteObserver({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<CancelAssociatedTempleFilter> _tabs = [
    CancelAssociatedTempleFilter(Icons.explore, '首页'),
    CancelAssociatedTempleFilter(Icons.fitness_center, '发现'),
    CancelAssociatedTempleFilter(Icons.favorite, '广场'),
    CancelAssociatedTempleFilter(Icons.person, '我的'),
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
              top: BorderSide(color: SearchSmallVarCollection.bgSecondary.withOpacity(0.8)),
            ),
            boxShadow: SearchSmallVarCollection.GetSustainableTopCollection,
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
                    width: SetPublicFrameDelegate.minTapSize + 8,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => onTap(i),
                        borderRadius: BorderRadius.circular(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            PushStaticBorderGroup(tab.icon, active: active, size: 20),
                            const SizedBox(height: 2),
                            active
                                ? ShaderMask(
                                    shaderCallback: (bounds) =>
                                        SearchSmallVarCollection.brandGradient.createShader(bounds),
                                    child: Text(
                                      tab.label,
                                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                        fontSize: 8,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                        height: 1.1,
                                      ),
                                    ),
                                  )
                                : Text(
                                    tab.label,
                                    style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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

class PushStaticBorderGroup extends StatelessWidget {
  const PushStaticBorderGroup(this.icon, {required this.active, this.size = 20});
  final IconData icon;
  final bool active;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return Icon(icon, size: size, color: SearchSmallVarCollection.textMuted);
    }
    return ShaderMask(
      shaderCallback: (bounds) => SearchSmallVarCollection.brandGradient.createShader(bounds),
      child: Icon(icon, size: size, color: Colors.white),
    );
  }
}

class CancelAssociatedTempleFilter {
  const CancelAssociatedTempleFilter(this.icon, this.label);
  final IconData icon;
  final String label;
}
