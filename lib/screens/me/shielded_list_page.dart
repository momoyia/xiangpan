import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';

class ShieldedListPage extends StatefulWidget {
  const ShieldedListPage({
    super.key,
    required this.postIds,
    required this.userPosts,
    required this.onUnshield,
  });

  final Set<String> postIds;
  final List<FeedPost> userPosts;
  final ValueChanged<String> onUnshield;

  @override
  State<ShieldedListPage> createState() => _ShieldedListPageState();
}

class _ShieldedListPageState extends State<ShieldedListPage> {
  late Set<String> _postIds;

  @override
  void initState() {
    super.initState();
    _postIds = Set<String>.from(widget.postIds);
  }

  void _unshield(String id) {
    widget.onUnshield(id);
    setState(() => _postIds.remove(id));
    AppToast.show(context, '已取消屏蔽');
  }

  List<({String id, FeedPost? post})> get _items {
    final items = <({String id, FeedPost? post})>[];
    for (final id in _postIds) {
      items.add((id: id, post: MockData.findPostById(id, userPosts: widget.userPosts)));
    }
    items.sort((a, b) => a.id.compareTo(b.id));
    return items;
  }

  @override
  Widget build(BuildContext context) {
    final items = _items;

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('屏蔽名单', style: AppTextStyles.h2),
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
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppConstants.safeMargin),
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final item = items[index];
                final post = item.post;
                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(color: AppColors.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      if (post != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AppImage(
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
                            color: AppColors.bgSecondary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.article_outlined, color: AppColors.textMuted),
                        ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post?.authorName ?? '已下架内容',
                              style: AppTextStyles.caption.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              post?.content ?? '动态 ID: ${item.id}',
                              style: AppTextStyles.captionSmall,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => _unshield(item.id),
                        child: Text(
                          '取消屏蔽',
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.brandStart,
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
