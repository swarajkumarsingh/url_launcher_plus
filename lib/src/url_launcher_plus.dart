import 'package:flutter/material.dart';
import 'package:url_launcher_plus/src/url_launcher_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'loader.dart';

class UrlLauncher extends StatefulWidget {
  const UrlLauncher({
    super.key,
    required this.launchUrl,
    this.blockedUrls = const [],
    this.onPageFinished,
    this.onPageStarted,
    this.onProgress,
    this.onWebResourceError,
    this.onNavigationRequest,
    this.onUrlChange,
    this.onClose,
    this.backgroundColor,
    this.onRefresh,
    this.iconColor,
  });

  final String launchUrl;
  final VoidCallback? onClose;
  final Color? backgroundColor;
  final Color? iconColor;
  final VoidCallback? onRefresh;
  final List<String> blockedUrls;

  final VoidCallback? onProgress;
  final VoidCallback? onUrlChange;
  final VoidCallback? onPageStarted;
  final VoidCallback? onPageFinished;
  final Function? onNavigationRequest;
  final VoidCallback? onWebResourceError;

  @override
  State<UrlLauncher> createState() => _UrlLauncherState();
}

class _UrlLauncherState extends State<UrlLauncher> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    final controller = urlLauncherController.init(context, widget);
    setState(() {
      _controller = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: widget.backgroundColor ??
            Theme.of(context).appBarTheme.backgroundColor,
        leading: IconButton(
          color: widget.iconColor ?? Colors.white,
          onPressed: () {
            if (widget.onClose != null) {
              return widget.onClose!();
            }
            return Navigator.pop(context);
          },
          icon: const Icon(Icons.close),
        ),
        actions: [
          IconButton(
            color: widget.iconColor ?? Colors.white,
            onPressed: () async {
              if (widget.onRefresh != null) {
                return widget.onRefresh!();
              }
              await _controller!.reload();
              return;
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: _controller == null
          ? const Loader()
          : WebViewWidget(controller: _controller!),
    );
  }
}
