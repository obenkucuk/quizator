import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quizator/services/log/my_logger.dart';

import '../../data/models/quiz_model.dart';
import '../../domain/usecases/get_selected_quiz.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';
part 'quiz_bloc.freezed.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final GetSelectedQuiz getSelectedQuiz;
  final MyTalkerLogger myTalkerLogger;

  QuizBloc({
    required this.getSelectedQuiz,
    required this.myTalkerLogger,
  }) : super(const QuizLoadingState()) {
    on<_GetSelectedQuizEvent>(_getSelectedQuiz);
    on<StartQuizEvent>(_startQuiz);
    on<AnswerQuestionEvent>(_answerQuestion);
    on<UpdateCurrentQuestionEvent>(_updateCurrentQuestion);
    on<_UpdateDurationEvent>(_updateDuration);
    on<FinishQuizEvent>(_finishQuiz);
  }

  Duration _displayedQuestionDuration = const Duration(seconds: 10);
  int _currentQuestionIndex = 0;

  Future<void> _getSelectedQuiz(
    _GetSelectedQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    // NOTE: Kullandığım API sınırlı olduğu için bu kısmı kullanamadım. Sizz denerken bu kısmı kullanıp deneyin.

    // final result = await getSelectedQuiz(SelectedQuizParams(category: event.category));

    // result.fold(
    //   (failure) => emit(QuizErrorState(message: failure.message)),
    //   (data) {
    //     final quizStateModels = List.generate(data.results.length, (index) {
    //       final questionModel = data.results[index];

    //       final answerList = [
    //         ...questionModel.incorrectAnswers.take(2),
    //         questionModel.correctAnswer
    //       ]..shuffle(Random(42));

    //       return QuizStateModel(questionModel: data.results[index], answerList: answerList);
    //     });

    //     if (data.results.isEmpty) {
    //       emit(const QuizErrorState(message: 'No question found'));
    //       return;
    //     }

    //     emit(QuizState.loaded(quizStateModels));
    //   },
    // );

    // NOTE: Eğer api istek sınırına takılırsa burdan deneyeceğimiz dummy data
    // Eğer burayı kullanırsanız blocTest UseCase kullanılmadığından hata verecektir.

    final data = QuizModel.fromJson(
        jsonDecode(await rootBundle.loadString('assets/dummy_data/quiz_model.json')));

    final quizStateModels = List.generate(data.results.length, (index) {
      final questionModel = data.results[index];

      final answerList = [...questionModel.incorrectAnswers.take(2), questionModel.correctAnswer]
        ..shuffle(Random(42));

      return QuizStateModel(
        questionModel: data.results[index],
        answerList: answerList,
      );
    });

    emit(QuizState.loaded(quizStateModels));
  }

  void _startQuiz(
    StartQuizEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      emit((state as QuizLoadedState).copyWith(userStartedQuiz: true));
    }

    _startTimer();
  }

  void _answerQuestion(
    AnswerQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final myState = state as QuizLoadedState;

      final answeredQuestionList = [...myState.questions]..replaceRange(
          event.index,
          event.index + 1,
          [
            event.quizStateModel.copyWith(
              selectedAnswer: event.selectedAnswer,
              status: QuestionStatus.answered,
              duration: _displayedQuestionDuration,
            )
          ],
        );

      emit(myState.copyWith(questions: answeredQuestionList));

      add(
        const UpdateCurrentQuestionEvent(
          pageDirection: ScrollDirection.reverse,
        ),
      );
    }
  }

  void _updateCurrentQuestion(
    UpdateCurrentQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final myState = state as QuizLoadedState;
      int? nextQuestionIndex;

      final allQuestions = myState.questions.map((e) => e).toList();

      final previousQuestions = allQuestions.sublist(0, _currentQuestionIndex);
      final nextQuestions = allQuestions.sublist(_currentQuestionIndex + 1);

      final nextUnasweredQuestion =
          nextQuestions.firstWhereOrNull((element) => element.status == QuestionStatus.unanswered);

      final previousUnasweredQuestion = previousQuestions.reversed
          .firstWhereOrNull((element) => element.status == QuestionStatus.unanswered);

      final hasAnyNextUnasweredQuestion =
          nextQuestions.any((element) => element.status == QuestionStatus.unanswered);

      final hasAnyPreviousUnasweredQuestion =
          previousQuestions.any((element) => element.status == QuestionStatus.unanswered);

      final hasAnyNextAsweredAndUnexpiredQuestion = nextQuestions.any((element) =>
          element.status == QuestionStatus.answered && element.duration > Duration.zero);

      final hasAnyPreviousAsweredAndUnexpiredQuestion = previousQuestions.any((element) =>
          element.status == QuestionStatus.answered && element.duration > Duration.zero);

      final nextAsweredAndUnexpiredQuestion = nextQuestions.firstWhereOrNull((element) =>
          element.status == QuestionStatus.answered && element.duration > Duration.zero);

      final previousAsweredAndUnexpiredQuestion = previousQuestions.reversed.firstWhereOrNull(
          (element) =>
              element.status == QuestionStatus.answered && element.duration > Duration.zero);

      final isEndOfQuiz = allQuestions.every((element) =>
          (element.status == QuestionStatus.answered && element.duration <= Duration.zero) ||
          element.status == QuestionStatus.expired);

      void handleQuestionAction(ScrollDirection direction) {
        if (isEndOfQuiz) {
          final correctQuestionCount = myState.questions
              .where((element) => element.status == QuestionStatus.answered)
              .where((element) => element.selectedAnswer == element.questionModel.correctAnswer)
              .length;

          final totalQuestionCount = myState.questions.length;

          myTalkerLogger.log('Quiz bitti');
          emit(QuizFinishState(
            correctQuestionCount: correctQuestionCount,
            totalQuestionCount: totalQuestionCount,
          ));

          return;
        }

        switch (direction) {
          case ScrollDirection.reverse:
            if (hasAnyNextUnasweredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(nextUnasweredQuestion!);
            } else if (hasAnyPreviousUnasweredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(previousUnasweredQuestion!);
            } else if (hasAnyNextAsweredAndUnexpiredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(nextAsweredAndUnexpiredQuestion!);
            } else {
              handleQuestionAction(ScrollDirection.forward);
            }
          case ScrollDirection.forward:
            if (hasAnyPreviousUnasweredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(previousUnasweredQuestion!);
            } else if (hasAnyNextUnasweredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(nextUnasweredQuestion!);
            } else if (hasAnyPreviousAsweredAndUnexpiredQuestion) {
              nextQuestionIndex = allQuestions.indexOf(previousAsweredAndUnexpiredQuestion!);
            } else {
              handleQuestionAction(ScrollDirection.reverse);
            }
          case ScrollDirection.idle:
        }
      }

      handleQuestionAction(event.pageDirection);

      _currentQuestionIndex = nextQuestionIndex ?? (_currentQuestionIndex);

      _startTimer();

      emit(
        myState.copyWith(
          currentQuestionIndex: _currentQuestionIndex,
        ),
      );
    }
  }

  void _updateDuration(
    _UpdateDurationEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final myState = state as QuizLoadedState;

      final currentQuestion = myState.questions[myState.currentQuestionIndex];

      if (currentQuestion.duration <= Duration.zero) {
        add(
          const UpdateCurrentQuestionEvent(
            pageDirection: ScrollDirection.reverse,
          ),
        );
      }

      final updatedQuizStateModel = myState.questions[_currentQuestionIndex].copyWith(
        duration: myState.questions[_currentQuestionIndex].duration - const Duration(seconds: 1),
      );

      _displayedQuestionDuration =
          myState.questions[_currentQuestionIndex].duration >= Duration.zero
              ? myState.questions[_currentQuestionIndex].duration - const Duration(seconds: 1)
              : Duration.zero;

      // if (_displayedQuestionDuration <= const Duration(seconds: -1) &&
      //     updatedQuizStateModel.status == QuestionStatus.answered) {
      //   return;
      // }

      final updatedDurationList = [...myState.questions]..replaceRange(
          _currentQuestionIndex,
          _currentQuestionIndex + 1,
          [updatedQuizStateModel],
        );

      emit(myState.copyWith(questions: updatedDurationList));

      if (updatedQuizStateModel.duration <= Duration.zero &&
          updatedQuizStateModel.status != QuestionStatus.answered) {
        final expiredQuestionList = [...updatedDurationList]..replaceRange(
            _currentQuestionIndex,
            _currentQuestionIndex + 1,
            [
              updatedQuizStateModel.copyWith(status: QuestionStatus.expired),
            ],
          );

        emit(myState.copyWith(questions: expiredQuestionList));

        add(
          const UpdateCurrentQuestionEvent(pageDirection: ScrollDirection.reverse),
        );

        return;
      }
    }
  }

  void _finishQuiz(
    FinishQuizEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final myState = state as QuizLoadedState;

      final correctQuestionCount = myState.questions
          .where((element) => element.status == QuestionStatus.answered)
          .where((element) => element.selectedAnswer == element.questionModel.correctAnswer)
          .length;

      final totalQuestionCount = myState.questions.length;

      emit(QuizFinishState(
        correctQuestionCount: correctQuestionCount,
        totalQuestionCount: totalQuestionCount,
      ));
      return;
    }
  }

  Timer? _timer;

  void _startTimer() {
    if (_timer != null) _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      add(const _UpdateDurationEvent());
    });
  }

  @override
  Future<void> close() {
    if (_timer != null) _timer?.cancel();

    return super.close();
  }
}
