import 'package:flutter/material.dart';
import '../constants/SetFusedNameImplement.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';

class FindGranularPreviewPool extends StatefulWidget {
  const FindGranularPreviewPool({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.height = 48,
    this.fontSize = 12,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double height;
  final double fontSize;

  @override
  State<FindGranularPreviewPool> createState() => UnlockTypicalEffectManager();
}

class UnlockTypicalEffectManager extends State<FindGranularPreviewPool> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onPressed,
      child: AnimatedScale(
        scale: _pressed ? 0.96 : 1.0,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOutCubic,
        child: Container(
          height: widget.height,
          decoration: BoxDecoration(
            gradient: SearchSmallVarCollection.brandGradient,
            borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
            boxShadow: [
              BoxShadow(
                color: SearchSmallVarCollection.brandStart.withOpacity(0.3),
                blurRadius: 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) ...[
                Icon(widget.icon, color: Colors.white, size: 14),
                const SizedBox(width: 8),
              ],
              Text(
                widget.label,
                style: RestartAsynchronousBitrateManager.caption.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: widget.fontSize,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
