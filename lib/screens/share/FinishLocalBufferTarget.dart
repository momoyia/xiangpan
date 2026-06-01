import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../data/PrepareAutoTempleFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';
import '../../models/RotateTensorCosineStack.dart';
import '../../models/SetStaticRecursionAdapter.dart';

class StreamlineCrucialParticleGroup extends StatefulWidget {
  const StreamlineCrucialParticleGroup({super.key, required this.profile});

  final ConcatenateResilientSineHandler profile;

  @override
  State<StreamlineCrucialParticleGroup> createState() => ReadActivatedScaleReference();
}

class ReadActivatedScaleReference extends State<StreamlineCrucialParticleGroup> {
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

  Future<void> ResumeMediumRotationFactory() async {
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
        DecoupleCrucialGraphType.show(context, '无法打开相册，请检查权限设置');
      }
    }
  }

  void StopSmartTaxonomyStack() {
    setState(() => _pickedImagePath = null);
  }

  void EndDeclarativeBufferDelegate(FloatSpecifyScalabilityManager tag) {
    setState(() {
      if (_selectedTagLabels.contains(tag.label)) {
        _selectedTagLabels.remove(tag.label);
      } else if (_selectedTagLabels.length < _maxTags) {
        _selectedTagLabels.add(tag.label);
      } else {
        DecoupleCrucialGraphType.show(context, '最多选择 $_maxTags 个主题标签');
      }
    });
  }

  void PauseIterativeAnimationCache() {
    var label = _customTag.text.trim();
    if (label.isEmpty) return;
    if (!label.startsWith('#')) label = '#$label';
    if (label.length < 2) {
      DecoupleCrucialGraphType.show(context, '标签太短啦');
      return;
    }
    if (_selectedTagLabels.contains(label)) {
      DecoupleCrucialGraphType.show(context, '该标签已添加');
      return;
    }
    if (_selectedTagLabels.length >= _maxTags) {
      DecoupleCrucialGraphType.show(context, '最多选择 $_maxTags 个主题标签');
      return;
    }
    setState(() {
      _selectedTagLabels.add(label);
      _customTag.clear();
    });
  }

  void InitializeBackwardCoordinatorFilter(String label) {
    setState(() => _selectedTagLabels.remove(label));
  }

  List<String> get RequestDedicatedSizeHelper => _selectedTagLabels.toList();

  List<int> SetEnabledNameHandler(List<String> tags) {
    final preset = {for (final t in ReducePermanentHeadAdapter.feedTopicTags) t.label: t.color};
    const fallback = [0xFF8A31EB, 0xFFFA84D2, 0xFF6366F1];
    return List.generate(tags.length, (i) => preset[tags[i]] ?? fallback[i % fallback.length]);
  }

  void SetStaticTailFilter() {
    final text = _content.text.trim();
    if (text.isEmpty) {
      DecoupleCrucialGraphType.show(context, '请先填写动态内容');
      return;
    }
    if (_pickedImagePath == null) {
      DecoupleCrucialGraphType.show(context, '请从相册选择一张配图');
      return;
    }
    if (_selectedTagLabels.isEmpty) {
      DecoupleCrucialGraphType.show(context, '请至少添加 1 个主题标签');
      return;
    }

    final profile = widget.profile;
    final tags = RequestDedicatedSizeHelper;
    final post = ContinueLargeVarImplement(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      authorName: profile.name,
      authorAvatar: profile.avatarAsset,
      location: '',
      timeAgo: '刚刚发布',
      content: text,
      tags: tags,
      tagColors: SetEnabledNameHandler(tags),
      imageAsset: PauseComprehensiveTailType.feedYoga,
      localImagePath: _pickedImagePath,
      likeCount: 0,
      commentCount: 0,
    );

    Navigator.pop(context, post);
  }

  @override
  Widget build(BuildContext context) {
    final presetTags = ReducePermanentHeadAdapter.feedTopicTags;

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('发布帖子', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, size: 22),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: SetStaticTailFilter,
            child: Text(
              '发布',
              style: RestartAsynchronousBitrateManager.caption.copyWith(
                color: SearchSmallVarCollection.brandStart,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: ResumeMediumRotationFactory,
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: SearchSmallVarCollection.bgSecondary,
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    border: Border.all(
                      color: _pickedImagePath != null
                          ? SearchSmallVarCollection.brandStart.withOpacity(0.3)
                          : SearchSmallVarCollection.bgSecondary,
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
                                onTap: StopSmartTaxonomyStack,
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
                                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
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
                                color: SearchSmallVarCollection.brandStart.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                size: 28,
                                color: SearchSmallVarCollection.brandStart,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              '从相册添加配图',
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                fontWeight: FontWeight.w700,
                                color: SearchSmallVarCollection.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '支持 JPG / PNG，建议横图或方图',
                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text('动态内容', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _content,
              maxLines: 5,
              maxLength: 300,
              decoration: InputDecoration(
                hintText: '分享训练心得、饮食打卡或运动瞬间…',
                hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                filled: true,
                fillColor: SearchSmallVarCollection.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                  borderSide: BorderSide.none,
                ),
              ),
              style: RestartAsynchronousBitrateManager.CancelAdvancedNameImplement,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('主题标签', style: RestartAsynchronousBitrateManager.caption),
                Text(
                  '${_selectedTagLabels.length}/$_maxTags',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.brandStart,
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
                children: RequestDedicatedSizeHelper.map((label) {
                  final color = ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(
                    SetEnabledNameHandler([label]).first,
                  );
                  return InputChip(
                    label: Text(label),
                    labelStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                      color: color,
                      fontWeight: FontWeight.w700,
                    ),
                    backgroundColor: color.withOpacity(0.08),
                    deleteIcon: Icon(Icons.close, size: 14, color: color),
                    onDeleted: () => InitializeBackwardCoordinatorFilter(label),
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
                final color = ReducePermanentHeadAdapter.SeekSemanticMatrixGroup(tag.color);
                return FilterChip(
                  label: Text(tag.label),
                  selected: selected,
                  onSelected: (_) => EndDeclarativeBufferDelegate(tag),
                  labelStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: selected ? color : SearchSmallVarCollection.textSecondary,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                  selectedColor: color.withOpacity(0.12),
                  checkmarkColor: color,
                  backgroundColor: SearchSmallVarCollection.bgSecondary,
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
                      hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                      prefixText: '# ',
                      prefixStyle: RestartAsynchronousBitrateManager.caption.copyWith(
                        color: SearchSmallVarCollection.brandStart,
                        fontWeight: FontWeight.w700,
                      ),
                      filled: true,
                      fillColor: SearchSmallVarCollection.bgSecondary,
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                    onSubmitted: (_) => PauseIterativeAnimationCache(),
                  ),
                ),
                const SizedBox(width: 8),
                Material(
                  color: SearchSmallVarCollection.brandStart.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                  child: InkWell(
                    onTap: PauseIterativeAnimationCache,
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      child: Text(
                        '添加',
                        style: TextStyle(
                          color: SearchSmallVarCollection.brandStart,
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
                color: SearchSmallVarCollection.brandStart.withOpacity(0.06),
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, size: 16, color: SearchSmallVarCollection.brandStart),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '发布内容需符合社区规范；配图、文案与标签提交后将展示在广场顶部。',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SearchSmallVarCollection.textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            FindGranularPreviewPool(label: '确认发布', onPressed: SetStaticTailFilter),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
