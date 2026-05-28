import 'package:flutter/material.dart';
import '../core/widgets/app_toast.dart';
import '../core/widgets/glass_bottom_bar.dart';
import 'auth/teen_mode_prompt_dialog.dart';
import '../data/mock_data.dart';
import '../models/feed_post.dart';
import '../models/user_profile.dart';
import '../models/workout_session_result.dart';
import '../services/storage_service.dart';
import 'discover/discover_screen.dart';
import 'home/home_screen.dart';
import 'me/me_screen.dart';
import 'share/share_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key, this.promptTeenModeOnLaunch = false});

  /// 首次完成引导进入主页时，弹出青少年模式询问
  final bool promptTeenModeOnLaunch;

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _tabIndex = 0;
  late StorageService _storage;

  UserProfile _profile = MockData.defaultProfile;
  Set<String> _collectedWorkouts = {};
  Set<String> _likedPosts = {};
  Set<String> _blockedAuthors = {};
  Set<String> _shieldedPostIds = {};
  Set<String> _reportedPostIds = {};
  Set<String> _followedUsers = {};
  Map<String, int> _likeCounts = {};
  List<FeedPost> _userPosts = [];
  bool _teenModeEnabled = false;
  bool _ready = false;
  bool _teenPromptScheduled = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _storage = await StorageService.getInstance();
    final profile = await _storage.loadProfile();
    final likedCounts = _storage.getLikedCounts();
    for (final post in MockData.feedPosts) {
      likedCounts.putIfAbsent(post.id, () => post.likeCount);
    }
    setState(() {
      _profile = profile ?? MockData.defaultProfile;
      _collectedWorkouts = _storage.getCollectedWorkouts();
      _likedPosts = _storage.getLikedPosts();
      _blockedAuthors = _storage.getBlockedAuthors();
      _shieldedPostIds = _storage.getShieldedPosts();
      _reportedPostIds = _storage.getReportedPosts();
      _followedUsers = _storage.getFollowedUsers();
      _likeCounts = likedCounts;
      _userPosts = _storage.loadUserPosts();
      for (final post in _userPosts) {
        _likeCounts.putIfAbsent(post.id, () => post.likeCount);
      }
      _teenModeEnabled = _storage.getTeenModeEnabled();
      _ready = true;
    });
    if (widget.promptTeenModeOnLaunch) {
      _scheduleTeenModePrompt();
    }
  }

  void _scheduleTeenModePrompt() {
    if (_teenPromptScheduled) return;
    _teenPromptScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || !_ready) return;
      final enable = await TeenModePromptDialog.show(context);
      if (!mounted) return;
      await _onTeenModeChanged(enable);
      if (!mounted) return;
      AppToast.show(
        context,
        enable ? '青少年模式已开启' : '青少年模式未开启',
      );
    });
  }

  Future<void> _addUserPost(FeedPost post) async {
    setState(() {
      _userPosts.insert(0, post);
      _likeCounts[post.id] = post.likeCount;
    });
    await _storage.saveUserPosts(_userPosts);
  }

  Future<void> _deleteUserPost(String postId) async {
    setState(() {
      _userPosts.removeWhere((p) => p.id == postId);
      _likedPosts.remove(postId);
      _likeCounts.remove(postId);
      _shieldedPostIds.remove(postId);
      _reportedPostIds.remove(postId);
    });
    await _storage.saveUserPosts(_userPosts);
    await _storage.setLikedPosts(_likedPosts);
    await _storage.saveLikedCounts(_likeCounts);
    await _storage.setShieldedPosts(_shieldedPostIds);
    await _storage.setReportedPosts(_reportedPostIds);
  }

  Future<void> _persistProfile(UserProfile p) async {
    setState(() => _profile = p);
    await _storage.saveProfile(p);
  }

  Future<void> _toggleWorkoutCollect(String id, bool collected) async {
    setState(() {
      if (collected) {
        _collectedWorkouts.add(id);
      } else {
        _collectedWorkouts.remove(id);
      }
    });
    await _storage.setCollectedWorkouts(_collectedWorkouts);
  }

  Future<void> _toggleLike(String id, bool liked, int count) async {
    setState(() {
      if (liked) {
        _likedPosts.add(id);
      } else {
        _likedPosts.remove(id);
      }
      _likeCounts[id] = count;
    });
    await _storage.setLikedPosts(_likedPosts);
    await _storage.saveLikedCounts(_likeCounts);
  }

  Future<void> _toggleFollow(String author, bool followed) async {
    setState(() {
      if (followed) {
        _followedUsers.add(author);
      } else {
        _followedUsers.remove(author);
      }
    });
    await _storage.setFollowedUsers(_followedUsers);
  }

  Future<void> _blockAuthor(String author) async {
    setState(() {
      _blockedAuthors.add(author);
      _followedUsers.remove(author);
    });
    await _storage.setBlockedAuthors(_blockedAuthors);
    await _storage.setFollowedUsers(_followedUsers);
  }

  Future<void> _shieldPost(String postId) async {
    setState(() => _shieldedPostIds.add(postId));
    await _storage.setShieldedPosts(_shieldedPostIds);
  }

  Future<void> _reportPost(String postId, String reason, String? detail) async {
    setState(() => _reportedPostIds.add(postId));
    await _storage.setReportedPosts(_reportedPostIds);
  }

  Future<void> _onTeenModeChanged(bool v) async {
    setState(() => _teenModeEnabled = v);
    await _storage.setTeenModeEnabled(v);
  }

  Future<void> _unblockAuthor(String author) async {
    setState(() => _blockedAuthors.remove(author));
    await _storage.setBlockedAuthors(_blockedAuthors);
  }

  Future<void> _unshieldPost(String postId) async {
    setState(() => _shieldedPostIds.remove(postId));
    await _storage.setShieldedPosts(_shieldedPostIds);
  }

  void _onWorkoutComplete(WorkoutSessionResult result) {
    final minutes = (result.elapsedSeconds / 60).ceil().clamp(1, 999);
    final newRate = (_profile.goalCompletionRate + 0.03).clamp(0.0, 1.0);
    setState(() {
      _profile = _profile.copyWith(
        exerciseMinutes: _profile.exerciseMinutes + minutes,
        totalCalories: _profile.totalCalories + result.caloriesBurned,
        goalCompletionRate: newRate,
        activeDays: _profile.activeDays + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_ready) {
      return const Scaffold(
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(color: Color(0xFF8A31EB)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.02),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            );
          },
          child: KeyedSubtree(
            key: ValueKey<int>(_tabIndex),
            child: _buildPage(),
          ),
        ),
      ),
      bottomNavigationBar: GlassBottomBar(
        currentIndex: _tabIndex,
        onTap: (i) => setState(() => _tabIndex = i),
      ),
    );
  }

  Widget _buildPage() {
    switch (_tabIndex) {
      case 0:
        return HomeScreen(
          collectedIds: _collectedWorkouts,
          onCollectToggle: _toggleWorkoutCollect,
          userName: _profile.name,
          onWorkoutComplete: _onWorkoutComplete,
        );
      case 1:
        return const DiscoverScreen();
      case 2:
        return ShareScreen(
          profile: _profile,
          userPosts: _userPosts,
          likedIds: _likedPosts,
          followedIds: _followedUsers,
          likeCounts: _likeCounts,
          blockedAuthors: _blockedAuthors,
          shieldedPostIds: _shieldedPostIds,
          reportedPostIds: _reportedPostIds,
          onLikeToggle: _toggleLike,
          onFollowToggle: _toggleFollow,
          onBlockAuthor: _blockAuthor,
          onShieldPost: _shieldPost,
          onReportPost: _reportPost,
          onUserPostPublished: _addUserPost,
        );
      case 3:
        return MeScreen(
          profile: _profile,
          userPosts: _userPosts,
          likedIds: _likedPosts,
          followedIds: _followedUsers,
          likeCounts: _likeCounts,
          blockedAuthors: _blockedAuthors,
          shieldedPostIds: _shieldedPostIds,
          onEditProfile: _persistProfile,
          teenModeEnabled: _teenModeEnabled,
          onTeenModeChanged: _onTeenModeChanged,
          onUnblockAuthor: _unblockAuthor,
          onUnshieldPost: _unshieldPost,
          onLikeToggle: _toggleLike,
          onFollowToggle: _toggleFollow,
          onBlockAuthor: _blockAuthor,
          onShieldPost: _shieldPost,
          onReportPost: _reportPost,
          onDeletePost: _deleteUserPost,
          onGoPlaza: () => setState(() => _tabIndex = 2),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
