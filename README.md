# Flutter Url Launcher Plus

- Customizable url launcher with AppBar for navigation and also a refresh button available

## Supported Devices

- Android
- IOS

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):

```yaml
dependencies:
  url_launcher_plus:
```

2.  minSdkVersion >= 19

```
    defaultConfig {
        minSdkVersion 19
        ...
    }
```

3. Import the package and use it in your Flutter App.

```dart
import 'package:flutter_gearbox/url_launcher_plus.dart';
```

## Example

```
  void navigate(BuildContext context) {
    Navigator.push(
      UrlLauncher(
          launchUrl: "https://google.com/",
          backgroundColor: Colors.blue,
          blockUrls: ['blockThisSite.com1', 'blockThisSite.com2'],
          onClose: () {...},
          iconColor: Colors.white,
          onRefresh: () {...},
          onProgress: () {...},
          onUrlChange: () {...},
          onPageStarted: () {...},
          onPageFinished: () {...},
          onNavigationRequest: () {...},
          onWebResourceError: () {...},
    ));
  }
```

## Next Goals

- [ ] More features to be added

## Contributions

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an issue. <br>
<br>
If you fixed a bug or implemented a feature, please send a pull request.
