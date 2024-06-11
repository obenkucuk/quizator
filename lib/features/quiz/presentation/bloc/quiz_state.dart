part of 'quiz_bloc.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.loading() = QuizLoadingState;

  const factory QuizState.loaded(
    List<QuizStateModel> questions, {
    @Default(0) int currentQuestion,
    @Default(false) bool userStartedQuiz,
  }) = QuizLoadedState;

  const factory QuizState.error({
    required String message,
  }) = QuizErrorState;
}

@immutable
final class QuizStateModel extends Equatable {
  final QuestionModel questionModel;
  final double remainingTime;
  final QuestionStatus status;
  final String? selectedAnswer;
  final List<String> answerList;

  const QuizStateModel({
    required this.questionModel,
    this.remainingTime = 10,
    this.status = QuestionStatus.unanswered,
    this.selectedAnswer,
    required this.answerList,
  });

  QuizStateModel copyWith({
    QuestionModel? questionModel,
    double? remainingTime,
    QuestionStatus? status,
    String? selectedAnswer,
    List<String>? answerList,
  }) =>
      QuizStateModel(
        questionModel: questionModel ?? this.questionModel,
        remainingTime: remainingTime ?? this.remainingTime,
        status: status ?? this.status,
        selectedAnswer: selectedAnswer ?? this.selectedAnswer,
        answerList: answerList ?? this.answerList,
      );

  @override
  List<Object?> get props => [
        questionModel,
        remainingTime,
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
