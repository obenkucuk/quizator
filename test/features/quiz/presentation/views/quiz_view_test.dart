import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fpdart/fpdart.dart';
import 'package:quizator/config/theme/bloc/theme_bloc.dart';
import 'package:quizator/config/theme/my_theme_data.dart';
import 'package:quizator/core/failures/failure.dart';
import 'package:quizator/features/quiz/data/models/quiz_model.dart';
import 'package:quizator/features/quiz/domain/usecases/get_selected_quiz.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quizator/features/quiz/presentation/views/quiz_loaded_view.dart';
import 'package:quizator/features/quiz/presentation/views/quiz_view.dart';
import 'package:quizator/services/log/my_logger.dart';

import '../../../../dummy_data/reader.dart';
import '../bloc/quiz_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetSelectedQuiz>(),
  MockSpec<MyTalkerLogger>(),
])
void main() {
  late QuizBloc bloc;
  late MockGetSelectedQuiz getSelectedQuiz;
  late MyTalkerLogger myTalkerLogger;

  final model = QuizModel.fromJson(jsonDecode(dummyQuizModelReader()));
  const tCategory = 1;

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    getSelectedQuiz = MockGetSelectedQuiz();
    myTalkerLogger = MockMyTalkerLogger();

    bloc = QuizBloc(
      getSelectedQuiz: getSelectedQuiz,
      myTalkerLogger: myTalkerLogger,
    );

    provideDummy<Either<IFailure, QuizModel>>(Right(model));
    when(getSelectedQuiz(any)).thenAnswer((_) async => Right(model));

    bloc.add(const QuizEvent.getSelectedQuiz(category: tCategory));

    await Future.delayed(const Duration(milliseconds: 3000));
  });

  testWidgets(
    'Single Quiz View Test',
    (widgetTester) async {
      await widgetTester.pumpWidget(_WidgetUnderTest(bloc: bloc));

      await widgetTester.pump(const Duration(milliseconds: 300));

      expect(find.byType(CupertinoPageScaffold), findsOneWidget);
      expect(find.text('Start Quiz'), findsOneWidget);

      await widgetTester.tap(find.text('Start Quiz'));

      await widgetTester.pump(const Duration(milliseconds: 300));

      expect(find.byType(QuizLoadedView), findsOneWidget);
      bloc.state as QuizLoadedState;

      expect(0, (bloc.state as QuizLoadedState));

      await widgetTester.pumpAndSettle(const Duration(milliseconds: 300));

      await widgetTester.tap(find.byKey(const Key('quiz_answer_1')));

      await widgetTester.pump(const Duration(milliseconds: 100));

      expect(find.byType(Stack), findsExactly(4));

      expect(1, (bloc.state as QuizLoadedState).currentQuestionIndex);
    },
  );
}

class _WidgetUnderTest extends StatelessWidget {
  final QuizBloc bloc;
  const _WidgetUnderTest({required this.bloc});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: lightTheme,
      child: CupertinoApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => bloc),
            BlocProvider(create: (context) => ThemeBloc()),
          ],
          child: const QuizView(),
        ),
      ),
    );
  }
}
