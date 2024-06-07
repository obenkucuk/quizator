// ignore_for_file: avoid_redundant_argument_values

import 'package:talker_flutter/talker_flutter.dart';

final myLogger = MyLogger.init();

class MyLogger {
  MyLogger.init({
    this.enabled = true,
    this.useHistory = true,
    this.maxHistoryItems = 200,
    this.useConsoleLogs = true,
  });

  final bool enabled;
  final bool useHistory;
  final int maxHistoryItems;
  final bool useConsoleLogs;

  late final talker = TalkerFlutter.init(
    settings: TalkerSettings(
      enabled: enabled,
      useHistory: useHistory,
      maxHistoryItems: maxHistoryItems,
      useConsoleLogs: useConsoleLogs,
    ),
    // observer: const CrashlyticsTalkerObserver(),
  );

  void log(String message) {
    talker.log(message);
  }

  void error(String message) {
    talker.error(message);
  }

  void warning(String message) {
    talker.warning(message);
  }

  void info(String message) {
    talker.info(message);
  }

  void debug(String message) {
    talker.debug(message);
  }

  void verbose(String message) {
    talker.verbose(message);
  }

  void handle(
    Object exception, [
    StackTrace? stackTrace,
    dynamic msg,
  ]) {
    talker.handle(exception, stackTrace, msg);
  }
}

// @immutable
// final class CrashlyticsTalkerObserver extends TalkerObserver {
//   const CrashlyticsTalkerObserver();

//   @override
//   void onError(TalkerError err) {
//     // FirebaseCrashlytics.instance.recordError(
//     //   err.error,
//     //   err.stackTrace,
//     //   reason: err.message,
//     // );
//   }

//   @override
//   void onException(TalkerException err) {
//     // FirebaseCrashlytics.instance.recordError(
//     //   err.exception,
//     //   err.stackTrace,
//     //   reason: err.message,
//     // );
//   }
// }
