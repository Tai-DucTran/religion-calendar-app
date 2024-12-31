import 'dart:developer' as developer;
import 'package:flutter/foundation.dart';

class Log {
  // ANSI escape codes for colors
  static const String _redColor = '\x1B[31m';
  static const String _yellowColor = '\x1B[33m';
  static const String _blueColor = '\x1B[34m';
  static const String _greenColor = '\x1B[32m';
  static const String _resetColor = '\x1B[0m';
  static const String _boldText = '\x1B[1m';

  static void error(String message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode) {
      developer.log(
        '$_boldText$_redColor[ERROR] $message$_resetColor',
        error: error,
        stackTrace: stackTrace,
        name: 'ReligionCalendarApp',
      );
    } else {
      // In production, send to your logging service
      // Example: Firebase Crashlytics, Sentry, etc.
      _productionLog(
        'ERROR',
        message,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static void warn(String message, {Object? error}) {
    if (kDebugMode) {
      developer.log(
        '$_boldText$_yellowColor[WARN] $message$_resetColor',
        error: error,
        name: 'ReligionCalendarApp',
      );
    } else {
      _productionLog('WARN', message, error: error);
    }
  }

  static void info(String message) {
    if (kDebugMode) {
      developer.log(
        '$_boldText$_blueColor[INFO] $message$_resetColor',
        name: 'ReligionCalendarApp',
      );
    } else {
      _productionLog('INFO', message);
    }
  }

  static void dev(String message) {
    if (kDebugMode) {
      developer.log(
        '$_boldText$_greenColor[DEV Logs] $message$_resetColor',
        name: 'ReligionCalendarApp',
      );
    } else {
      _productionLog('DEV Logs', message);
    }
  }

  static void _productionLog(
    String level,
    String message, {
    Object? error,
    StackTrace? stackTrace,
  }) {
    // TODO: Implement production logging
    // Example: Send to Firebase Crashlytics
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);

    // Example: Send to Sentry
    // Sentry.captureException(error, stackTrace: stackTrace);
  }

  static String _getTimestamp() {
    return DateTime.now().toIso8601String();
  }
}
