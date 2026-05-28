import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/widgets/app_toast.dart';

class BlockedListPage extends StatefulWidget {
  const BlockedListPage({
    super.key,
    required this.authors,
    required this.onUnblock,
  });

  final Set<String> authors;
  final ValueChanged<String> onUnblock;

  @override
  State<BlockedListPage> createState() => _BlockedListPageState();
}

class _BlockedListPageState extends State<BlockedListPage> {
  late Set<String> _authors;

  @override
  void initState() {
    super.initState();
    _authors = Set<String>.from(widget.authors);
  }

  void _unblock(String name) {
    widget.onUnblock(name);
    setState(() => _authors.remove(name));
    AppToast.show(context, '已取消拉黑');
  }

  @override
  Widget build(BuildContext context) {
    final list = _authors.toList()..sort();

    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
      appBar: AppBar(
        title: Text('拉黑名单', style: AppTextStyles.h2),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: list.isEmpty
          ? Center(
              child: Text(
                '暂无拉黑用户',
                style: AppTextStyles.bodySmall.copyWith(color: AppColors.textMuted),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(AppConstants.safeMargin),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final name = list[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                    border: Border.all(color: AppColors.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.rose.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person_off, color: AppColors.rose, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          name,
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => _unblock(name),
                        child: Text(
                          '取消拉黑',
                          style: AppTextStyles.captionSmall.copyWith(
                            color: AppColors.brandStart,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
