import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/failures/failure.dart';
import '../../../../core/usecases/usecases.dart';
import '../../data/models/quiz_model.dart';
import '../repositories/i_quiz_repository.dart';

class GetSelectedQuiz implements IUseCases<QuizModel, SelectedQuizParams> {
  final IQuizRepository repository;

  const GetSelectedQuiz({required this.repository});

  @override
  Future<Either<IFailure, QuizModel>> call(SelectedQuizParams params) async {
    return repository.getSelectedQuiz(category: params.category);
  }
}

//* Params for SelectedQuiz
class SelectedQuizParams extends Equatable {
  final int category;

  const SelectedQuizParams({
    required this.category,
  });

  @override
  List<Object?> get props => [category];
}
