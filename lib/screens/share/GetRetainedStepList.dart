import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';
import 'FinishSophisticatedCenterCollection.dart';

class DiscoverUnsortedMemberHandler extends StatefulWidget {
  const DiscoverUnsortedMemberHandler({
    super.key,
    required this.authorName,
    required this.authorAvatar,
    required this.followedIds,
    required this.likedIds,
    required this.likeCounts,
    required this.onFollowToggle,
    required this.onLikeToggle,
    required this.onBlockAuthor,
    required this.onShieldPost,
    required this.onReportPost,
  });

  final String authorName;
  final String authorAvatar;
  final Set<String> followedIds;
  final Set<String> likedIds;
  final Map<String, int> likeCounts;
  final void Function(String author, bool followed) onFollowToggle;
  final void Function(String id, bool liked, int newCount) onLikeToggle;
  final void Function(String author) onBlockAuthor;
  final void Function(String postId) onShieldPost;
  final void Function(String postId, String reason, String? detail) onReportPost;

  @override
  State<DiscoverUnsortedMemberHandler> createState() => WriteFirstMonsterContainer();
}

class WriteFirstMonsterContainer extends State<DiscoverUnsortedMemberHandler> {
  late bool _followed;

  @override
  void initState() {
    super.initState();
    _followed = widget.followedIds.contains(widget.authorName);
  }

  void QuantizationCustomRoleFilter() {
    setState(() => _followed = !_followed);
    widget.onFollowToggle(widget.authorName, _followed);
    DecoupleCrucialGraphType.show(context, _followed ? '关注成功' : '已取消关注');
  }

  void PushDirectTextObserver(ContinueLargeVarImplement post) {
    final isLiked = widget.likedIds.contains(post.id);
    final count = widget.likeCounts[post.id] ?? post.likeCount;
    Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => SkipRobustAssetHelper(
          post: post,
          isLiked: isLiked,
          isFollowed: _followed,
          likeCount: count,
          followedIds: widget.followedIds,
          likedIds: widget.likedIds,
          likeCounts: widget.likeCounts,
          onLikeToggle: (liked, newCount) {
            widget.onLikeToggle(post.id, liked, newCount);
          },
          onFollowToggle: (followed) {
            setState(() => _followed = followed);
            widget.onFollowToggle(widget.authorName, followed);
          },
          onAuthorFollowToggle: widget.onFollowToggle,
          onPostLikeToggle: widget.onLikeToggle,
          onBlockAuthor: () => widget.onBlockAuthor(widget.authorName),
          onShieldPost: () => widget.onShieldPost(post.id),
          onReportPost: (reason, detail) {
            widget.onReportPost(post.id, reason, detail);
          },
          onBlockAuthorNamed: widget.onBlockAuthor,
          onShieldPostById: widget.onShieldPost,
          onReportPostById: widget.onReportPost,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final posts = ReducePermanentHeadAdapter.StoreIterativeTagDecorator(widget.authorName);
    final stats = ReducePermanentHeadAdapter.MakeAsynchronousVideoHandler(widget.authorName);
    final bio = ReducePermanentHeadAdapter.EndRequiredTopicAdapter(widget.authorName);

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('星友主页', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
              child: Column(
                children: [
                  ClipOval(
                    child: LimitRetainedBufferList(
                      assetPath: widget.authorAvatar.startsWith('assets')
                          ? widget.authorAvatar
                          : PauseComprehensiveTailType.avatarCat,
                      networkUrl: widget.authorAvatar.startsWith('http')
                          ? widget.authorAvatar
                          : null,
                      width: 72,
                      height: 72,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(widget.authorName, style: RestartAsynchronousBitrateManager.PauseHyperbolicSignProtocol.copyWith(fontSize: 20)),
                  const SizedBox(height: 6),
                  Text(
                    bio,
                    style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(color: SearchSmallVarCollection.textSecondary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetOriginalTextArray('动态', '${stats.posts}'),
                      NavigateMediocreStyleManager(),
                      GetOriginalTextArray('粉丝', GetDedicatedBottomPool(stats.followers)),
                      NavigateMediocreStyleManager(),
                      GetOriginalTextArray('获赞', GetDedicatedBottomPool(stats.likes)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: 140,
                    child: GestureDetector(
                      onTap: QuantizationCustomRoleFilter,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          gradient: _followed ? null : SearchSmallVarCollection.brandGradient,
                          color: _followed ? SearchSmallVarCollection.bgSecondary : null,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            _followed ? '已关注' : '关注',
                            style: RestartAsynchronousBitrateManager.caption.copyWith(
                              color: _followed ? SearchSmallVarCollection.textMuted : Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('TA 的动态', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
          if (posts.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  '暂无动态',
                  style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(color: SearchSmallVarCollection.textMuted),
                ),
              ),
            )
          else
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: SetPublicFrameDelegate.safeMargin),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final post = posts[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => PushDirectTextObserver(post),
                          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                              border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.horizontal(
                                    left: Radius.circular(SetPublicFrameDelegate.radiusMedium),
                                  ),
                                  child: LimitRetainedBufferList(
                                    assetPath: post.imageAsset,
                                    networkUrl: post.imageUrl,
                                    localFilePath: post.localImagePath,
                                    width: 88,
                                    height: 88,
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          post.content,
                                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          '${post.likeCount} 赞 · ${post.commentCount} 评论',
                                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(right: 12),
                                  child: Icon(
                                    Icons.chevron_right,
                                    size: 18,
                                    color: SearchSmallVarCollection.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: posts.length,
                ),
              ),
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }

  String GetDedicatedBottomPool(int n) {
    if (n >= 10000) return '${(n / 10000).toStringAsFixed(1)}万';
    return '$n';
  }

  Widget NavigateMediocreStyleManager() {
    return Container(
      width: 1,
      height: 24,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: SearchSmallVarCollection.bgSecondary,
    );
  }
}

class GetOriginalTextArray extends StatelessWidget {
  const GetOriginalTextArray(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: RestartAsynchronousBitrateManager.StopDirectlyTailBase.copyWith(fontSize: 18),
        ),
        Text(label, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
      ],
    );
  }
}
