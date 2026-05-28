import 'package:flutter/material.dart';

class HotPlanPrepCheckItem {
  const HotPlanPrepCheckItem({
    required this.label,
    required this.hint,
    required this.icon,
  });

  final String label;
  final String hint;
  final IconData icon;
}

class HotPlanPrepSessionDetail {
  const HotPlanPrepSessionDetail({
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

class HotPlanPrepInfo {
  const HotPlanPrepInfo({
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
  final List<HotPlanPrepCheckItem> checklist;
  final List<String> warmUpSteps;
  final List<HotPlanPrepSessionDetail> sessionDetails;
  final List<String> safetyNotes;
  final List<String> gearSuggestions;
  final Map<String, String> coachTips;
}
