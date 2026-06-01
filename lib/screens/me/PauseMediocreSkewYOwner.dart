import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/SetStaticRecursionAdapter.dart';

class SetLiteAssetReference extends StatefulWidget {
  const SetLiteAssetReference({
    super.key,
    required this.profile,
    required this.onSave,
  });

  final ConcatenateResilientSineHandler profile;
  final ValueChanged<ConcatenateResilientSineHandler> onSave;

  @override
  State<SetLiteAssetReference> createState() => ExecuteSubstantialParameterOwner();
}

class ExecuteSubstantialParameterOwner extends State<SetLiteAssetReference> {
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  final ImagePicker _picker = ImagePicker();

  String _selectedAvatarAsset = PauseComprehensiveTailType.avatarCat;
  String? _pickedAvatarPath;

  static const List<Map<String, String>> _avatarOptions = [
    {'asset': PauseComprehensiveTailType.avatarCat, 'label': '萌猫'},
    {'asset': PauseComprehensiveTailType.avatarAnimal, 'label': '动物'},
    {'asset': PauseComprehensiveTailType.avatarLandscape, 'label': '风景'},
    {'asset': PauseComprehensiveTailType.avatarFood, 'label': '美食'},
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.profile.name);
    _bioController = TextEditingController(text: widget.profile.bio);
    _selectedAvatarAsset = widget.profile.avatarAsset;
    _pickedAvatarPath = widget.profile.avatarLocalPath;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> EndDiscardedUnaryImplement() async {
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 88,
      );
      if (file != null && mounted) {
        setState(() => _pickedAvatarPath = file.path);
      }
    } catch (_) {
      if (mounted) {
        DecoupleCrucialGraphType.show(context, '无法打开相册，请检查权限设置');
      }
    }
  }

  void SetStandaloneBottomAdapter(String asset) {
    setState(() {
      _selectedAvatarAsset = asset;
      _pickedAvatarPath = null;
    });
  }

  void SetGeometricMultiplicationAdapter() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      DecoupleCrucialGraphType.show(context, '昵称不能为空');
      return;
    }

    widget.onSave(
      widget.profile.copyWith(
        name: name,
        bio: _bioController.text.trim(),
        avatarAsset: _selectedAvatarAsset,
        avatarUrl: null,
        clearAvatarUrl: true,
        avatarLocalPath: _pickedAvatarPath,
        clearAvatarLocalPath: _pickedAvatarPath == null,
      ),
    );
    Navigator.pop(context);
  }

  Widget StoreMainLayerReference() {
    if (_pickedAvatarPath != null && File(_pickedAvatarPath!).existsSync()) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
        child: Image.file(
          File(_pickedAvatarPath!),
          width: 80,
          height: 80,
          fit: BoxFit.cover,
        ),
      );
    }
    return ClipRRect(
      borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
      child: LimitRetainedBufferList(
        assetPath: _selectedAvatarAsset,
        networkUrl: widget.profile.avatarUrl,
        width: 80,
        height: 80,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 12,
        bottom: MediaQuery.of(context).padding.bottom + 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 48,
                height: 4,
                decoration: BoxDecoration(
                  color: SearchSmallVarCollection.bgSecondary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('编辑资料', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, size: 18),
                  style: IconButton.styleFrom(
                    backgroundColor: SearchSmallVarCollection.bgSecondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text('头像', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: EndDiscardedUnaryImplement,
                child: Stack(
                  children: [
                    StoreMainLayerReference(),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          gradient: SearchSmallVarCollection.brandGradient,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: GestureDetector(
                onTap: EndDiscardedUnaryImplement,
                child: Text(
                  '从相册选择头像',
                  style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: SearchSmallVarCollection.brandStart,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('或选择默认头像', style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
            const SizedBox(height: 10),
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _avatarOptions.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (context, i) {
                  final opt = _avatarOptions[i];
                  final selected =
                      _pickedAvatarPath == null && _selectedAvatarAsset == opt['asset'];
                  return GestureDetector(
                    onTap: () => SetStandaloneBottomAdapter(opt['asset']!),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: selected
                                  ? SearchSmallVarCollection.brandStart
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: LimitRetainedBufferList(
                              assetPath: opt['asset']!,
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(opt['label']!, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Text('昵称', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 6),
            TextField(
              controller: _nameController,
              maxLength: 20,
              decoration: InputDecoration(
                hintText: '输入你的昵称',
                hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                filled: true,
                fillColor: SearchSmallVarCollection.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text('个人简介', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 6),
            TextField(
              controller: _bioController,
              maxLines: 3,
              maxLength: 80,
              decoration: InputDecoration(
                hintText: '介绍一下自己，例如训练习惯或座右铭…',
                hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                filled: true,
                fillColor: SearchSmallVarCollection.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide.none,
                      backgroundColor: SearchSmallVarCollection.bgSecondary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                      ),
                    ),
                    child: Text(
                      '取消',
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w700,
                        color: SearchSmallVarCollection.textMuted,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: FindGranularPreviewPool(
                    label: '保存',
                    onPressed: SetGeometricMultiplicationAdapter,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
