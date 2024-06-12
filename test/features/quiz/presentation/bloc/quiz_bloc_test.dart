import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quizator/core/failures/failure.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/domain/usecases/get_selected_quiz.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quizator/services/log/my_logger.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../../dummy_data/reader.dart';
import 'quiz_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetSelectedQuiz>(),
  MockSpec<MyTalkerLogger>(),
])
void main() {
  late QuizBloc bloc;
  late MockGetSelectedQuiz getSelectedQuiz;
  late MyTalkerLogger myTalkerLogger;

  setUp(() {
    getSelectedQuiz = MockGetSelectedQuiz();
    myTalkerLogger = MockMyTalkerLogger();

    bloc = QuizBloc(
      getSelectedQuiz: getSelectedQuiz,
      myTalkerLogger: myTalkerLogger,
    );
  });

  final model = QuizModel.fromJson(jsonDecode(dummyQuizModelReader()));
  const tCategory = 1;
  const tServerFailureMessage = 'Server Failure Test Message';

  test('At First Loading State', () {
    expect(bloc.state, equals(const QuizState.loading()));
  });

  List<QuizStateModel> getTestQuizStateModelList() {
    final quizStateModels = List.generate(model.results.length, (index) {
      final questionModel = model.results[index];

      final answerList = [...questionModel.incorrectAnswers.take(2), questionModel.correctAnswer]
        ..shuffle(Random(42));

      return QuizStateModel(
        questionModel: model.results[index],
        answerList: answerList,
      );
    });

    return quizStateModels;
  }

  final testQuizStateModelList = getTestQuizStateModelList();

  group(QuizEvent.getSelectedQuiz, () {
    blocTest<QuizBloc, QuizState>(
      'emits [QuizLoadedState] when QuizEvent is QuizEvent.getSelectedQuiz() if request is successfull.',
      build: () {
        provideDummy<Either<IFailure, QuizModel>>(Right(model));
        when(getSelectedQuiz(any)).thenAnswer((_) async => Right(model));

        return bloc;
      },
      act: (bloc) => bloc.add(const QuizEvent.getSelectedQuiz(category: tCategory)),
      wait: const Duration(milliseconds: 200),
      expect: () {
        return <QuizState>[
          QuizState.loaded(getTestQuizStateModelList()),
        ];
      },
    );

    blocTest<QuizBloc, QuizState>(
      'emits [QuizErrorState] when QuizEvent is QuizEvent.getSelectedQuiz() if request is UNsuccessfull.',
      build: () {
        provideDummy<Either<IFailure, QuizModel>>(const Left(ServerFailure()));
        when(getSelectedQuiz(any))
            .thenAnswer((_) async => const Left(ServerFailure(message: tServerFailureMessage)));

        return bloc;
      },
      act: (bloc) => bloc.add(const QuizEvent.getSelectedQuiz(category: tCategory)),
      expect: () => const <QuizState>[
        QuizState.error(message: tServerFailureMessage),
      ],
    );
  });

  blocTest<QuizBloc, QuizState>(
    'emits [QuizState.loaded(testQuizStateModels), QuizState.loaded(testQuizStateModels, userStartedQuiz: true)] when QuizEvent.startQuiz() is added.',
    build: () {
      provideDummy<Either<IFailure, QuizModel>>(Right(model));
      when(getSelectedQuiz(any)).thenAnswer((_) async => Right(model));

      return bloc;
    },
    act: (bloc) => bloc
      ..add(const QuizEvent.getSelectedQuiz(category: tCategory))
      ..add(const QuizEvent.startQuiz()),
    expect: () {
      return <QuizState>[
        QuizState.loaded(testQuizStateModelList),
        QuizState.loaded(testQuizStateModelList, userStartedQuiz: true),
      ];
    },
  );

  blocTest<QuizBloc, QuizState>(
    'emits [QuizState.loaded(testQuizStateModels), QuizState.loaded(testQuizStateModels, userStartedQuiz: true)] when QuizEvent.startQuiz() is added.',
    build: () {
      provideDummy<Either<IFailure, QuizModel>>(Right(model));
      when(getSelectedQuiz(any)).thenAnswer((_) async => Right(model));

      return bloc;
    },
    act: (bloc) {
      return bloc
        ..add(const QuizEvent.getSelectedQuiz(category: tCategory))
        ..add(const QuizEvent.startQuiz())
        ..add(QuizEvent.answerQuestion(
          selectedAnswer: 'January 30, 1933',
          quizStateModel: testQuizStateModelList.first,
          index: 0,
        ));
    },
    expect: () {
      final answeredQuestionList = [...testQuizStateModelList]..replaceRange(0, 1, [
          testQuizStateModelList.first.copyWith(
            selectedAnswer: 'January 30, 1933',
            status: QuestionStatus.answered,
            duration: const Duration(seconds: 10),
          )
        ]);

      return <QuizState>[
        QuizState.loaded(testQuizStateModelList),
        QuizState.loaded(testQuizStateModelList, userStartedQuiz: true),
        QuizState.loaded(answeredQuestionList, userStartedQuiz: true, currentQuestionIndex: 0),
        QuizState.loaded(answeredQuestionList, userStartedQuiz: true, currentQuestionIndex: 1),
      ];
    },
  );
}
