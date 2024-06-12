import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';

import '../../../../injection_container.dart';
import 'quiz_loaded_view.dart';

@immutable
final class QuizView extends StatelessWidget {
  const QuizView({super.key, required this.category});

  final int category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuizBloc>()..add(QuizEvent.getSelectedQuiz(category: category)),
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
        builder: (context, state) {
          return CupertinoPageScaffold(
            child: state.when(
              loading: () =>
                  Center(child: CupertinoActivityIndicator(color: context.myColors.primaryColor)),
              loaded: (_, __, ___, ____) => const QuizLoadedView(),
              error: (message) => Center(child: Text(message)),
            ),
          );
        },
      ),
    );
  }
}
