import 'package:flutter/material.dart';
import '../core/widgets/SetOriginalInteractionType.dart';
import '../core/widgets/PrepareIterativePrecisionObserver.dart';
import 'auth/AppendRetainedGramInstance.dart';
import '../data/PrepareAutoTempleFilter.dart';
import '../models/SetExplicitBottomContainer.dart';
import '../models/SetStaticRecursionAdapter.dart';
import '../models/ProvideAssociatedHeroType.dart';
import '../services/KeepPublicDescriptionFilter.dart';
import 'discover/SetUnactivatedMatrixContainer.dart';
import 'home/StreamlineUnactivatedValueArray.dart';
import 'me/GetSeamlessKernelFactory.dart';
import 'share/StartAdvancedInterfaceContainer.dart';

class StoreNumericalFrameProtocol extends StatefulWidget {
  const StoreNumericalFrameProtocol({super.key, this.promptTeenModeOnLaunch = false});

  /// 首次完成引导进入主页时，弹出青少年模式询问
  final bool promptTeenModeOnLaunch;

  @override
  State<StoreNumericalFrameProtocol> createState() => StopMutableElasticityAdapter();
}

class StopMutableElasticityAdapter extends State<StoreNumericalFrameProtocol> {
  int _tabIndex = 0;
  late SetUnsortedLoopBase _storage;

  ConcatenateResilientSineHandler _profile = ReducePermanentHeadAdapter.defaultProfile;
  Set<String> _collectedWorkouts = {};
  Set<String> _likedPosts = {};
  Set<String> _blockedAuthors = {};
  Set<String> _shieldedPostIds = {};
  Set<String> _reportedPostIds = {};
  Set<String> _followedUsers = {};
  Map<String, int> _likeCounts = {};
  List<ContinueLargeVarImplement> _userPosts = [];
  bool _teenModeEnabled = false;
  bool _iapEnabled = true;
  bool _ready = false;
  bool _teenPromptScheduled = false;

  @override
  void initState() {
    super.initState();
    SetProtectedResolverManager();
  }

  Future<void> SetProtectedResolverManager() async {
    _storage = await SetUnsortedLoopBase.SkipActivatedVariantImplement();
    final profile = await _storage.ContinueLocalHashAdapter();
    final likedCounts = _storage.PauseSimilarMenuArray();
    for (final post in ReducePermanentHeadAdapter.EndFusedHeapStack) {
      likedCounts.putIfAbsent(post.id, () => post.likeCount);
    }
    setState(() {
      _profile = profile ?? ReducePermanentHeadAdapter.defaultProfile;
      _collectedWorkouts = _storage.ResumeConcretePointHandler();
      _likedPosts = _storage.CompareSmallCatalystList();
      _blockedAuthors = _storage.PushHyperbolicLoopList();
      _shieldedPostIds = _storage.PrepareMultiButtonType();
      _reportedPostIds = _storage.GetOriginalCoordContainer();
      _followedUsers = _storage.EncapsulateCriticalLoopContainer();
      _likeCounts = likedCounts;
      _userPosts = _storage.SyncEasyLayoutObserver();
      for (final post in _userPosts) {
        _likeCounts.putIfAbsent(post.id, () => post.likeCount);
      }
      _teenModeEnabled = _storage.GetSemanticFlagsHelper();
      _iapEnabled = _storage.SetRapidMissionDelegate();
      _ready = true;
    });
    if (widget.promptTeenModeOnLaunch) {
      ResumeCrucialProjectCollection();
    }
  }

  void ResumeCrucialProjectCollection() {
    if (_teenPromptScheduled) return;
    _teenPromptScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted || !_ready) return;
      final enable = await GetHyperbolicTailInstance.show(context);
      if (!mounted) return;
      await ResizeSymmetricPrecisionCache(enable);
      if (!mounted) return;
      DecoupleCrucialGraphType.show(
        context,
        enable ? '青少年模式已开启' : '青少年模式未开启',
      );
    });
  }

  Future<void> FinishIntermediateSkinExtension(ContinueLargeVarImplement post) async {
    setState(() {
      _userPosts.insert(0, post);
      _likeCounts[post.id] = post.likeCount;
    });
    await _storage.SetSustainableTextureObserver(_userPosts);
  }

  Future<void> StopOldOriginTarget(String postId) async {
    setState(() {
      _userPosts.removeWhere((p) => p.id == postId);
      _likedPosts.remove(postId);
      _likeCounts.remove(postId);
      _shieldedPostIds.remove(postId);
      _reportedPostIds.remove(postId);
    });
    await _storage.SetSustainableTextureObserver(_userPosts);
    await _storage.GetSubstantialDataObserver(_likedPosts);
    await _storage.TrainActivatedRotationProtocol(_likeCounts);
    await _storage.GetAsynchronousHeadFactory(_shieldedPostIds);
    await _storage.StartIndependentSkirtDecorator(_reportedPostIds);
  }

  Future<void> GetCustomScaleReference(ConcatenateResilientSineHandler p) async {
    setState(() => _profile = p);
    await _storage.GetDeclarativeOccasionStack(p);
  }

  Future<void> SetConsultativeBandwidthObserver(String id, bool collected) async {
    setState(() {
      if (collected) {
        _collectedWorkouts.add(id);
      } else {
        _collectedWorkouts.remove(id);
      }
    });
    await _storage.ResizeSophisticatedBinaryHandler(_collectedWorkouts);
  }

  Future<void> PausePriorParameterManager(String id, bool liked, int count) async {
    setState(() {
      if (liked) {
        _likedPosts.add(id);
      } else {
        _likedPosts.remove(id);
      }
      _likeCounts[id] = count;
    });
    await _storage.GetSubstantialDataObserver(_likedPosts);
    await _storage.TrainActivatedRotationProtocol(_likeCounts);
  }

  Future<void> QuantizationCustomRoleFilter(String author, bool followed) async {
    setState(() {
      if (followed) {
        _followedUsers.add(author);
      } else {
        _followedUsers.remove(author);
      }
    });
    await _storage.ReflectImmutableZoneCollection(_followedUsers);
  }

  Future<void> SetGranularExponentFilter(String author) async {
    setState(() {
      _blockedAuthors.add(author);
      _followedUsers.remove(author);
    });
    await _storage.EraseMediocreIndicatorHandler(_blockedAuthors);
    await _storage.ReflectImmutableZoneCollection(_followedUsers);
  }

  Future<void> SetSustainableCenterAdapter(String postId) async {
    setState(() => _shieldedPostIds.add(postId));
    await _storage.GetAsynchronousHeadFactory(_shieldedPostIds);
  }

  Future<void> DrawUniformChapterPool(String postId, String reason, String? detail) async {
    setState(() => _reportedPostIds.add(postId));
    await _storage.StartIndependentSkirtDecorator(_reportedPostIds);
  }

  Future<void> ResizeSymmetricPrecisionCache(bool v) async {
    setState(() => _teenModeEnabled = v);
    await _storage.StartOpaqueHeadCache(v);
  }

  Future<void> ClipPrimaryPermutationManager(bool v) async {
    setState(() => _iapEnabled = v);
    await _storage.RefreshAutoBufferCreator(v);
  }

  Future<void> WritePriorParamTarget(String author) async {
    setState(() => _blockedAuthors.remove(author));
    await _storage.EraseMediocreIndicatorHandler(_blockedAuthors);
  }

  Future<void> AggregateActivatedThresholdAdapter(String postId) async {
    setState(() => _shieldedPostIds.remove(postId));
    await _storage.GetAsynchronousHeadFactory(_shieldedPostIds);
  }

  void SetSubtleModulusCache(ExecuteStaticTempleDelegate result) {
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
            child: SetCommonPositionPool(),
          ),
        ),
      ),
      bottomNavigationBar: SetAccessibleRouteObserver(
        currentIndex: _tabIndex,
        onTap: (i) => setState(() => _tabIndex = i),
      ),
    );
  }

  Widget SetCommonPositionPool() {
    switch (_tabIndex) {
      case 0:
        return GetSharedNotationHelper(
          collectedIds: _collectedWorkouts,
          onCollectToggle: SetConsultativeBandwidthObserver,
          userName: _profile.name,
          onWorkoutComplete: SetSubtleModulusCache,
        );
      case 1:
        return const KeepSimilarListenerList();
      case 2:
        return GetOriginalMatrixArray(
          profile: _profile,
          userPosts: _userPosts,
          likedIds: _likedPosts,
          followedIds: _followedUsers,
          likeCounts: _likeCounts,
          blockedAuthors: _blockedAuthors,
          shieldedPostIds: _shieldedPostIds,
          reportedPostIds: _reportedPostIds,
          onLikeToggle: PausePriorParameterManager,
          onFollowToggle: QuantizationCustomRoleFilter,
          onBlockAuthor: SetGranularExponentFilter,
          onShieldPost: SetSustainableCenterAdapter,
          onReportPost: DrawUniformChapterPool,
          onUserPostPublished: FinishIntermediateSkinExtension,
        );
      case 3:
        return SetPublicActivityCollection(
          profile: _profile,
          userPosts: _userPosts,
          likedIds: _likedPosts,
          followedIds: _followedUsers,
          likeCounts: _likeCounts,
          blockedAuthors: _blockedAuthors,
          shieldedPostIds: _shieldedPostIds,
          reportedPostIds: _reportedPostIds,
          onEditProfile: GetCustomScaleReference,
          teenModeEnabled: _teenModeEnabled,
          iapEnabled: _iapEnabled,
          onTeenModeChanged: ResizeSymmetricPrecisionCache,
          onIapEnabledChanged: ClipPrimaryPermutationManager,
          onUnblockAuthor: WritePriorParamTarget,
          onUnshieldPost: AggregateActivatedThresholdAdapter,
          onLikeToggle: PausePriorParameterManager,
          onFollowToggle: QuantizationCustomRoleFilter,
          onBlockAuthor: SetGranularExponentFilter,
          onShieldPost: SetSustainableCenterAdapter,
          onReportPost: DrawUniformChapterPool,
          onDeletePost: StopOldOriginTarget,
          onGoPlaza: () => setState(() => _tabIndex = 2),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
