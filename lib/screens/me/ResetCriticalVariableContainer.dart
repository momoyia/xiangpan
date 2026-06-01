import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';

/// 青少年模式设置二级页
class GetDifficultZoneAdapter extends StatefulWidget {
  const GetDifficultZoneAdapter({
    super.key,
    required this.teenModeEnabled,
    required this.iapEnabled,
    required this.onTeenModeChanged,
    required this.onIapEnabledChanged,
  });

  final bool teenModeEnabled;
  final bool iapEnabled;
  final ValueChanged<bool> onTeenModeChanged;
  final Future<void> Function(bool) onIapEnabledChanged;

  @override
  State<GetDifficultZoneAdapter> createState() => GetSemanticVertexPool();
}

class GetSemanticVertexPool extends State<GetDifficultZoneAdapter> {
  late bool _teenModeEnabled;
  late bool _iapEnabled;

  @override
  void initState() {
    super.initState();
    _teenModeEnabled = widget.teenModeEnabled;
    _iapEnabled = widget.iapEnabled;
  }

  @override
  void didUpdateWidget(GetDifficultZoneAdapter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.teenModeEnabled != widget.teenModeEnabled) {
      _teenModeEnabled = widget.teenModeEnabled;
    }
    if (oldWidget.iapEnabled != widget.iapEnabled) {
      _iapEnabled = widget.iapEnabled;
    }
  }

  void GetRequiredModuleBase(bool value) {
    setState(() => _teenModeEnabled = value);
    widget.onTeenModeChanged(value);
    DecoupleCrucialGraphType.show(
      context,
      value ? '青少年模式已开启' : '青少年模式已关闭',
    );
  }

  Future<void> GetAutoRowHelper(bool value) async {
    setState(() => _iapEnabled = value);
    await widget.onIapEnabledChanged(value);
    if (!mounted) return;
    DecoupleCrucialGraphType.show(
      context,
      value ? '内购功能已开启' : '内购功能已关闭',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('青少年模式', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        children: [
          SetResilientQueueExtension(
            icon: Icons.shield_outlined,
            color: SearchSmallVarCollection.brandStart,
            text: '在此管理青少年保护与内购相关设置，守护健康使用体验。',
          ),
          const SizedBox(height: 20),
          PrepareRetainedVarDelegate('内容保护'),
          CancelSignificantHashCreator(
            icon: Icons.child_care_outlined,
            iconColor: SearchSmallVarCollection.brandStart,
            title: '青少年模式',
            subtitle: '开启后限制部分敏感内容，呵护健康成长',
            value: _teenModeEnabled,
            onChanged: GetRequiredModuleBase,
          ),
          const SizedBox(height: 20),
          PrepareRetainedVarDelegate('消费管理'),
          CancelSignificantHashCreator(
            icon: Icons.monetization_on_outlined,
            iconColor: SearchSmallVarCollection.amber,
            title: '内购功能',
            subtitle: '关闭后将隐藏金币充值入口，无法进行应用内购买',
            value: _iapEnabled,
            onChanged: GetAutoRowHelper,
          ),
          const SizedBox(height: 16),
          FinishSecondValueCollection(
            text: _iapEnabled
                ? '内购已开启，可在「设置 → 账户 → 金币充值」中购买金币。'
                : '内购已关闭，设置页中的金币充值入口将不可用。',
          ),
        ],
      ),
    );
  }
}

class PrepareRetainedVarDelegate extends StatelessWidget {
  const PrepareRetainedVarDelegate(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
          color: SearchSmallVarCollection.textMuted,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class SetResilientQueueExtension extends StatelessWidget {
  const SetResilientQueueExtension({
    required this.icon,
    required this.color,
    required this.text,
  });

  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: color.withOpacity(0.15)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: color),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                color: SearchSmallVarCollection.textSecondary,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CancelSignificantHashCreator extends StatelessWidget {
  const CancelSignificantHashCreator({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onChanged(!value),
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
            border: Border.all(color: SearchSmallVarCollection.bgSecondary),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 20, color: iconColor),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: RestartAsynchronousBitrateManager.caption.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                  ],
                ),
              ),
              Switch(
                value: value,
                activeColor: SearchSmallVarCollection.brandStart,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinishSecondValueCollection extends StatelessWidget {
  const FinishSecondValueCollection({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: SearchSmallVarCollection.bgSecondary,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
      ),
      child: Text(
        text,
        style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
          color: SearchSmallVarCollection.textMuted,
          height: 1.4,
        ),
      ),
    );
  }
}
