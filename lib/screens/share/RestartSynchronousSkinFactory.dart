import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/constants/SetPrimaryVariablePool.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/UpgradeUnsortedPrecisionPool.dart';
import '../../core/widgets/GetSpecifyParamFilter.dart';
import '../../models/SetExplicitBottomContainer.dart';

class _ReportReasonOption {
  const _ReportReasonOption({
    required this.label,
    required this.icon,
  });

  final String label;
  final IconData icon;
}

const List<_ReportReasonOption> _reportReasons = [
  _ReportReasonOption(label: '垃圾广告或刷屏', icon: Icons.campaign_outlined),
  _ReportReasonOption(label: '色情低俗内容', icon: Icons.no_adult_content_outlined),
  _ReportReasonOption(label: '违法违规信息', icon: Icons.gavel_outlined),
  _ReportReasonOption(label: '虚假健身宣传', icon: Icons.fitness_center_outlined),
  _ReportReasonOption(label: '骚扰或人身攻击', icon: Icons.sentiment_very_dissatisfied_outlined),
  _ReportReasonOption(label: '其他问题', icon: Icons.more_horiz),
];

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

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  void GetNumericalHashExtension() {
    final reason = _reportReasons[_selectedReason].label;
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
            const GetPublicReportStepHeader(currentStep: 1),
            const SizedBox(height: 20),
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
                          '举报动态',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.textMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
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
            const GetPublicReportPrivacyBanner(),
            const SizedBox(height: 20),
            Text('请选择举报原因', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 12),
            GetPublicReportReasonList(
              selectedIndex: _selectedReason,
              onSelected: (i) => setState(() => _selectedReason = i),
            ),
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

class RestartSynchronousUserReport extends StatefulWidget {
  const RestartSynchronousUserReport({
    super.key,
    required this.authorName,
    required this.authorAvatar,
    required this.bio,
    required this.onSubmit,
  });

  final String authorName;
  final String authorAvatar;
  final String bio;
  final void Function(String reason, String? detail) onSubmit;

  @override
  State<RestartSynchronousUserReport> createState() => _RestartSynchronousUserReportState();
}

class _RestartSynchronousUserReportState extends State<RestartSynchronousUserReport> {
  int _selectedReason = 0;
  final TextEditingController _detailController = TextEditingController();

  @override
  void dispose() {
    _detailController.dispose();
    super.dispose();
  }

  void _submit() {
    final reason = _reportReasons[_selectedReason].label;
    final detail = _detailController.text.trim();
    widget.onSubmit(reason, detail.isEmpty ? null : detail);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('用户举报', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
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
            const GetPublicReportStepHeader(currentStep: 1),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
              ),
              child: Row(
                children: [
                  ClipOval(
                    child: LimitRetainedBufferList(
                      assetPath: widget.authorAvatar.startsWith('assets')
                          ? widget.authorAvatar
                          : PauseComprehensiveTailType.avatarCat,
                      networkUrl: widget.authorAvatar.startsWith('http')
                          ? widget.authorAvatar
                          : null,
                      width: 56,
                      height: 56,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '举报用户',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.textMuted,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.authorName,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (widget.bio.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.bio,
                            style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const GetPublicReportPrivacyBanner(),
            const SizedBox(height: 20),
            Text('请选择举报原因', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 12),
            GetPublicReportReasonList(
              selectedIndex: _selectedReason,
              onSelected: (i) => setState(() => _selectedReason = i),
            ),
            const SizedBox(height: 20),
            Text('补充说明（选填）', style: RestartAsynchronousBitrateManager.caption),
            const SizedBox(height: 8),
            TextField(
              controller: _detailController,
              maxLines: 4,
              maxLength: 200,
              decoration: const InputDecoration(
                hintText: '请描述该用户的违规行为，便于我们核实处理…',
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
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}

class GetPublicReportStepHeader extends StatelessWidget {
  const GetPublicReportStepHeader({required this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    const steps = ['选择原因', '补充说明', '提交审核'];
    return Row(
      children: List.generate(steps.length * 2 - 1, (i) {
        if (i.isOdd) {
          final stepIndex = i ~/ 2;
          return Expanded(
            child: Container(
              height: 2,
              color: stepIndex < currentStep
                  ? SearchSmallVarCollection.brandStart
                  : SearchSmallVarCollection.bgSecondary,
            ),
          );
        }
        final stepIndex = i ~/ 2;
        final active = stepIndex <= currentStep;
        return Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: active
                    ? SearchSmallVarCollection.brandStart
                    : SearchSmallVarCollection.bgSecondary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: active
                    ? const Icon(Icons.check, size: 14, color: Colors.white)
                    : Text(
                        '${stepIndex + 1}',
                        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                          color: SearchSmallVarCollection.textMuted,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              steps[stepIndex],
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                color: active
                    ? SearchSmallVarCollection.brandStart
                    : SearchSmallVarCollection.textMuted,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ],
        );
      }),
    );
  }
}

class GetPublicReportPrivacyBanner extends StatelessWidget {
  const GetPublicReportPrivacyBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class GetPublicReportReasonList extends StatelessWidget {
  const GetPublicReportReasonList({
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(_reportReasons.length, (i) {
        final reason = _reportReasons[i];
        final selected = selectedIndex == i;
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onSelected(i),
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
                      reason.icon,
                      size: 18,
                      color: selected
                          ? SearchSmallVarCollection.brandStart
                          : SearchSmallVarCollection.textMuted,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        reason.label,
                        style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(
                          color: SearchSmallVarCollection.textPrimary,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                        ),
                      ),
                    ),
                    Icon(
                      selected ? Icons.radio_button_checked : Icons.radio_button_off,
                      size: 18,
                      color: selected
                          ? SearchSmallVarCollection.brandStart
                          : SearchSmallVarCollection.textMuted,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
