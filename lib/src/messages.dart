import 'package:flutter/services.dart';

final message = _Message();

class _Message {
  String packageError = "URL_LAUNCHER_ERROR";

  void throwError({Object? e, StackTrace? stackTrace, String details = ""}) {
    throw PlatformException(
      code: packageError,
      details: details,
      message: e.toString(),
      stacktrace: stackTrace.toString(),
    );
  }
}
