part of 'quiz_bloc.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.loading() = QuizLoadingState;

  const factory QuizState.loaded(
    List<QuizStateModel> questions, {
    @Default(0) int currentQuestionIndex,
    @Default(false) bool userStartedQuiz,
  }) = QuizLoadedState;

  const factory QuizState.error({
    required String message,
  }) = QuizErrorState;

  const factory QuizState.finishQuiz() = QuizFinishState;
}

@immutable
final class QuizStateModel extends Equatable {
  final QuestionModel questionModel;
  final Duration duration;
  final QuestionStatus status;
  final String? selectedAnswer;
  final List<String> answerList;

  const QuizStateModel({
    required this.questionModel,
    this.duration = const Duration(seconds: 10),
    this.status = QuestionStatus.unanswered,
    this.selectedAnswer,
    required this.answerList,
  });

  QuizStateModel copyWith({
    QuestionModel? questionModel,
    Duration? duration,
    QuestionStatus? status,
    String? selectedAnswer,
    List<String>? answerList,
  }) =>
      QuizStateModel(
        questionModel: questionModel ?? this.questionModel,
        duration: duration ?? this.duration,
        status: status ?? this.status,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        answerList: answerList ?? this.answerList,
      );

  @override
  List<Object?> get props => [
        questionModel,
        duration,
        status,
        selectedAnswer,
        answerList,
      ];
}

enum QuestionStatus {
  unanswered,
  answered,
  expired,
  ;

  Color get color => switch (this) {
        unanswered => const Color(0xffAEAAAA),
        answered => Colors.blue, //const Color(0xff4472C4),
        expired => const Color(0xffF00000),
      };
}
