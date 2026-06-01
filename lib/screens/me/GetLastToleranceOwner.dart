import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../charge/SetDirectlyListenerFactory.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';
import '../../models/SetExplicitBottomContainer.dart';
import 'SetSmartPositionPool.dart';
import 'DestroyGeometricNumberOwner.dart';
import 'RenameArithmeticZonePool.dart';
import 'DisplayIndependentCaptionHelper.dart';
import 'ResetCriticalVariableContainer.dart';

class CreateBasicBoundReference extends StatefulWidget {
  const CreateBasicBoundReference({
    super.key,
    required this.teenModeEnabled,
    required this.iapEnabled,
    required this.blockedAuthors,
    required this.shieldedPostIds,
    required this.userPosts,
    required this.onTeenModeChanged,
    required this.onIapEnabledChanged,
    required this.onUnblockAuthor,
    required this.onUnshieldPost,
  });

  final bool teenModeEnabled;
  final bool iapEnabled;
  final Set<String> blockedAuthors;
  final Set<String> shieldedPostIds;
  final List<ContinueLargeVarImplement> userPosts;
  final ValueChanged<bool> onTeenModeChanged;
  final Future<void> Function(bool) onIapEnabledChanged;
  final ValueChanged<String> onUnblockAuthor;
  final ValueChanged<String> onUnshieldPost;

  @override
  State<CreateBasicBoundReference> createState() => RestartRapidParameterHandler();
}

class RestartRapidParameterHandler extends State<CreateBasicBoundReference> {
  late bool _teenModeEnabled;
  late bool _iapEnabled;

  @override
  void initState() {
    super.initState();
    _teenModeEnabled = widget.teenModeEnabled;
    _iapEnabled = widget.iapEnabled;
  }

  @override
  void didUpdateWidget(CreateBasicBoundReference oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.teenModeEnabled != widget.teenModeEnabled) {
      _teenModeEnabled = widget.teenModeEnabled;
    }
    if (oldWidget.iapEnabled != widget.iapEnabled) {
      _iapEnabled = widget.iapEnabled;
    }
  }

  Future<void> GetMultiDescentCache() async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => GetDifficultZoneAdapter(
          teenModeEnabled: _teenModeEnabled,
          iapEnabled: _iapEnabled,
          onTeenModeChanged: (v) {
            setState(() => _teenModeEnabled = v);
            widget.onTeenModeChanged(v);
          },
          onIapEnabledChanged: (v) async {
            setState(() => _iapEnabled = v);
            await widget.onIapEnabledChanged(v);
          },
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  Future<void> SkipSortedParameterHandler() async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => PushElasticTempleManager(
          authors: widget.blockedAuthors,
          onUnblock: widget.onUnblockAuthor,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  Future<void> GetComprehensiveValueFilter() async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => DismissMissedStyleObserver(
          postIds: widget.shieldedPostIds,
          userPosts: widget.userPosts,
          onUnshield: widget.onUnshieldPost,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  String GetIndependentIntensityBase() {
    final parts = <String>[];
    parts.add(_teenModeEnabled ? '青少年模式已开启' : '青少年模式已关闭');
    parts.add(_iapEnabled ? '内购已开启' : '内购已关闭');
    return parts.join(' · ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('设置', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
        children: [
          GetEnabledBufferGroup('通用'),
          SetSharedCoordBase(
            title: '青少年模式',
            subtitle: GetIndependentIntensityBase(),
            icon: Icons.shield_outlined,
            iconColor: SearchSmallVarCollection.brandStart,
            onTap: GetMultiDescentCache,
          ),
          const SizedBox(height: 20),
          if (_iapEnabled) ...[
            GetEnabledBufferGroup('账户'),
            SetSharedCoordBase(
              title: '金币充值',
              subtitle: '购买金币，解锁更多功能',
              icon: Icons.monetization_on_outlined,
              iconColor: SearchSmallVarCollection.amber,
              onTap: () {
                Navigator.push<void>(
                  context,
                  MaterialPageRoute(builder: (ctx) => const SetAccordionValueArray()),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
          GetEnabledBufferGroup('隐私与安全'),
          SetSharedCoordBase(
            title: '拉黑名单',
            subtitle: widget.blockedAuthors.isEmpty
                ? '暂无拉黑用户'
                : '${widget.blockedAuthors.length} 人',
            icon: Icons.block,
            iconColor: SearchSmallVarCollection.rose,
            onTap: SkipSortedParameterHandler,
          ),
          SetSharedCoordBase(
            title: '屏蔽名单',
            subtitle: widget.shieldedPostIds.isEmpty
                ? '暂无屏蔽内容'
                : '${widget.shieldedPostIds.length} 条',
            icon: Icons.visibility_off_outlined,
            iconColor: SearchSmallVarCollection.textSecondary,
            onTap: GetComprehensiveValueFilter,
          ),
          const SizedBox(height: 20),
          GetEnabledBufferGroup('帮助与关于'),
          SetSharedCoordBase(
            title: '帮助与反馈',
            subtitle: '意见反馈、问题描述',
            icon: Icons.support_agent_outlined,
            iconColor: SearchSmallVarCollection.brandStart,
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(builder: (ctx) => const PauseSymmetricQuaternionFilter()),
              );
            },
          ),
          SetSharedCoordBase(
            title: '关于我们',
            subtitle: SetPublicFrameDelegate.aboutProductName,
            icon: Icons.info_outline,
            iconColor: SearchSmallVarCollection.indigo,
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(builder: (ctx) => const MoveFusedTailContainer()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class GetEnabledBufferGroup extends StatelessWidget {
  const GetEnabledBufferGroup(this.label);
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

class SetSharedCoordBase extends StatelessWidget {
  const SetSharedCoordBase({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
          child: GetMediocreTopPool(
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, size: 18, color: iconColor),
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
                      Text(subtitle, style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, size: 18, color: SearchSmallVarCollection.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GetMediocreTopPool extends StatelessWidget {
  const GetMediocreTopPool({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
        border: Border.all(color: SearchSmallVarCollection.bgSecondary),
      ),
      child: child,
    );
  }
}
