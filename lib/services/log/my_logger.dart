// ignore_for_file: avoid_redundant_argument_values

import 'package:talker_flutter/talker_flutter.dart';

class MyTalkerLogger implements IMyLogger {
  final Talker talker;
  const MyTalkerLogger({required this.talker});

  @override
  void debug(String message) {
    talker.debug(message);
  }

  @override
  void error(String message) {
    talker.error(message);
  }

  @override
  void handle(Object exception, [StackTrace? stackTrace, msg]) {
    talker.handle(exception, stackTrace, msg);
  }

  @override
  void info(String message) {
    talker.info(message);
  }

  @override
  void log(String message) {
    talker.log(message);
  }

  @override
  void verbose(String message) {
    talker.verbose(message);
  }

  @override
  void warning(String message) {
    talker.warning(message);
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

abstract class IMyLogger {
  void log(String message);

  void error(String message);

  void warning(String message);

  void info(String message);

  void debug(String message);

  void verbose(String message);

  void handle(
    Object exception, [
    StackTrace? stackTrace,
    dynamic msg,
  ]);
}
