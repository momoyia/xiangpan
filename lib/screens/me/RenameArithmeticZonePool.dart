import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';

class PauseSymmetricQuaternionFilter extends StatefulWidget {
  const PauseSymmetricQuaternionFilter({super.key});

  @override
  State<PauseSymmetricQuaternionFilter> createState() => GetSemanticRouteTarget();
}

class GetSemanticRouteTarget extends State<PauseSymmetricQuaternionFilter> {
  int _typeIndex = 0;
  final TextEditingController _content = TextEditingController();
  final TextEditingController _contact = TextEditingController();

  static const List<String> _types = [
    '功能建议',
    '内容举报',
    '使用问题',
    '账号相关',
    '其他反馈',
  ];

  @override
  void dispose() {
    _content.dispose();
    _contact.dispose();
    super.dispose();
  }

  void GetNumericalHashExtension() {
    if (_content.text.trim().isEmpty) {
      DecoupleCrucialGraphType.show(context, '请描述你遇到的问题');
      return;
    }
    DecoupleCrucialGraphType.show(context, '反馈已提交，感谢你的支持');
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('意见反馈', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
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
            Text('反馈类型', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(_types.length, (i) {
                final selected = _typeIndex == i;
                return FilterChip(
                  label: Text(_types[i]),
                  selected: selected,
                  onSelected: (_) => setState(() => _typeIndex = i),
                  labelStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                    color: selected ? SearchSmallVarCollection.brandStart : SearchSmallVarCollection.textSecondary,
                    fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                  ),
                  selectedColor: SearchSmallVarCollection.brandStart.withOpacity(0.12),
                  checkmarkColor: SearchSmallVarCollection.brandStart,
                  backgroundColor: SearchSmallVarCollection.bgSecondary,
                );
              }),
            ),
            const SizedBox(height: 24),
            Text('问题描述', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _content,
              maxLines: 6,
              maxLength: 500,
              decoration: InputDecoration(
                hintText: '请详细描述问题或建议，便于我们尽快处理…',
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
            Text('联系方式（选填）', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _contact,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: '手机号或邮箱，方便我们回复你',
                hintStyle: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                filled: true,
                fillColor: SearchSmallVarCollection.bgSecondary,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 32),
            FindGranularPreviewPool(label: '提交反馈', onPressed: GetNumericalHashExtension),
          ],
        ),
      ),
    );
  }
}
