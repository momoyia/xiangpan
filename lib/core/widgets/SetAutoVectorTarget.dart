import 'package:flutter/material.dart';
import '../theme/SetSmartDisclaimerManager.dart';

class GenerateDirectTrajectoryTarget extends StatelessWidget {
  const GenerateDirectTrajectoryTarget(
    this.text, {
    super.key,
    this.style,
  });

  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => SearchSmallVarCollection.brandGradient.createShader(bounds),
      child: Text(
        text,
        style: (style ?? const TextStyle()).copyWith(color: Colors.white),
      ),
    );
  }
}
