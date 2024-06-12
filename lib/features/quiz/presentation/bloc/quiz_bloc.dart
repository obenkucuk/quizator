import 'dart:async';
import 'dart:convert';
import 'dart:developer';

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
    on<GetSelectedQuizEvent>(_getSelectedQuiz);
    on<StartQuizEvent>(_startQuiz);
    on<AnswerQuestionEvent>(_answerQuestion);
    on<UpdateCurrentQuestionEvent>(_updateCurrentQuestion);
    on<UpdateDurationEvent>(_updateDuration);
  }

  Duration _displayedQuestionDuration = const Duration(seconds: 10);
  int _currentQuestionIndex = 0;

  Future<void> _getSelectedQuiz(
    GetSelectedQuizEvent event,
    Emitter<QuizState> emit,
  ) async {
    /// TODO: api haline çevir geriye
    // final result = await getSelectedQuiz(SelectedQuizParams(category: event.category));

    // result.fold(
    //   (failure) => emit(QuizErrorState(message: failure.message)),
    //   (data) {
    //     final quizStateModels = List.generate(data.results.length, (index) {
    //       return QuizStateModel(questionModel: data.results[index]);
    //     });

    //     emit(QuizState.loaded(quizStateModels));
    //   },
    // );

    final data = QuizModel.fromJson(
        jsonDecode(await rootBundle.loadString('assets/dummy_data/quiz_model.json')));

    final quizStateModels = List.generate(data.results.length, (index) {
      final questionModel = data.results[index];

      final answerList = [...questionModel.incorrectAnswers.take(2), questionModel.correctAnswer]
        ..shuffle();

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
    print('ANSWER QUESTION EVENT: ${event.index}');
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

      log('soru cevaplayınca patlıyor');
      print('NEDEN ZAMAN SIFIRLANIYOR: ${myState.questions.elementAt(event.index).duration}');
      emit(
        myState.copyWith(
          questions: answeredQuestionList,
          withPageAnimation: true,
        ),
      );

      add(
        const UpdateCurrentQuestionEvent(
          withAnimation: true,
          pageDirection: ScrollDirection.idle,
        ),
      );
    }
  }

  void _updateCurrentQuestion(
    UpdateCurrentQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    print('update qurrent question $_currentQuestionIndex');
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

      final nextAsweredQuestion =
          nextQuestions.firstWhereOrNull((element) => element.status == QuestionStatus.answered);

      final previousAsweredQuestion = previousQuestions.reversed
          .firstWhereOrNull((element) => element.status == QuestionStatus.answered);

      final hasAnyNextUnasweredQuestion =
          nextQuestions.any((element) => element.status == QuestionStatus.unanswered);

      final hasAnyPreviousUnasweredQuestion =
          previousQuestions.any((element) => element.status == QuestionStatus.unanswered);

      final hasAnyNextAsweredQuestion = nextQuestions.any((element) =>
          element.status == QuestionStatus.answered && element.duration > Duration.zero);

      final hasAnyPreviousAsweredQuestion = previousQuestions.any((element) =>
          element.status == QuestionStatus.answered && element.duration > Duration.zero);

      log(event.pageDirection.name);

      if (event.pageDirection == ScrollDirection.idle &&
          hasAnyNextUnasweredQuestion &&
          nextUnasweredQuestion != null) {
        nextQuestionIndex = myState.questions.indexOf(nextUnasweredQuestion);

        log('11111');
      } else if (event.pageDirection == ScrollDirection.idle &&
          hasAnyPreviousUnasweredQuestion &&
          previousUnasweredQuestion != null) {
        nextQuestionIndex = myState.questions.indexOf(previousUnasweredQuestion);
        log('22222');
      } else if (event.pageDirection == ScrollDirection.reverse &&
          hasAnyNextUnasweredQuestion &&
          nextUnasweredQuestion != null) {
        log('3333333');

        nextQuestionIndex = myState.questions.indexOf(nextUnasweredQuestion);
      } else if (event.pageDirection == ScrollDirection.reverse &&
          !hasAnyNextUnasweredQuestion &&
          hasAnyPreviousUnasweredQuestion &&
          previousUnasweredQuestion != null) {
        log('44444');
        nextQuestionIndex = myState.questions.indexOf(previousUnasweredQuestion);
      } else if (event.pageDirection == ScrollDirection.forward &&
          hasAnyPreviousUnasweredQuestion &&
          previousUnasweredQuestion != null) {
        log('555555');

        nextQuestionIndex = myState.questions.indexOf(previousUnasweredQuestion);
      } else if (event.pageDirection == ScrollDirection.forward &&
          hasAnyPreviousAsweredQuestion &&
          previousAsweredQuestion != null) {
        nextQuestionIndex = myState.questions.indexOf(previousAsweredQuestion);
      } else if (event.pageDirection == ScrollDirection.forward &&
          !hasAnyPreviousUnasweredQuestion &&
          hasAnyNextUnasweredQuestion &&
          nextUnasweredQuestion != null) {
        log('66666');
        nextQuestionIndex = myState.questions.indexOf(nextUnasweredQuestion);
      } else if (event.pageIndex != null) {
        nextQuestionIndex = event.pageIndex;
      } else {
        log('88888');

        final firstNext = nextQuestions.firstWhereOrNull((quizModel) {
          return quizModel.duration > Duration.zero;
        });

        if (firstNext != null) {
          nextQuestionIndex = allQuestions.indexOf(firstNext);
        } else {
          final firstPrevious = previousQuestions.reversed.firstWhereOrNull((quizModel) {
            return quizModel.duration > Duration.zero;
          });

          if (firstPrevious != null) {
            nextQuestionIndex = allQuestions.indexOf(firstPrevious);
          }
        }
      }

      log('next ques' + nextQuestionIndex.toString());

      _currentQuestionIndex = nextQuestionIndex ?? (_currentQuestionIndex);

      log('current question index: $_currentQuestionIndex');
      _startTimer();

      emit(
        myState.copyWith(
          currentQuestionIndex: _currentQuestionIndex,
          withPageAnimation: true,
        ),
      );
    }
  }

  void _updateDuration(
    UpdateDurationEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final myState = state as QuizLoadedState;

      final currentQuestion = myState.questions[myState.currentQuestionIndex];

      if (currentQuestion.duration <= Duration.zero) {
        add(
          const UpdateCurrentQuestionEvent(
            withAnimation: true,
            pageDirection: ScrollDirection.idle,
          ),
        );
      }

      log("update");
      final updatedQuizStateModel = myState.questions[_currentQuestionIndex].copyWith(
        duration: myState.questions[_currentQuestionIndex].duration - const Duration(seconds: 1),
      );

      log('current question index: $_currentQuestionIndex');
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

      log('DURATİON LİSTESİ YPDATE EDİLİYOR : duration: ${updatedQuizStateModel.duration}');
      emit(myState.copyWith(questions: updatedDurationList));

      log('Sonrası DURATİON LİSTESİ YPDATE EDİLİYOR : duration: ${updatedQuizStateModel.duration}');
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
          const UpdateCurrentQuestionEvent(
            withAnimation: true,
            pageDirection: ScrollDirection.idle,
          ),
        );

        return;
      }
    }
  }

  Timer? _timer;

  void _startTimer() {
    if (_timer != null) _timer?.cancel();

    log('timer içi süre: ${_displayedQuestionDuration.inSeconds}');

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      add(const UpdateDurationEvent());
    });
  }

  @override
  Future<void> close() {
    if (_timer != null) _timer?.cancel();

    return super.close();
  }
}
