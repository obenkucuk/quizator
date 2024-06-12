import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/features/quiz/presentation/views/quiz_loaded_view.dart';

import '../bloc/quiz_bloc.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (state is QuizFinishState) {
          QuizScoreRoute(
            correctQuestionCount: state.correctQuestionCount,
            totalQuestionCount: state.totalQuestionCount,
          ).go(context);
        }
      },
      listenWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      buildWhen: (previous, current) => previous.runtimeType != current.runtimeType,
      builder: (context, state) {
        return CupertinoPageScaffold(
          child: state.when(
            loading: () =>
                Center(child: CupertinoActivityIndicator(color: context.myColors.primaryColor)),
            loaded: (_, __, ___) => const QuizLoadedView(),
            error: (message) => Center(child: Text(message)),
            finishQuiz: (_, __) => const SizedBox(),
          ),
        );
      },
    );
  }
}
