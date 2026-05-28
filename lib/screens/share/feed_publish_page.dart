import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/image_assets.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_toast.dart';
import '../../core/widgets/gradient_button.dart';
import '../../data/mock_data.dart';
import '../../models/feed_post.dart';
import '../../models/feed_topic_tag.dart';
import '../../models/user_profile.dart';

class FeedPublishPage extends StatefulWidget {
  const FeedPublishPage({super.key, required this.profile});

  final UserProfile profile;

  @override
  State<FeedPublishPage> createState() => _FeedPublishPageState();
}

class _FeedPublishPageState extends State<FeedPublishPage> {
  final TextEditingController _content = TextEditingController();
  final TextEditingController _customTag = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String? _pickedImagePath;
  final Set<String> _selectedTagLabels = {};
  static const int _maxTags = 3;

  @override
  void dispose() {
    _content.dispose();
    _customTag.dispose();
    super.dispose();
  }

  Future<void> _pickFromGallery() async {
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );
      if (file != null && mounted) {
        setState(() => _pickedImagePath = file.path);
      }
    } catch (_) {
      if (mounted) {
        AppToast.show(context, '无法打开相册，请检查权限设置');
      }
    }
  }

  void _removeImage() {
    setState(() => _pickedImagePath = null);
  }

  void _toggleTag(FeedTopicTag tag) {
    setState(() {
      if (_selectedTagLabels.contains(tag.label)) {
        _selectedTagLabels.remove(tag.label);
      } else if (_selectedTagLabels.length < _maxTags) {
        _selectedTagLabels.add(tag.label);
      } else {
        AppToast.show(context, '最多选择 $_maxTags 个主题标签');
      }
    });
  }

  void _addCustomTag() {
    var label = _customTag.text.trim();
    if (label.isEmpty) return;
    if (!label.startsWith('#')) label = '#$label';
    if (label.length < 2) {
      AppToast.show(context, '标签太短啦');
      return;
    }
    if (_selectedTagLabels.contains(label)) {
      AppToast.show(context, '该标签已添加');
      return;
    }
    if (_selectedTagLabels.length >= _maxTags) {
      AppToast.show(context, '最多选择 $_maxTags 个主题标签');
      return;
    }
    setState(() {
      _selectedTagLabels.add(label);
      _customTag.clear();
    });
  }

  void _removeSelectedTag(String label) {
    setState(() => _selectedTagLabels.remove(label));
  }

  List<String> get _orderedTags => _selectedTagLabels.toList();

  List<int> _tagColorsFor(List<String> tags) {
    final preset = {for (final t in MockData.feedTopicTags) t.label: t.color};
    const fallback = [0xFF8A31EB, 0xFFFA84D2, 0xFF6366F1];
    return List.generate(tags.length, (i) => preset[tags[i]] ?? fallback[i % fallback.length]);
  }

  void _publish() {
    final text = _content.text.trim();
    if (text.isEmpty) {
      AppToast.show(context, '请先填写动态内容');
      return;
    }
    if (_pickedImagePath == null) {
      AppToast.show(context, '请从相册选择一张配图');
      return;
    }
    if (_selectedTagLabels.isEmpty) {
      AppToast.show(context, '请至少添加 1 个主题标签');
      return;
    }

    final profile = widget.profile;
    final tags = _orderedTags;
    final post = FeedPost(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      authorName: profile.name,
      authorAvatar: profile.avatarAsset,
      location: '',
      timeAgo: '刚刚发布',
      content: text,
      tags: tags,
      tagColors: _tagColorsFor(tags),
      imageAsset: ImageAssets.feedYoga,
      localImagePath: _pickedImagePath,
      likeCount: 0,
      commentCount: 0,
    );

    Navigator.pop(context, post);
  }

  @override
  Widget build(BuildContext context) {
    final presetTags = MockData.feedTopicTags;

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('发布帖子', style: AppTextStyles.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 22),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: _publish,
            child: Text(
              '发布',
              style: AppTextStyles.caption.copyWith(
                color: AppColors.brandStart,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConstants.safeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _pickFromGallery,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.bgSecondary,
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(
                      color: _pickedImagePath != null
                          ? AppColors.brandStart.withOpacity(0.3)
                          : AppColors.bgSecondary,
                    ),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: _pickedImagePath != null
                      ? Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.file(
                              File(_pickedImagePath!),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: _removeImage,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 12,
                              bottom: 12,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.45),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.photo_library_outlined,
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '点击更换相册图片',
                                      style: AppTextStyles.captionSmall.copyWith(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: AppColors.brandStart.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 28,
                                color: AppColors.brandStart,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '从相册添加配图',
                              style: AppTextStyles.caption.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '支持 JPG / PNG，建议横图或方图',
                              style: AppTextStyles.captionSmall,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('动态内容', style: AppTextStyles.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _content,
              maxLines: 5,
              maxLength: 300,
              decoration: InputDecoration(
                hintText: '分享训练心得、饮食打卡或运动瞬间…',
                hintStyle: AppTextStyles.captionSmall,
                filled: true,
                fillColor: AppColors.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  borderSide: BorderSide.none,
                ),
              ),
              style: AppTextStyles.body,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('主题标签', style: AppTextStyles.caption),
                Text(
                  '${_selectedTagLabels.length}/$_maxTags',
                  style: AppTextStyles.captionSmall.copyWith(
                    color: AppColors.brandStart,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            if (_selectedTagLabels.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _orderedTags.map((label) {
                  final color = MockData.tagColor(
                    _tagColorsFor([label]).first,
                  );
                  return InputChip(
                    label: Text(label),
                    labelStyle: AppTextStyles.captionSmall.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                    backgroundColor: color.withOpacity(0.08),
                    deleteIcon: Icon(Icons.close, size: 14, color: color),
                    onDeleted: () => _removeSelectedTag(label),
                    side: BorderSide(color: color.withOpacity(0.25)),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
            ],
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: presetTags.map((tag) {
                final selected = _selectedTagLabels.contains(tag.label);
                final color = MockData.tagColor(tag.color);
                return FilterChip(
                  label: Text(tag.label),
                  selected: selected,
                  onSelected: (_) => _toggleTag(tag),
                  labelStyle: AppTextStyles.captionSmall.copyWith(
                    color: selected ? color : AppColors.textSecondary,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                  selectedColor: color.withOpacity(0.12),
                  checkmarkColor: color,
                  backgroundColor: AppColors.bgSecondary,
                  side: BorderSide(
                    color: selected ? color : Colors.transparent,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _customTag,
                    decoration: InputDecoration(
                      hintText: '自定义标签，如：晨间仪式感',
                      hintStyle: AppTextStyles.captionSmall,
                      prefixText: '# ',
                      prefixStyle: AppTextStyles.caption.copyWith(
                        color: AppColors.brandStart,
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: AppColors.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusSmall),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => _addCustomTag(),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: AppColors.brandStart.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                  child: InkWell(
                    onTap: _addCustomTag,
                    borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Text(
                        '添加',
                        style: TextStyle(
                          color: AppColors.brandStart,
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.brandStart.withOpacity(0.06),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 16, color: AppColors.brandStart),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '发布内容需符合社区规范；配图、文案与标签提交后将展示在广场顶部。',
                      style: AppTextStyles.captionSmall.copyWith(
                        color: AppColors.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            GradientButton(label: '确认发布', onPressed: _publish),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
