import 'package:flutter/cupertino.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizator/core/failures/failure.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';

import '../../../../core/helpers/network_info.dart';
import '../../../../services/log/my_logger.dart';
import '../../domain/repositories/i_quiz_repository.dart';
import '../datasources/quiz_netwok_data_source.dart';

@immutable
final class QuizRepository implements IQuizRepository {
  final MyTalkerLogger myTalkerLogger;
  final QuizNetworkDataSource quizNetworkDataSource;
  final NetworkInfo networkInfo;

  const QuizRepository({
    required this.myTalkerLogger,
    required this.quizNetworkDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<IFailure, QuizModel>> getSelectedQuiz({required int category}) async {
    if (await networkInfo.isConnected) {
      try {
        final quizModel = await quizNetworkDataSource.getSelectedQuiz(category: category);

        return Right(quizModel);
      } catch (e) {
        myTalkerLogger.handle(e);
        return const Left(ServerFailure());
      }
    } else {
      return const Left(NetworkFailure());
    }
  }
}
