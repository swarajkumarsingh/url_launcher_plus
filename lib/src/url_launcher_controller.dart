import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'messages.dart';

final urlLauncherController = _UrlLauncherController();

class _UrlLauncherController {
  WebViewController init(BuildContext context, dynamic widget) {
    
    const PlatformWebViewControllerCreationParams params =
        PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (widget.onProgress != null) {
              widget.onProgress!();
              return;
            }
            return debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            if (widget.onPageStarted != null) {
              widget.onPageStarted!();
              return;
            }
            return debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            if (widget.onPageFinished != null) {
              widget.onPageFinished!();
              return;
            }
            return debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            if (widget.onPageFinished != null) {
              widget.onPageFinished!();
              return;
            }
            message.throwError(e: error, details: error.description);
            return debugPrint('''
                Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (widget.onNavigationRequest != null) {
              return widget.onNavigationRequest!();
            }

            final blockedUrls = widget.blockedUrls;
            for (var i = 0; i < blockedUrls.length; i++) {
              if (request.url.startsWith(blockedUrls[i])) {
                debugPrint('blocking navigation to ${request.url}');
                return NavigationDecision.prevent;
              }
            }

            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            if (widget.onUrlChange != null) {
              widget.onUrlChange!();
              return;
            }
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.launchUrl));
    return controller;
  }
}
