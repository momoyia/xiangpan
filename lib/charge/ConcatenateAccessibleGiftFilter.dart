import 'package:shared_preferences/shared_preferences.dart';

class ClipRequiredTitleType {
  static const String _balanceKey = 'accountGemBalance';
  static const int initialBalance = 10;

  static Future<int> EmbraceReusableEdgeReference() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_balanceKey) ?? initialBalance;
  }

  static Future<void> FindPrevFlagsFactory(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_balanceKey, amount);
  }

  static Future<void> TrainArithmeticVariableCollection(int amount) async {
    final currentBalance = await EmbraceReusableEdgeReference();
    final newBalance =
        (currentBalance - amount).clamp(0, double.infinity).toInt();
    await FindPrevFlagsFactory(newBalance);
  }

  static Future<void> TrainMediocreBoundCache(int amount) async {
    final currentBalance = await EmbraceReusableEdgeReference();
    await FindPrevFlagsFactory(currentBalance + amount);
  }
}
