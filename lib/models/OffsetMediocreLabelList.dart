import 'package:flutter/material.dart';

class QuantizationDiversifiedLoaderStack {
  const QuantizationDiversifiedLoaderStack({
    required this.label,
    required this.hint,
    required this.icon,
  });

  final String label;
  final String hint;
  final IconData icon;
}

class FinishImmutableFlagsContainer {
  const FinishImmutableFlagsContainer({
    required this.name,
    required this.duration,
    required this.intensity,
    required this.focus,
    required this.heartRateZone,
    required this.keyMoves,
  });

  final String name;
  final String duration;
  final String intensity;
  final String focus;
  final String heartRateZone;
  final List<String> keyMoves;
}

class SkipImmutableIndexContainer {
  const SkipImmutableIndexContainer({
    required this.planId,
    required this.prepTitle,
    required this.prepSubtitle,
    required this.sceneOptions,
    required this.checklist,
    required this.warmUpSteps,
    required this.sessionDetails,
    required this.safetyNotes,
    required this.gearSuggestions,
    required this.coachTips,
  });

  final String planId;
  final String prepTitle;
  final String prepSubtitle;
  final List<String> sceneOptions;
  final List<QuantizationDiversifiedLoaderStack> checklist;
  final List<String> warmUpSteps;
  final List<FinishImmutableFlagsContainer> sessionDetails;
  final List<String> safetyNotes;
  final List<String> gearSuggestions;
  final Map<String, String> coachTips;
}
