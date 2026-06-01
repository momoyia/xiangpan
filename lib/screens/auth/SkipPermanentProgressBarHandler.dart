import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/constants/SetFusedNameImplement.dart';
import '../../core/theme/SetSmartDisclaimerManager.dart';
import '../../core/theme/GetComprehensiveCompositionArray.dart';
import '../../services/SetDirectlyHeadArray.dart';

/// 协议页：展示在线文档，左上角返回
class PrepareCriticalRowCreator extends StatefulWidget {
  const PrepareCriticalRowCreator({super.key, required this.url});

  final String url;

  @override
  State<PrepareCriticalRowCreator> createState() => SetBasicTaxonomyHelper();
}

class SetBasicTaxonomyHelper extends State<PrepareCriticalRowCreator> {
  late final WebViewController _controller;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    final alreadyReady = SetPrevBufferStack.GetCrudeTailFactory(widget.url);
    _loading = !alreadyReady;
    _controller = SetPrevBufferStack.GetSubstantialPopupStack(
      widget.url,
      KeepDedicatedHeadCreator: () {
        if (mounted) setState(() => _loading = true);
      },
      ExtendSustainableValuePool: () {
        if (!mounted) return;
        setState(() => _loading = false);
        SetPrevBufferStack.TrainDedicatedLoaderList(_controller);
      },
      onError: (msg) {
        if (!mounted) return;
        setState(() {
          _loading = false;
          _error = msg;
        });
      },
    );
    if (alreadyReady) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        SetPrevBufferStack.TrainDedicatedLoaderList(_controller);
      });
    }
  }

  void StartStaticConfidentialityOwner() {
    setState(() {
      _loading = true;
      _error = null;
    });
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SearchSmallVarCollection.canvasWhite,
      body: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          children: [
            WebViewWidget(controller: _controller),
            Positioned(
              top: 0,
              left: 0,
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                  color: SearchSmallVarCollection.textPrimary,
                  style: IconButton.styleFrom(
                    minimumSize: const Size(
                      SetPublicFrameDelegate.minTapSize,
                      SetPublicFrameDelegate.minTapSize,
                    ),
                    backgroundColor: SearchSmallVarCollection.canvasWhite.withOpacity(0.92),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: IgnorePointer(
                child: ColoredBox(
                  color: SearchSmallVarCollection.canvasWhite,
                  child: SizedBox(
                    width: 88,
                    height: 88 + MediaQuery.paddingOf(context).bottom,
                  ),
                ),
              ),
            ),
            if (_loading)
              const Center(
                child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: SearchSmallVarCollection.brandStart,
                  ),
                ),
              ),
            if (_error != null)
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _error!,
                        style: RestartAsynchronousBitrateManager.CreateResilientImpactTarget,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: StartStaticConfidentialityOwner,
                        child: Text(
                          '重新加载',
                          style: RestartAsynchronousBitrateManager.caption.copyWith(
                            color: SearchSmallVarCollection.brandStart,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
