import 'package:get_it/get_it.dart';
import 'package:quizator/core/helpers/network_info.dart';
import 'package:quizator/features/quiz/data/datasources/quiz_netwok_data_source.dart';
import 'package:quizator/features/quiz/data/repositories/quiz_repository.dart';
import 'package:quizator/features/quiz/data/services/quiz_service.dart';
import 'package:quizator/features/quiz/domain/usecases/get_selected_quiz.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quizator/services/http_service/my_chopper_service.dart';
import 'package:quizator/services/log/my_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

import 'features/quiz/domain/repositories/i_quiz_repository.dart';

final getIt = GetIt.I;

void initContainer() {
  // Logger setup
  getIt.registerLazySingleton(() => Talker(
        settings: TalkerSettings(
          enabled: true,
          useHistory: true,
          maxHistoryItems: 200,
          useConsoleLogs: true,
        ),
      ));

  getIt.registerFactory(() => TalkerRouteObserver(getIt<Talker>()));
  getIt.registerLazySingleton(() => MyTalkerLogger(
        talker: getIt<Talker>(),
      ));

  getIt.registerFactory(() => NetworkInfo());

  // Quiz feature setup
  getIt.registerFactory(() => QuizBloc(
        getSelectedQuiz: getIt(),
        myTalkerLogger: getIt(),
      ));

  getIt.registerFactory(() => GetSelectedQuiz(repository: getIt()));
  getIt.registerFactory<IQuizRepository>(
    () => QuizRepository(
      myTalkerLogger: getIt(),
      quizNetworkDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );

  getIt.registerFactory(() => QuizNetworkDataSource(quizService: getIt()));
  getIt.registerFactory(() => MyChopperService.instance.chopper.getService<QuizService>());
}
