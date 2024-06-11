import 'dart:convert';

import 'package:chopper/chopper.dart' as chopper;
import 'package:http/http.dart' as http;

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quizator/features/quiz/data/datasources/quiz_netwok_data_source.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/data/services/quiz_service.dart';

import '../../../../dummy_data/reader.dart';
import 'quiz_netwok_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<QuizService>()])
void main() {
  late MockQuizService service;
  late QuizNetworkDataSource networkDataSource;

  setUp(() {
    service = MockQuizService();
    networkDataSource = QuizNetworkDataSource(quizService: service);
  });

  group('Get QuizModel', () {
    const tCategory = 1;
    final quizModel = QuizModel.fromJson(jsonDecode(dummyQuizModelReader()));

    test('Get Model When RESONSE CODE is 200', () async {
      final httpRes = http.Response('', 200);
      final chopperRes = chopper.Response<QuizModel>(httpRes, quizModel);

      provideDummy<chopper.Response<QuizModel>>(chopperRes);
      when(service.getSelectedQuiz(any)).thenAnswer((_) async => chopperRes);

      final result = await networkDataSource.getSelectedQuiz(category: tCategory);

      expect(result, isA<QuizModel>());
    });

    //TODO: API yi dene
    test('Get Model When RESONSE CODE is NOT 200', () async {
      final httpRes = http.Response('', 500);
      final chopperRes = chopper.Response<QuizModel>(httpRes, quizModel);

      provideDummy<chopper.Response<QuizModel>>(chopperRes);
      when(service.getSelectedQuiz(any)).thenThrow((_) async => chopperRes);

      final method = networkDataSource.getSelectedQuiz;

      expect(() => method.call(category: tCategory), throwsA(const TypeMatcher<Exception>()));
    });
  });
}
