import 'package:flutter/material.dart';

import '../url_launcher_plus.dart';

void launchUrl(BuildContext context, String url, {Color color = Colors.blue}) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return UrlLauncher(
        launchUrl: "https://google.com/",
        backgroundColor: color,
      );
    },
  ));
}
