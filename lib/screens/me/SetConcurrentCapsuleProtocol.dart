import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';

class StreamlineUnsortedTitleCollection extends StatelessWidget {
  const StreamlineUnsortedTitleCollection({super.key, required this.onDelete});

  final VoidCallback onDelete;

  static Future<void> show(
    BuildContext context, {
    required VoidCallback onDelete,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => StreamlineUnsortedTitleCollection(
        onDelete: () {
          Navigator.pop(ctx);
          onDelete();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: SearchSmallVarCollection.bgSecondary,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Text('帖子管理', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
            const SizedBox(height: 16),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onDelete,
                borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusSmall),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.rose.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.delete_outline, color: SearchSmallVarCollection.rose, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '删除帖子',
                              style: RestartAsynchronousBitrateManager.caption.copyWith(
                                fontWeight: FontWeight.w700,
                                color: SearchSmallVarCollection.textPrimary,
                              ),
                            ),
                            Text(
                              '从广场与我的发布中移除',
                              style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  '取消',
                  style: RestartAsynchronousBitrateManager.caption.copyWith(
                    color: SearchSmallVarCollection.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
