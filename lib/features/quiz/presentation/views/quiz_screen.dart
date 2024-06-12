import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quizator/features/quiz/presentation/views/quiz_view.dart';

import '../../../../injection_container.dart';

@immutable
final class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key, required this.category});

  final int category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuizBloc>()..add(QuizEvent.getSelectedQuiz(category: category)),
      child: const QuizView(),
    );
  }
}
