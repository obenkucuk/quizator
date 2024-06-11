import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz_model.freezed.dart';
part 'quiz_model.g.dart';

@freezed
class QuizModel with _$QuizModel {
  const factory QuizModel({
    @JsonKey(name: 'response_code') required int responseCode,
    required List<QuestionModel> results,
  }) = _QuizModel;

  factory QuizModel.fromJson(Map<String, dynamic> json) => _$QuizModelFromJson(json);
}

@freezed
class QuestionModel with _$QuestionModel {
  const factory QuestionModel({
    String? type,
    Difficulty? difficulty,
    String? category,
    String? question,
    @JsonKey(name: 'correct_answer') required String correctAnswer,
    @JsonKey(name: 'incorrect_answers') required List<String> incorrectAnswers,
  }) = _Results;

  factory QuestionModel.fromJson(Map<String, dynamic> json) => _$QuestionModelFromJson(json);
}

enum Difficulty {
  @JsonValue("easy")
  easy,
  @JsonValue("medium")
  medium,
  @JsonValue("hard")
  hard,

  unknown,
  ;

  Color get color => switch (this) {
        easy => Colors.green,
        medium => Colors.amber,
        hard => Colors.redAccent,
        unknown => Colors.black,
      };
}
