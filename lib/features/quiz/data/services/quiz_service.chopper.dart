// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$QuizService extends QuizService {
  _$QuizService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = QuizService;

  @override
  Future<Response<QuizModel>> getSelectedQuiz(
    int category, {
    int amount = 10,
    String type = 'multi',
  }) {
    final Uri $url = Uri.parse('/amount=10&category=25/');
    final Map<String, dynamic> $params = <String, dynamic>{
      'category': category,
      'amount': amount,
      'type': type,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<QuizModel, QuizModel>($request);
  }
}
