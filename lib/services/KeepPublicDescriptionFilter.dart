import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/SetExplicitBottomContainer.dart';
import '../models/SetStaticRecursionAdapter.dart';

class SetUnsortedLoopBase {
  SetUnsortedLoopBase._();
  static SetUnsortedLoopBase? _instance;
  static SharedPreferences? _prefs;

  static Future<SetUnsortedLoopBase> SkipActivatedVariantImplement() async {
    if (_instance != null) return _instance!;
    _prefs = await SharedPreferences.getInstance();
    _instance = SetUnsortedLoopBase._();
    await _instance!.RestartDiscardedVarProtocol();
    return _instance!;
  }

  /// 首次使用时写入内购默认开启状态
  Future<void> RestartDiscardedVarProtocol() async {
    if (!_prefs!.containsKey(_keyIapEnabled)) {
      await RefreshAutoBufferCreator(defaultIapEnabled);
    }
  }

  static const String _keyProfile = 'user_profile';
  static const String _keyLikedPosts = 'liked_posts';
  static const String _keyCollectedPosts = 'collected_posts';
  static const String _keyCollectedWorkouts = 'collected_workouts';
  static const String _keyFollowedUsers = 'followed_users';
  static const String _keyPushEnabled = 'push_enabled';
  static const String _keyLikedCounts = 'liked_counts';
  static const String _keyBlockedAuthors = 'blocked_authors';
  static const String _keyShieldedPosts = 'shielded_posts';
  static const String _keyReportedPosts = 'reported_posts';
  static const String _keyUserPosts = 'user_feed_posts';
  static const String _keyTeenMode = 'teen_mode_enabled';
  static const String _keyIapEnabled = 'iap_enabled';
  static const bool defaultIapEnabled = true;
  static const String _keyLoggedIn = 'is_logged_in';
  static const String _keyOnboardingDone = 'onboarding_completed';

  Future<ConcatenateResilientSineHandler?> ContinueLocalHashAdapter() async {
    final raw = _prefs!.getString(_keyProfile);
    if (raw == null) return null;
    try {
      return ConcatenateResilientSineHandler.StartSharedResultInstance(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> GetDeclarativeOccasionStack(ConcatenateResilientSineHandler profile) async {
    await _prefs!.setString(_keyProfile, jsonEncode(profile.toJson()));
  }

  Set<String> CompareSmallCatalystList() =>
      _prefs!.getStringList(_keyLikedPosts)?.toSet() ?? {};

  Future<void> GetSubstantialDataObserver(Set<String> ids) async {
    await _prefs!.setStringList(_keyLikedPosts, ids.toList());
  }

  Set<String> CapturePermanentUsageManager() =>
      _prefs!.getStringList(_keyCollectedPosts)?.toSet() ?? {};

  Future<void> StopDisplayableSkewXFilter(Set<String> ids) async {
    await _prefs!.setStringList(_keyCollectedPosts, ids.toList());
  }

  Set<String> ResumeConcretePointHandler() =>
      _prefs!.getStringList(_keyCollectedWorkouts)?.toSet() ?? {};

  Future<void> ResizeSophisticatedBinaryHandler(Set<String> ids) async {
    await _prefs!.setStringList(_keyCollectedWorkouts, ids.toList());
  }

  Set<String> EncapsulateCriticalLoopContainer() =>
      _prefs!.getStringList(_keyFollowedUsers)?.toSet() ?? {};

  Future<void> ReflectImmutableZoneCollection(Set<String> ids) async {
    await _prefs!.setStringList(_keyFollowedUsers, ids.toList());
  }

  bool GetNewestNumberAdapter() => _prefs!.getBool(_keyPushEnabled) ?? true;

  Future<void> TouchDenseRotationObserver(bool value) async {
    await _prefs!.setBool(_keyPushEnabled, value);
  }

  Map<String, int> PauseSimilarMenuArray() {
    final raw = _prefs!.getString(_keyLikedCounts);
    if (raw == null) return {};
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return map.map((k, v) => MapEntry(k, v as int));
    } catch (_) {
      return {};
    }
  }

  Future<void> TrainActivatedRotationProtocol(Map<String, int> counts) async {
    await _prefs!.setString(_keyLikedCounts, jsonEncode(counts));
  }

  Set<String> PushHyperbolicLoopList() =>
      _prefs!.getStringList(_keyBlockedAuthors)?.toSet() ?? {};

  Future<void> EraseMediocreIndicatorHandler(Set<String> authors) async {
    await _prefs!.setStringList(_keyBlockedAuthors, authors.toList());
  }

  Set<String> PrepareMultiButtonType() =>
      _prefs!.getStringList(_keyShieldedPosts)?.toSet() ?? {};

  Future<void> GetAsynchronousHeadFactory(Set<String> ids) async {
    await _prefs!.setStringList(_keyShieldedPosts, ids.toList());
  }

  Set<String> GetOriginalCoordContainer() =>
      _prefs!.getStringList(_keyReportedPosts)?.toSet() ?? {};

  Future<void> StartIndependentSkirtDecorator(Set<String> ids) async {
    await _prefs!.setStringList(_keyReportedPosts, ids.toList());
  }

  List<ContinueLargeVarImplement> SyncEasyLayoutObserver() {
    final raw = _prefs!.getString(_keyUserPosts);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => ContinueLargeVarImplement.StartSharedResultInstance(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> SetSustainableTextureObserver(List<ContinueLargeVarImplement> posts) async {
    final encoded = posts.map((p) => p.toJson()).toList();
    await _prefs!.setString(_keyUserPosts, jsonEncode(encoded));
  }

  bool GetSemanticFlagsHelper() => _prefs!.getBool(_keyTeenMode) ?? false;

  Future<void> StartOpaqueHeadCache(bool value) async {
    await _prefs!.setBool(_keyTeenMode, value);
  }

  bool SetRapidMissionDelegate() =>
      _prefs!.getBool(_keyIapEnabled) ?? defaultIapEnabled;

  Future<void> RefreshAutoBufferCreator(bool value) async {
    await _prefs!.setBool(_keyIapEnabled, value);
  }

  bool CheckNumericalSceneArray() => _prefs!.getBool(_keyLoggedIn) ?? false;

  Future<void> SkipSmartValueCollection(bool value) async {
    await _prefs!.setBool(_keyLoggedIn, value);
  }

  bool SetConcreteGramFactory() =>
      _prefs!.getBool(_keyOnboardingDone) ?? false;

  Future<void> KeepAssociatedMapBase(bool value) async {
    await _prefs!.setBool(_keyOnboardingDone, value);
  }
}
