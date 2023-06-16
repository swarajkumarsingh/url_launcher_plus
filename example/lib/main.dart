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
        return const UrlLauncher(
          launchUrl: "https://google.com/",
          backgroundColor: Colors.blue,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: ElevatedButton.icon(
          onPressed: () => navigate(context),
          label: const Text("Launch Url"),
          icon: const Icon(Icons.ads_click),
        ),
      )),
    );
  }
}
