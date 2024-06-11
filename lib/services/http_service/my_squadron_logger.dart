import 'package:quizator/injection_container.dart';
import 'package:quizator/services/log/my_logger.dart';
import 'package:squadron/squadron.dart';

final class MySquadronLogger extends BaseDevSquadronLogger {
  @override
  void log(String message) => () {
        getIt<MyTalkerLogger>().log(message);
      };
}
