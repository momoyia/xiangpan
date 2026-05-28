import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_image.dart';
import '../../core/widgets/app_toast.dart';
import '../../data/mock_data.dart';
import '../../models/feed_comment.dart';
import '../../models/feed_post.dart';

class FeedCommentsPage extends StatefulWidget {
  const FeedCommentsPage({
    super.key,
    required this.post,
  });

  final FeedPost post;

  @override
  State<FeedCommentsPage> createState() => _FeedCommentsPageState();
}

class _FeedCommentsPageState extends State<FeedCommentsPage> {
  late List<FeedComment> _comments;
  final TextEditingController _input = TextEditingController();
  final Set<String> _likedCommentIds = {};

  @override
  void initState() {
    super.initState();
    _comments = List<FeedComment>.from(MockData.feedCommentsForPost(widget.post.id));
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  void _sendComment() {
    final text = _input.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _comments.insert(
        0,
        FeedComment(
          id: 'local_${DateTime.now().millisecondsSinceEpoch}',
          authorName: MockData.defaultProfile.name,
          authorAvatar: MockData.defaultProfile.avatarAsset,
          content: text,
          timeAgo: '刚刚',
        ),
      );
      _input.clear();
    });
    AppToast.show(context, '评论已发布');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('评论 · ${_comments.length}', style: AppTextStyles.h2),
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
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(AppConstants.safeMargin),
                    itemCount: _comments.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, index) {
                      final c = _comments[index];
                      final liked = _likedCommentIds.contains(c.id);
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipOval(
                            child: AppImage(
                              assetPath: c.authorAvatar.startsWith('assets')
                                  ? c.authorAvatar
                                  : ImageAssets.avatarCat,
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
                                      style: AppTextStyles.caption.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(c.timeAgo, style: AppTextStyles.captionSmall),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(c.content, style: AppTextStyles.bodySmall),
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
                                        color: liked ? AppColors.rose : AppColors.textMuted,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${c.likeCount + (liked ? 1 : 0)}',
                                        style: AppTextStyles.captionSmall.copyWith(
                                          color: liked
                                              ? AppColors.rose
                                              : AppColors.textMuted,
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
              AppConstants.safeMargin,
              10,
              AppConstants.safeMargin,
              10 + MediaQuery.paddingOf(context).bottom,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: AppColors.bgSecondary)),
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
                      hintStyle: AppTextStyles.captionSmall,
                      filled: true,
                      fillColor: AppColors.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => _sendComment(),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendComment,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: AppColors.brandGradient,
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
