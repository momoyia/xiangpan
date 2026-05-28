import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../services/agreement_web_loader.dart';

/// 协议页：展示在线文档，左上角返回
class AgreementWebPage extends StatefulWidget {
  const AgreementWebPage({super.key, required this.url});

  final String url;

  @override
  State<AgreementWebPage> createState() => _AgreementWebPageState();
}

class _AgreementWebPageState extends State<AgreementWebPage> {
  late final WebViewController _controller;
  bool _loading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    final alreadyReady = AgreementWebLoader.isReady(widget.url);
    _loading = !alreadyReady;
    _controller = AgreementWebLoader.obtain(
      widget.url,
      onPageStarted: () {
        if (mounted) setState(() => _loading = true);
      },
      onPageFinished: () {
        if (!mounted) return;
        setState(() => _loading = false);
        AgreementWebLoader.applyLayoutFix(_controller);
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
        AgreementWebLoader.applyLayoutFix(_controller);
      });
    }
  }

  void _reload() {
    setState(() {
      _loading = true;
      _error = null;
    });
    _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasWhite,
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
                  color: AppColors.textPrimary,
                  style: IconButton.styleFrom(
                    minimumSize: const Size(
                      AppConstants.minTapSize,
                      AppConstants.minTapSize,
                    ),
                    backgroundColor: AppColors.canvasWhite.withOpacity(0.92),
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
                  color: AppColors.canvasWhite,
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
                    color: AppColors.brandStart,
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
                        style: AppTextStyles.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: _reload,
                        child: Text(
                          '重新加载',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.brandStart,
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
