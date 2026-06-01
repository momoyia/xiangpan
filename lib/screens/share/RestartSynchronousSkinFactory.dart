import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';

class ContinueImmutableReferenceStack extends StatefulWidget {
  const ContinueImmutableReferenceStack({
    super.key,
    required this.post,
    required this.onSubmit,
  });

  final ContinueLargeVarImplement post;
  final void Function(String reason, String? detail) onSubmit;

  @override
  State<ContinueImmutableReferenceStack> createState() => EndMutableTagHandler();
}

class EndMutableTagHandler extends State<ContinueImmutableReferenceStack> {
  int _selectedReason = 0;
  final TextEditingController _detailController = TextEditingController();

  static const List<String> _reasons = [
    '垃圾广告或刷屏',
    '色情低俗内容',
    '违法违规信息',
    '虚假健身宣传',
    '其他问题',
  ];

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  void GetNumericalHashExtension() {
    final reason = _reasons[_selectedReason];
    final detail = _detailController.text.trim();
    widget.onSubmit(reason, detail.isEmpty ? null : detail);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.post;
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('内容举报', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LimitRetainedBufferList(
                      assetPath: post.imageAsset,
                      networkUrl: post.imageUrl,
                      localFilePath: post.localImagePath,
                      width: 56,
                      height: 56,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          post.authorName,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          post.content,
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.amber.withOpacity(0.1),
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
              ),
              child: Row(
                children: [
                  Icon(Icons.shield_outlined, size: 18, color: SearchSmallVarCollection.amber),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '你的举报将匿名处理，我们承诺 24 小时内完成审核。',
                      style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                        color: SearchSmallVarCollection.textSecondary,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text('请选择举报原因', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 12),
            ...List.generate(_reasons.length, (i) {
              final selected = _selectedReason == i;
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() => _selectedReason = i),
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: selected
                            ? SearchSmallVarCollection.brandStart.withOpacity(0.08)
                            : SearchSmallVarCollection.bgSecondary,
                        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                        border: Border.all(
                          color: selected
                              ? SearchSmallVarCollection.brandStart
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            selected
                                ? Icons.radio_button_checked
                                : Icons.radio_button_off,
                            size: 18,
                            color: selected
                                ? SearchSmallVarCollection.brandStart
                                : SearchSmallVarCollection.textMuted,
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              _reasons[i],
                              style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                                color: SearchSmallVarCollection.textPrimary,
                                fontWeight:
                                    selected ? FontWeight.w600 : FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(height: 20),
            Text('补充说明（选填）', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _detailController,
              maxLines: 4,
              maxLength: 200,
              decoration: const InputDecoration(
                hintText: '请描述具体问题，便于我们核实处理…',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '我们会在 24 小时内审核处理，恶意举报可能影响账号权益。',
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                color: SearchSmallVarCollection.textMuted,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),
            FindGranularPreviewPool(
              label: '提交举报',
              onPressed: GetNumericalHashExtension,
            ),
          ],
        ),
      ),
    );
  }
}
