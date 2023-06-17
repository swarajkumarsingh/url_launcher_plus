import 'package:flutter/material.dart';
import 'package:url_launcher_plus/url_launcher_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Url Launcher Plus Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void navigate(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        /// [UrlLauncher] - personalized screen for displaying page with the help of Webview, with full customization options
        return UrlLauncher(
          launchUrl: "https://google.com/",
          backgroundColor: Colors.blue,
          blockUrls: const ['blockThisSite.com1', 'blockThisSite.com2'],
          onClose: () {},
          iconColor: Colors.white,
          onRefresh: () {},
          onProgress: () {},
          onUrlChange: () {},
          onPageStarted: () {},
          onPageFinished: () {},
          onNavigationRequest: () {},
          onWebResourceError: () {},
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton.icon(
                onPressed: () => navigate(context),
                label: const Text("Custom Launch Url"),
                icon: const Icon(Icons.ads_click),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  /// [launchUrl] - launch url with default values provided by the package
                  launchUrl(context, "https://google.com/");
                },
                label: const Text("Default Launcher"),
                icon: const Icon(Icons.power_settings_new_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
