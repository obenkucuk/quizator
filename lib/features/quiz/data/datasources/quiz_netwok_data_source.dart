import 'package:flutter/cupertino.dart';
import '../models/quiz_model.dart';
import '../services/quiz_service.dart';

@immutable
class QuizNetworkDataSource {
  final QuizService quizService;

  const QuizNetworkDataSource({
    required this.quizService,
  });

  Future<QuizModel> getSelectedQuiz({
    required int category,
  }) async {
    try {
      final result = await quizService.getSelectedQuiz(category);

      return Future.value(result.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
