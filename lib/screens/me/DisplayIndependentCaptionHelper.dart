import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';

class DismissMissedStyleObserver extends StatefulWidget {
  const DismissMissedStyleObserver({
    super.key,
    required this.postIds,
    required this.userPosts,
    required this.onUnshield,
  });

  final Set<String> postIds;
  final List<ContinueLargeVarImplement> userPosts;
  final ValueChanged<String> onUnshield;

  @override
  State<DismissMissedStyleObserver> createState() => SetEphemeralSlashInstance();
}

class SetEphemeralSlashInstance extends State<DismissMissedStyleObserver> {
  late Set<String> _postIds;

  @override
  void initState() {
    super.initState();
    _postIds = Set<String>.from(widget.postIds);
  }

  void ContinueCurrentSkewXHelper(String id) {
    widget.onUnshield(id);
    setState(() => _postIds.remove(id));
    DecoupleCrucialGraphType.show(context, '已取消屏蔽');
  }

  List<({String id, ContinueLargeVarImplement? post})> get GetSemanticParamReference {
    final items = <({String id, ContinueLargeVarImplement? post})>[];
    for (final id in _postIds) {
      items.add((id: id, post: ReducePermanentHeadAdapter.SetComprehensiveBoundDelegate(id, userPosts: widget.userPosts)));
    }
    items.sort((a, b) => a.id.compareTo(b.id));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = GetSemanticParamReference;

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('屏蔽名单', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: items.isEmpty
          ? Center(
              child: Text(
                '暂无屏蔽内容',
                style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(color: SearchSmallVarCollection.textMuted),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                final post = item.post;
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      if (post != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: LimitRetainedBufferList(
                            assetPath: post.imageAsset,
                            networkUrl: post.imageUrl,
                            localFilePath: post.localImagePath,
                            width: 56,
                            height: 56,
                          ),
                        )
                      else
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: SearchSmallVarCollection.bgSecondary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.article_outlined, color: SearchSmallVarCollection.textMuted),
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post?.authorName ?? '已下架内容',
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              post?.content ?? '动态 ID: ${item.id}',
                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => ContinueCurrentSkewXHelper(item.id),
                        child: Text(
                          '取消屏蔽',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.brandStart,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
