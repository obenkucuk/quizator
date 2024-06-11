import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quizator/core/failures/failure.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/domain/repositories/i_quiz_repository.dart';
import 'package:quizator/features/quiz/domain/usecases/get_selected_quiz.dart';

import 'get_selected_quiz_test.mocks.dart';

@GenerateNiceMocks([MockSpec<IQuizRepository>()])
void main() {
  late final GetSelectedQuiz usecase;
  late final MockIQuizRepository mockIQuizRepository;

  setUp(() {
    mockIQuizRepository = MockIQuizRepository();
    usecase = GetSelectedQuiz(repository: mockIQuizRepository);
  });

  const tCategory = 1;

  const testQuizModel = QuizModel(
    responseCode: 1,
    results: [
      QuestionModel(
        type: 'type',
        difficulty: Difficulty.unknown,
        category: 'category',
        question: 'question',
        correctAnswer: 'correctAnswer',
        incorrectAnswers: ['incorrectAnswers'],
      )
    ],
  );

  test(
    'Should get selected quiz from response (QuizModel)',
    () async {
      provideDummy<Either<IFailure, QuizModel>>(const Right(testQuizModel));

      when(mockIQuizRepository.getSelectedQuiz(category: anyNamed('category')))
          .thenAnswer((_) async => const Right(testQuizModel));

      final result = await usecase(const SelectedQuizParams(category: tCategory));

      expect(result, const Right<IFailure, QuizModel>(testQuizModel));
      verify(mockIQuizRepository.getSelectedQuiz(category: tCategory)).called(1);
      verifyNoMoreInteractions(mockIQuizRepository);
    },
  );
}
