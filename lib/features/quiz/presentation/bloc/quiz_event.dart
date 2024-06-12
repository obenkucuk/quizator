part of 'quiz_bloc.dart';

@freezed
class QuizEvent with _$QuizEvent {
  const factory QuizEvent.getSelectedQuiz({
    required int category,
  }) = GetSelectedQuizEvent;

  const factory QuizEvent.startQuiz() = StartQuizEvent;

  const factory QuizEvent.answerQuestion({
    required String selectedAnswer,
    required QuizStateModel quizStateModel,
    required int index,
  }) = AnswerQuestionEvent;

  const factory QuizEvent.updateCurrentQuestion({
    required bool withAnimation,
    required ScrollDirection pageDirection,
    int? pageIndex,
  }) = UpdateCurrentQuestionEvent;

  const factory QuizEvent.updateDuration() = UpdateDurationEvent;
}
