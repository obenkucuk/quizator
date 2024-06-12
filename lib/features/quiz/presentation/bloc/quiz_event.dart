part of 'quiz_bloc.dart';

@freezed
class QuizEvent with _$QuizEvent {
  const factory QuizEvent.getSelectedQuiz({
    required int category,
  }) = _GetSelectedQuizEvent;

  const factory QuizEvent.startQuiz() = StartQuizEvent;

  const factory QuizEvent.answerQuestion({
    required String selectedAnswer,
    required QuizStateModel quizStateModel,
    required int index,
  }) = AnswerQuestionEvent;

  const factory QuizEvent.updateCurrentQuestion({
    required ScrollDirection pageDirection,
  }) = UpdateCurrentQuestionEvent;

  const factory QuizEvent.updateDuration() = _UpdateDurationEvent;

  const factory QuizEvent.finishQuiz() = FinishQuizEvent;
}
