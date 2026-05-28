import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_toast.dart';
import '../../models/feed_post.dart';
import 'about_page.dart';
import 'blocked_list_page.dart';
import 'feedback_page.dart';
import 'shielded_list_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.teenModeEnabled,
    required this.blockedAuthors,
    required this.shieldedPostIds,
    required this.userPosts,
    required this.onTeenModeChanged,
    required this.onUnblockAuthor,
    required this.onUnshieldPost,
  });

  final bool teenModeEnabled;
  final Set<String> blockedAuthors;
  final Set<String> shieldedPostIds;
  final List<FeedPost> userPosts;
  final ValueChanged<bool> onTeenModeChanged;
  final ValueChanged<String> onUnblockAuthor;
  final ValueChanged<String> onUnshieldPost;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _teenModeEnabled;

  @override
  void initState() {
    super.initState();
    _teenModeEnabled = widget.teenModeEnabled;
  }

  @override
  void didUpdateWidget(SettingsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.teenModeEnabled != widget.teenModeEnabled) {
      _teenModeEnabled = widget.teenModeEnabled;
    }
  }

  void _toggleTeenMode(bool value) {
    setState(() => _teenModeEnabled = value);
    widget.onTeenModeChanged(value);
    AppToast.show(
      context,
      value ? '青少年模式已开启' : '青少年模式已关闭',
    );
  }

  Future<void> _openBlocked() async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => BlockedListPage(
          authors: widget.blockedAuthors,
          onUnblock: widget.onUnblockAuthor,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  Future<void> _openShielded() async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (ctx) => ShieldedListPage(
          postIds: widget.shieldedPostIds,
          userPosts: widget.userPosts,
          onUnshield: widget.onUnshieldPost,
        ),
      ),
    );
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('设置', style: AppTextStyles.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppConstants.safeMargin),
        children: [
          _SectionTitle('通用'),
          _SwitchTile(
            title: '青少年模式',
            subtitle: '限制部分敏感内容，呵护健康成长',
            value: _teenModeEnabled,
            onChanged: _toggleTeenMode,
          ),
          const SizedBox(height: 20),
          _SectionTitle('隐私与安全'),
          _NavTile(
            title: '拉黑名单',
            subtitle: widget.blockedAuthors.isEmpty
                ? '暂无拉黑用户'
                : '${widget.blockedAuthors.length} 人',
            icon: Icons.block,
            iconColor: AppColors.rose,
            onTap: _openBlocked,
          ),
          _NavTile(
            title: '屏蔽名单',
            subtitle: widget.shieldedPostIds.isEmpty
                ? '暂无屏蔽内容'
                : '${widget.shieldedPostIds.length} 条',
            icon: Icons.visibility_off_outlined,
            iconColor: AppColors.textSecondary,
            onTap: _openShielded,
          ),
          const SizedBox(height: 20),
          _SectionTitle('帮助与关于'),
          _NavTile(
            title: '帮助与反馈',
            subtitle: '意见反馈、问题描述',
            icon: Icons.support_agent_outlined,
            iconColor: AppColors.brandStart,
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(builder: (ctx) => const FeedbackPage()),
              );
            },
          ),
          _NavTile(
            title: '关于我们',
            subtitle: AppConstants.aboutProductName,
            icon: Icons.info_outline,
            iconColor: AppColors.indigo,
            onTap: () {
              Navigator.push<void>(
                context,
                MaterialPageRoute(builder: (ctx) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 4),
      child: Text(
        label,
        style: AppTextStyles.captionSmall.copyWith(
          color: AppColors.textMuted,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

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
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        child: _SettingsCard(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(subtitle, style: AppTextStyles.captionSmall),
                  ],
                ),
              ),
              Switch(
                value: value,
                activeColor: AppColors.brandStart,
                onChanged: onChanged,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTile extends StatelessWidget {
  const _NavTile({
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
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          child: _SettingsCard(
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
                        style: AppTextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(subtitle, style: AppTextStyles.captionSmall),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, size: 18, color: AppColors.textMuted),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppColors.bgSecondary),
      ),
      child: child,
    );
  }
}
