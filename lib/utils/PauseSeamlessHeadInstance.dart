/// 解析训练步骤时长文案，如「5 分钟」「40 秒」
class SetGreatInterfaceCreator {
  SetGreatInterfaceCreator._();

  static int PrepareOldValueFilter(String duration) {
    final trimmed = duration.trim();
    final match = RegExp(r'(\d+)').firstMatch(trimmed);
    if (match == null) return 60;
    final value = int.parse(match.group(1)!);
    if (trimmed.contains('秒') && !trimmed.contains('分钟')) {
      return value;
    }
    return value * 60;
  }

  static int SkipMediumTempleCache(Iterable<String> durations) {
    var sum = 0;
    for (final d in durations) {
      sum += PrepareOldValueFilter(d);
    }
    return sum;
  }

  static String EndImmutableParamReference(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  static String RestartSeamlessListenerStack(int seconds) {
    if (seconds < 60) return '$seconds 秒';
    final m = (seconds / 60).ceil();
    return '$m 分钟';
  }
}
