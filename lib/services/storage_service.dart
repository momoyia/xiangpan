import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/feed_post.dart';
import '../models/user_profile.dart';

class StorageService {
  StorageService._();
  static StorageService? _instance;
  static SharedPreferences? _prefs;

  static Future<StorageService> getInstance() async {
    if (_instance != null) return _instance!;
    _prefs = await SharedPreferences.getInstance();
    _instance = StorageService._();
    return _instance!;
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
  static const String _keyLoggedIn = 'is_logged_in';
  static const String _keyOnboardingDone = 'onboarding_completed';

  Future<UserProfile?> loadProfile() async {
    final raw = _prefs!.getString(_keyProfile);
    if (raw == null) return null;
    try {
      return UserProfile.fromJson(jsonDecode(raw) as Map<String, dynamic>);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveProfile(UserProfile profile) async {
    await _prefs!.setString(_keyProfile, jsonEncode(profile.toJson()));
  }

  Set<String> getLikedPosts() =>
      _prefs!.getStringList(_keyLikedPosts)?.toSet() ?? {};

  Future<void> setLikedPosts(Set<String> ids) async {
    await _prefs!.setStringList(_keyLikedPosts, ids.toList());
  }

  Set<String> getCollectedPosts() =>
      _prefs!.getStringList(_keyCollectedPosts)?.toSet() ?? {};

  Future<void> setCollectedPosts(Set<String> ids) async {
    await _prefs!.setStringList(_keyCollectedPosts, ids.toList());
  }

  Set<String> getCollectedWorkouts() =>
      _prefs!.getStringList(_keyCollectedWorkouts)?.toSet() ?? {};

  Future<void> setCollectedWorkouts(Set<String> ids) async {
    await _prefs!.setStringList(_keyCollectedWorkouts, ids.toList());
  }

  Set<String> getFollowedUsers() =>
      _prefs!.getStringList(_keyFollowedUsers)?.toSet() ?? {};

  Future<void> setFollowedUsers(Set<String> ids) async {
    await _prefs!.setStringList(_keyFollowedUsers, ids.toList());
  }

  bool getPushEnabled() => _prefs!.getBool(_keyPushEnabled) ?? true;

  Future<void> setPushEnabled(bool value) async {
    await _prefs!.setBool(_keyPushEnabled, value);
  }

  Map<String, int> getLikedCounts() {
    final raw = _prefs!.getString(_keyLikedCounts);
    if (raw == null) return {};
    try {
      final map = jsonDecode(raw) as Map<String, dynamic>;
      return map.map((k, v) => MapEntry(k, v as int));
    } catch (_) {
      return {};
    }
  }

  Future<void> saveLikedCounts(Map<String, int> counts) async {
    await _prefs!.setString(_keyLikedCounts, jsonEncode(counts));
  }

  Set<String> getBlockedAuthors() =>
      _prefs!.getStringList(_keyBlockedAuthors)?.toSet() ?? {};

  Future<void> setBlockedAuthors(Set<String> authors) async {
    await _prefs!.setStringList(_keyBlockedAuthors, authors.toList());
  }

  Set<String> getShieldedPosts() =>
      _prefs!.getStringList(_keyShieldedPosts)?.toSet() ?? {};

  Future<void> setShieldedPosts(Set<String> ids) async {
    await _prefs!.setStringList(_keyShieldedPosts, ids.toList());
  }

  Set<String> getReportedPosts() =>
      _prefs!.getStringList(_keyReportedPosts)?.toSet() ?? {};

  Future<void> setReportedPosts(Set<String> ids) async {
    await _prefs!.setStringList(_keyReportedPosts, ids.toList());
  }

  List<FeedPost> loadUserPosts() {
    final raw = _prefs!.getString(_keyUserPosts);
    if (raw == null) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => FeedPost.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  Future<void> saveUserPosts(List<FeedPost> posts) async {
    final encoded = posts.map((p) => p.toJson()).toList();
    await _prefs!.setString(_keyUserPosts, jsonEncode(encoded));
  }

  bool getTeenModeEnabled() => _prefs!.getBool(_keyTeenMode) ?? false;

  Future<void> setTeenModeEnabled(bool value) async {
    await _prefs!.setBool(_keyTeenMode, value);
  }

  bool isLoggedIn() => _prefs!.getBool(_keyLoggedIn) ?? false;

  Future<void> setLoggedIn(bool value) async {
    await _prefs!.setBool(_keyLoggedIn, value);
  }

  bool hasCompletedOnboarding() =>
      _prefs!.getBool(_keyOnboardingDone) ?? false;

  Future<void> setOnboardingCompleted(bool value) async {
    await _prefs!.setBool(_keyOnboardingDone, value);
  }
}
