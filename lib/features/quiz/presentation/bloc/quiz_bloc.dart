import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  }

  void _answerQuestion(
    AnswerQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    print('ANSWER QUESTION EVENT: ${event.index}');
    if (state is QuizLoadedState) {
      final answeredQuestionList = [...(state as QuizLoadedState).questions]..replaceRange(
          event.index,
          event.index + 1,
          [
            event.quizStateModel.copyWith(
              selectedAnswer: event.selectedAnswer,
              status: QuestionStatus.answered,
            )
          ],
        );

      answeredQuestionList.forEach((e) {
        print((e.selectedAnswer ?? '') + '---' + e.status.toString());
      });

      emit(
        (state as QuizLoadedState).copyWith(
          questions: answeredQuestionList,
          // currentQuestion: event.index + 1,
        ),
      );
    }
  }

  void _updateCurrentQuestion(
    UpdateCurrentQuestionEvent event,
    Emitter<QuizState> emit,
  ) {
    print('update qurrent question ${event.updateIndexWith}');
    if (state is QuizLoadedState) {
      emit(
        (state as QuizLoadedState).copyWith(
          currentQuestion: event.updateIndexWith,
        ),
      );
    }

    try {
      _timer?.cancel();
    } catch (_) {}
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      add(const UpdateDurationEvent());
    });
  }

  void _updateDuration(
    UpdateDurationEvent event,
    Emitter<QuizState> emit,
  ) {
    if (state is QuizLoadedState) {
      final u = (state as QuizLoadedState)
          .questions[(state as QuizLoadedState).currentQuestion]
          .copyWith(
              remainingTime: (state as QuizLoadedState)
                      .questions[(state as QuizLoadedState).currentQuestion]
                      .remainingTime -
                  1);

      final updatedDurationList = [...(state as QuizLoadedState).questions]..replaceRange(
          (state as QuizLoadedState).currentQuestion,
          (state as QuizLoadedState).currentQuestion + 1,
          [u]);

      emit((state as QuizLoadedState).copyWith(
        questions: updatedDurationList,
      ));
    }
  }

  late Timer? _timer;

  @override
  Future<void> close() {
    _timer?.cancel();

    return super.close();
  }
}
