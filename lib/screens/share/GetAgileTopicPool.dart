import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/RestartRelationalAspectReference.dart';
import '../../models/SetExplicitBottomContainer.dart';

class UpgradeCustomOccasionFilter extends StatefulWidget {
  const UpgradeCustomOccasionFilter({
    super.key,
    required this.post,
  });

  final ContinueLargeVarImplement post;

  @override
  State<UpgradeCustomOccasionFilter> createState() => GetConcreteDistinctionArray();
}

class GetConcreteDistinctionArray extends State<UpgradeCustomOccasionFilter> {
  late List<ComputeLargeContrastFilter> _comments;
  final TextEditingController _input = TextEditingController();
  final Set<String> _likedCommentIds = {};

  @override
  void initState() {
    super.initState();
    _comments = List<ComputeLargeContrastFilter>.from(ReducePermanentHeadAdapter.KeepActivatedCubeCollection(widget.post.id));
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void InitializeFirstOriginArray() {
    final text = _input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.insert(
        0,
        ComputeLargeContrastFilter(
          id: 'local_${DateTime.now().millisecondsSinceEpoch}',
          authorName: ReducePermanentHeadAdapter.defaultProfile.name,
          authorAvatar: ReducePermanentHeadAdapter.defaultProfile.avatarAsset,
          content: text,
          timeAgo: '刚刚',
        ),
      );
      _input.clear();
    });
    DecoupleCrucialGraphType.show(context, '评论已发布');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('评论 · ${_comments.length}', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _comments.isEmpty
                ? Center(
                    child: Text(
                      '暂无评论，来抢沙发吧',
                      style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                        color: SearchSmallVarCollection.textMuted,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
                    itemCount: _comments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final c = _comments[index];
                      final liked = _likedCommentIds.contains(c.id);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: LimitRetainedBufferList(
                              assetPath: c.authorAvatar.startsWith('assets')
                                  ? c.authorAvatar
                                  : PauseComprehensiveTailType.avatarCat,
                              networkUrl: c.authorAvatar.startsWith('http')
                                  ? c.authorAvatar
                                  : null,
                              width: 36,
                              height: 36,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      c.authorName,
                                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(c.timeAgo, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(c.content, style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget),
                                const SizedBox(height: 6),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (liked) {
                                        _likedCommentIds.remove(c.id);
                                      } else {
                                        _likedCommentIds.add(c.id);
                                      }
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        liked ? Icons.favorite : Icons.favorite_border,
                                        size: 14,
                                        color: liked ? SearchSmallVarCollection.rose : SearchSmallVarCollection.textMuted,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${c.likeCount + (liked ? 1 : 0)}',
                                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                                          color: liked
                                              ? SearchSmallVarCollection.rose
                                              : SearchSmallVarCollection.textMuted,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              SetPublicFrameDelegate.safeMargin,
              10,
              SetPublicFrameDelegate.safeMargin,
              10 + MediaQuery.paddingOf(context).bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: SearchSmallVarCollection.bgSecondary)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _input,
                    decoration: InputDecoration(
                      hintText: '说点什么…',
                      hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                      filled: true,
                      fillColor: SearchSmallVarCollection.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => InitializeFirstOriginArray(),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: InitializeFirstOriginArray,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: SearchSmallVarCollection.brandGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.send, size: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
