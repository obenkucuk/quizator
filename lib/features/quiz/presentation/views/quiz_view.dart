import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quizator/components/sliver_sized_box.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/config/theme/text_styles.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';
import 'package:quizator/features/quiz/presentation/widgets/dot_indicator.dart';

import '../../../../injection_container.dart';
import '../widgets/question_item.dart';

@immutable
final class QuizView extends HookWidget {
  const QuizView({super.key, required this.category});

  final int category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QuizBloc>()..add(QuizEvent.getSelectedQuiz(category: category)),
      child: BlocBuilder<QuizBloc, QuizState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return CupertinoPageScaffold(
            child: state.when(
              loading: () =>
                  Center(child: CupertinoActivityIndicator(color: context.myColors.primaryColor)),
              loaded: (
                quizStateModels,
                currentQuestion,
                userStartedQuiz,
              ) =>
                  HookBuilder(
                builder: (context) {
                  final pageController = usePageController();

                  useEffect(
                    () {
                      pageController.addListener(() {});

                      return null;
                    },
                    const [],
                  );

                  return BlocListener<QuizBloc, QuizState>(
                    listener: (context, state) {
                      // if (state is QuizLoadedState) {
                      //   print('BURADA LISTENER şimdiki soru ${state.currentQuestion}');
                      //   if (pageController.index < quizStateModels.length) {
                      //     pageController.animateTo(state.currentQuestion);
                      //     print('index değişiyoreeee ${pageController.indexIsChanging}');
                      //   }
                      // }
                    },
                    listenWhen: (previous, current) {
                      print('DINLEME');
                      if (previous is QuizLoadedState && current is QuizLoadedState) {
                        print(
                            'Buraya girdi mi ${previous.currentQuestion}  --- ${current.currentQuestion}');
                        return previous.currentQuestion != current.currentQuestion;
                      }

                      return false;
                    },
                    child: CustomScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      slivers: [
                        SliverSizedBox(height: MediaQuery.paddingOf(context).top),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          sliver: SliverToBoxAdapter(
                            child: LinearProgressIndicator(
                              color: Colors.amber,
                              borderRadius: const BorderRadius.all(Radius.circular(500)),
                              value: (state as QuizLoadedState)
                                      .questions[currentQuestion]
                                      .remainingTime /
                                  10,
                            ),
                          ),
                        ),
                        SliverFillViewport(
                          viewportFraction: 0.8,
                          padEnds: false,
                          delegate: SliverChildListDelegate.fixed(
                            [
                              PageView(
                                onPageChanged: (page) {
                                  context.read<QuizBloc>().add(
                                        UpdateCurrentQuestionEvent(
                                          updateIndexWith: page,
                                        ),
                                      );
                                },
                                controller: pageController,
                                physics: userStartedQuiz
                                    ? const BouncingScrollPhysics()
                                    : const NeverScrollableScrollPhysics(),
                                children: List.generate(
                                  state.questions.length,
                                  (index) {
                                    final quizStateModel = quizStateModels[index];

                                    return Stack(
                                      fit: StackFit.expand,
                                      children: [
                                        //* Question
                                        QuestionItem(
                                          quizStateModel: quizStateModel,
                                          pageController: pageController,
                                        ).animate(target: userStartedQuiz ? 0 : 1).blur(),

                                        //* Start Button
                                        Offstage(
                                          offstage: userStartedQuiz,
                                          child: Center(
                                            child: SizedBox(
                                              height: 36,
                                              width: MediaQuery.sizeOf(context).width * 0.5,
                                              child: CupertinoButton.filled(
                                                  padding: EdgeInsets.zero,
                                                  child: Text(
                                                    'Start Quiz',
                                                    style: s14W600.copyWith(
                                                      color:
                                                          context.myColors.scaffoldBackgroundColor,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<QuizBloc>()
                                                        .add(const StartQuizEvent());
                                                  }),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SliverSizedBox(
                          height: 12,
                          child: DotIndicator(
                            quizStateModels: quizStateModels,
                            currentQuestion: (state as QuizLoadedState).currentQuestion,
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
              error: (message) => Center(child: Text(message)),
            ),
          );
        },
      ),
    );
  }
}
