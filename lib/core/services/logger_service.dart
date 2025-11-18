import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

enum LogLevel { debug, info, warning, error }

class LoggerService {
  static const String _name = 'PlantApp';

  static void debug(String message, {String? tag}) {
    _log(LogLevel.debug, message, tag: tag);
  }

  static void info(String message, {String? tag}) {
    _log(LogLevel.info, message, tag: tag);
  }

  static void warning(String message, {String? tag}) {
    _log(LogLevel.warning, message, tag: tag);
  }

  static void error(String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    _log(LogLevel.error, message, tag: tag, error: error, stackTrace: stackTrace);
  }

  static void _log(LogLevel level, String message, {String? tag, Object? error, StackTrace? stackTrace}) {
    if (!kDebugMode && level == LogLevel.debug) {
      return;
    }

    final prefix = tag != null ? '[$tag] ' : '';
    final formattedMessage = '$prefix$message';

    switch (level) {
      case LogLevel.debug:
        developer.log(formattedMessage, name: _name, level: 500);
        break;
      case LogLevel.info:
        developer.log(formattedMessage, name: _name, level: 800);
        break;
      case LogLevel.warning:
        developer.log(formattedMessage, name: _name, level: 900);
        break;
      case LogLevel.error:
        developer.log(formattedMessage, name: _name, level: 1000, error: error, stackTrace: stackTrace);
        break;
    }
  }
}
