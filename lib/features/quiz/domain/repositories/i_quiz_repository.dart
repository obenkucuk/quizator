import 'package:fpdart/fpdart.dart';

import '../../../../core/failures/failure.dart';
import '../../data/models/quiz_model.dart';

abstract class IQuizRepository {
  Future<Either<IFailure, QuizModel>> getSelectedQuiz({
    required int category,
  });
}
