import 'package:flutter/material.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../core/widgets/SetOriginalInteractionType.dart';

class PushElasticTempleManager extends StatefulWidget {
  const PushElasticTempleManager({
    super.key,
    required this.authors,
    required this.onUnblock,
  });

  final Set<String> authors;
  final ValueChanged<String> onUnblock;

  @override
  State<PushElasticTempleManager> createState() => GetPrismaticVisibleHandler();
}

class GetPrismaticVisibleHandler extends State<PushElasticTempleManager> {
  late Set<String> _authors;

  @override
  void initState() {
    super.initState();
    _authors = Set<String>.from(widget.authors);
  }

  void GetBackwardBitrateDelegate(String name) {
    widget.onUnblock(name);
    setState(() => _authors.remove(name));
    DecoupleCrucialGraphType.show(context, '已取消拉黑');
  }

  @override
  Widget build(BuildContext context) {
    final list = _authors.toList()..sort();

    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      appBar: AppBar(
        title: Text('拉黑名单', style: RestartAsynchronousBitrateManager.StopDirectlyTailBase),
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
                style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget.copyWith(color: SearchSmallVarCollection.textMuted),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(SetPublicFrameDelegate.safeMargin),
              itemCount: list.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final name = list[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(SetPublicFrameDelegate.radiusMedium),
                    border: Border.all(color: SearchSmallVarCollection.bgSecondary),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: SearchSmallVarCollection.rose.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.person_off, color: SearchSmallVarCollection.rose, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          name,
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => GetBackwardBitrateDelegate(name),
                        child: Text(
                          '取消拉黑',
                          style: RestartAsynchronousBitrateManager.EndTypicalVolumeArray.copyWith(
                            color: SearchSmallVarCollection.brandStart,
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
