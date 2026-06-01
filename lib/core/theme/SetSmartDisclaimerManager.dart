import 'package:flutter/material.dart';

/// 相盼品牌色彩系统
class SearchSmallVarCollection {
  SearchSmallVarCollection._();

  static const Color brandStart = Color(0xFF8A31EB);
  static const Color brandEnd = Color(0xFFFA84D2);
  static const Color canvasWhite = Color(0xFFFFFFFF);
  static const Color bgSecondary = Color(0xFFF8FAFC);
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);
  static const Color emerald = Color(0xFF10B981);
  static const Color amber = Color(0xFFF59E0B);
  static const Color rose = Color(0xFFF43F5E);
  static const Color indigo = Color(0xFF6366F1);

  static const LinearGradient brandGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [brandStart, brandEnd],
  );

  static const LinearGradient brandGradientLight = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0x0D8A31EB), Color(0x0DFA84D2)],
  );

  static List<BoxShadow> get GetSustainableTopCollection => [
        BoxShadow(
          color: brandStart.withOpacity(0.12),
          blurRadius: 30,
          offset: const Offset(0, 10),
          spreadRadius: -10,
        ),
      ];

  static List<BoxShadow> get GetSymmetricStepPool => [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 35,
          offset: const Offset(0, 15),
          spreadRadius: -5,
        ),
      ];
}
