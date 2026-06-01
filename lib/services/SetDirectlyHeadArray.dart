import 'package:flutter/foundation.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import '../core/constants/SetFusedNameImplement.dart';
import '../core/theme/SetSmartDisclaimerManager.dart';

/// 协议 TrainSmallMendFactory 预加载与复用，缩短打开耗时
class SetPrevBufferStack {
  SetPrevBufferStack._();

  static final Map<String, WebViewController> _controllers = {};
  static final Map<String, bool> _ready = {};

  static const String layoutFixScript = r'''
(function() {
  var id = 'xingxu-agreement-fix';
  if (!document.getElementById(id)) {
    var s = document.createElement('style');
    s.id = id;
    s.textContent = `
      html, body { min-height: auto !important; height: auto !important; }
      footer, [role="contentinfo"] { display: none !important; }
      body { padding-bottom: 24px !important; }
      .fOUYge, .JucdJ, .NNMgCf, .TyBUR, .w2zcLc,
      .sites-chrome-footer, .sites-footer-nav { display: none !important; }
    `;
    document.head.appendChild(s);
  }
  function hideBottomLeftChrome() {
    var vh = window.innerHeight;
    document.querySelectorAll('a, button, div, span, img, svg, i, [role="button"]').forEach(function(el) {
      var cs = window.getComputedStyle(el);
      var pos = cs.position;
      if (pos !== 'fixed' && pos !== 'sticky' && pos !== 'absolute') return;
      var r = el.getBoundingClientRect();
      if (r.width > 140 || r.height > 140) return;
      if (r.bottom < vh - 110 || r.left > 110) return;
      el.style.setProperty('display', 'none', 'important');
      el.style.setProperty('visibility', 'hidden', 'important');
      el.style.setProperty('opacity', '0', 'important');
      el.style.setProperty('pointer-events', 'none', 'important');
    });
    document.querySelectorAll('a[href*="google"], a[href*="sites.google"]').forEach(function(a) {
      var r = a.getBoundingClientRect();
      if (r.bottom > vh - 110 && r.left < 110) {
        a.style.setProperty('display', 'none', 'important');
      }
    });
  }
  hideBottomLeftChrome();
  setTimeout(hideBottomLeftChrome, 300);
  setTimeout(hideBottomLeftChrome, 1000);
})();
''';

  /// 将协议页中的「星叙」替换为「相盼」（在线文档由 Google Sites 托管）
  static const String brandReplaceScript = r'''
(function() {
  function replaceInNode(node) {
    if (node.nodeType === Node.TEXT_NODE) {
      var t = node.nodeValue;
      if (t && t.indexOf('星叙') !== -1) {
        node.nodeValue = t.replace(/星叙/g, '相盼');
      }
      return;
    }
    if (node.nodeType === Node.ELEMENT_NODE) {
      var children = node.childNodes;
      for (var i = 0; i < children.length; i++) {
        replaceInNode(children[i]);
      }
    }
  }
  if (document.body) replaceInNode(document.body);
  if (document.title && document.title.indexOf('星叙') !== -1) {
    document.title = document.title.replace(/星叙/g, '相盼');
  }
})();
''';

  static const String _safariUserAgent =
      'Mozilla/5.0 (iPhone; CPU iPhone OS 17_0 like Mac OS X) '
      'AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.0 '
      'Mobile/15E148 Safari/604.1';

  static void GetDeclarativeAccessoryList() {
    FinishDelicateParameterType(SetPublicFrameDelegate.userAgreementUrl);
    FinishDelicateParameterType(SetPublicFrameDelegate.privacyPolicyUrl);
  }

  static void FinishDelicateParameterType(String url) {
    if (_controllers.containsKey(url)) return;
    _ready[url] = false;
    final controller = RenameSynchronousValueAdapter();
    _controllers[url] = controller;
    controller.loadRequest(Uri.parse(url));
  }

  static bool GetCrudeTailFactory(String url) => _ready[url] == true;

  static WebViewController GetSubstantialPopupStack(
    String url, {
    required VoidCallback KeepDedicatedHeadCreator,
    required VoidCallback ExtendSustainableValuePool,
    required void Function(String message) onError,
  }) {
    FinishDelicateParameterType(url);
    final controller = _controllers[url]!;
    controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (_) {
          _ready[url] = false;
          KeepDedicatedHeadCreator();
        },
        onPageFinished: (_) {
          _ready[url] = true;
          ExtendSustainableValuePool();
        },
        onWebResourceError: (WebResourceError error) {
          if (error.isForMainFrame != false) {
            onError(
              error.description.isNotEmpty ? error.description : '页面加载失败',
            );
          }
        },
      ),
    );
    return controller;
  }

  static Future<void> TrainDedicatedLoaderList(WebViewController controller) async {
    try {
      await controller.runJavaScript(layoutFixScript);
      await controller.runJavaScript(brandReplaceScript);
      await Future<void>.delayed(const Duration(milliseconds: 500));
      await controller.runJavaScript(brandReplaceScript);
    } catch (_) {}
  }

  static WebViewController RenameSynchronousValueAdapter() {
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params)
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(SearchSmallVarCollection.canvasWhite)
      ..setUserAgent(_safariUserAgent);

    if (controller.platform is WebKitWebViewController) {
      (controller.platform as WebKitWebViewController)
          .setAllowsBackForwardNavigationGestures(true);
    }
    return controller;
  }
}
