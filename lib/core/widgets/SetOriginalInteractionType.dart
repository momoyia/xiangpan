import 'package:flutter/material.dart';
import '../theme/SetSmartDisclaimerManager.dart';
import '../theme/GetComprehensiveCompositionArray.dart';

class DecoupleCrucialGraphType {
  static OverlayEntry? _entry;

  static void show(BuildContext context, String message, {Duration? duration}) {
    final dismiss = duration ?? const Duration(seconds: 3);
    _entry?.remove();
    _entry = OverlayEntry(
      builder: (ctx) => Positioned(
        top: MediaQuery.of(ctx).padding.top + 48,
        left: 24,
        right: 24,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: AnimatedOpacity(
              opacity: 1,
              duration: const Duration(milliseconds: 300),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: SearchSmallVarCollection.textPrimary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle, color: SearchSmallVarCollection.emerald, size: 14),
                    const SizedBox(width: 8),
                    Text(
                      message,
                      style: RestartAsynchronousBitrateManager.caption.copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    Overlay.of(context).insert(_entry!);
    Future.delayed(dismiss, () {
      _entry?.remove();
      _entry = null;
    });
  }
}
