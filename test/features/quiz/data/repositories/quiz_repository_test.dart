import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quizator/core/failures/failure.dart';
import 'package:quizator/core/helpers/network_info.dart';
import 'package:quizator/features/quiz/data/datasources/quiz_netwok_data_source.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/data/repositories/quiz_repository.dart';
import 'package:quizator/services/log/my_logger.dart';

import '../../../../dummy_data/reader.dart';
import 'quiz_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MyTalkerLogger>()])
@GenerateNiceMocks([MockSpec<QuizNetworkDataSource>()])
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main() {
  late MyTalkerLogger myTalkerLogger;
  late MockQuizNetworkDataSource quizNetworkDataSource;
  late MockNetworkInfo networkInfo;
  late QuizRepository quizRepository;

  setUp(() {
    myTalkerLogger = MockMyTalkerLogger();
    quizNetworkDataSource = MockQuizNetworkDataSource();
    networkInfo = MockNetworkInfo();

    quizRepository = QuizRepository(
      myTalkerLogger: myTalkerLogger,
      quizNetworkDataSource: quizNetworkDataSource,
      networkInfo: networkInfo,
    );
  });

  group('QuizRepository', () {
    const tCategory = 1;
    final quizModel = QuizModel.fromJson(jsonDecode(dummyQuizModelReader()));

    test('Is internet connected?', () async {
      when(networkInfo.isConnected).thenAnswer((_) async => true);

      final result = await quizRepository.getSelectedQuiz(category: tCategory);

      verify(networkInfo.isConnected).called(1);
      expect(quizRepository.networkInfo.isConnected, isA<Future<bool>>());
      expect(result, isA<Right<IFailure, QuizModel>>());
    });

    group('Device ONLINE', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => true);
        when(myTalkerLogger.handle(Exception(), any)).thenReturn(null);
      });

      test('Return Right(QuizModel)', () async {
        when(quizNetworkDataSource.getSelectedQuiz(category: anyNamed('category')))
            .thenAnswer((_) async => quizModel);

        final result = await quizRepository.getSelectedQuiz(category: tCategory);

        verify(quizNetworkDataSource.getSelectedQuiz(category: anyNamed('category'))).called(1);
        expect(result, equals(Right<IFailure, QuizModel>(quizModel)));
      });

      test('Return Left(ServerFailure)', () async {
        when(quizNetworkDataSource.getSelectedQuiz(category: anyNamed('category')))
            .thenThrow((_) async => const ServerFailure());

        final result = await quizRepository.getSelectedQuiz(category: tCategory);

        verify(quizNetworkDataSource.getSelectedQuiz(category: anyNamed('category'))).called(1);
        expect(result, equals(const Left<IFailure, QuizModel>(ServerFailure())));
      });
    });

    group('Device OFFLINE', () {
      setUp(() {
        when(networkInfo.isConnected).thenAnswer((_) async => false);
        when(myTalkerLogger.handle(Exception(), any)).thenReturn(null);
      });

      test('Return Left(NetworkFailure)', () async {
        when(quizNetworkDataSource.getSelectedQuiz(category: anyNamed('category')))
            .thenThrow((_) async => const NetworkFailure());

        final result = await quizRepository.getSelectedQuiz(category: tCategory);

        expect(result, equals(const Left<IFailure, QuizModel>(NetworkFailure())));
      });
    });
  });
}
