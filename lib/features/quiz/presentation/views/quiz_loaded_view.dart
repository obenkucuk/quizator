import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/features/quiz/presentation/widgets/question_item_widget.dart';

import '../../../../components/sliver_sized_box.dart';
import '../../../../config/theme/text_styles.dart';
import '../bloc/quiz_bloc.dart';

part '../widgets/question_duration_indicator_widget.dart';
part '../widgets/dot_indicator.dart';

class QuizLoadedView extends HookWidget {
  const QuizLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final previousPage = useState(0);
    final isPageAnimating = useState(false);

    useEffect(() {
      pageController.addListener(() {
        int currentPage = pageController.page?.round() ?? 0;

        isPageAnimating.value = !((pageController.page != null) &&
            (pageController.page is int ||
                pageController.page == pageController.page?.roundToDouble()));

        if (previousPage.value != currentPage) {
          if (previousPage.value < currentPage) {
            log('Went to next page');
          } else if (previousPage.value > currentPage) {
            log('Went to previous page');
          }

          previousPage.value = currentPage;
        }
      });

      return null;
    });

    return BlocBuilder<QuizBloc, QuizState>(
      buildWhen: (previous, current) {
        if (previous is QuizLoadedState && current is QuizLoadedState) {
          return (previous.currentQuestionIndex != current.currentQuestionIndex) ||
              (current.userStartedQuiz != previous.userStartedQuiz);
        }

        return false;
      },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (quizStateModels, currentQuestionIndex, userStartedQuiz) {
            return BlocListener<QuizBloc, QuizState>(
              listener: (context, state) {
                if (state is QuizLoadedState) {
                  pageController.animateToPage(
                    state.currentQuestionIndex,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                  );
                }
              },
              listenWhen: (previous, current) {
                if (previous is QuizLoadedState && current is QuizLoadedState) {
                  return previous.currentQuestionIndex != current.currentQuestionIndex;
                  // current.withPageAnimation;
                }

                return false;
              },
              child: Stack(
                children: [
                  CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      //* Padding
                      SliverSizedBox(height: MediaQuery.paddingOf(context).top),

                      //* Duration Indicator
                      _QuestionDurationIndicatorWidget(currentQuestionIndex: previousPage.value),

                      //* Question Widget
                      SliverFillViewport(
                        viewportFraction: 0.8,
                        padEnds: false,
                        delegate: SliverChildListDelegate.fixed(
                          [
                            NotificationListener<UserScrollNotification>(
                              onNotification: (notification) {
                                context.read<QuizBloc>().add(
                                      UpdateCurrentQuestionEvent(
                                        pageDirection: notification.direction,
                                      ),
                                    );

                                return false;
                              },
                              child: PageView.builder(
                                padEnds: false,
                                onPageChanged: (page) {
                                  previousPage.value = page;
                                },
                                itemCount: (state as QuizLoadedState).questions.length,
                                controller: pageController,
                                physics: (userStartedQuiz) //&& !isPageAnimating.value
                                    ? const BouncingScrollPhysics()
                                    : const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final quizStateModel = quizStateModels[index];

                                  return BlocBuilder<QuizBloc, QuizState>(
                                    builder: (context, state) {
                                      return Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          //* Question
                                          QuestionItemWidget(
                                            // currentQuestion: previousPage.value,
                                            currentQuestionIndex: index,
                                            quizStateModel: quizStateModel,
                                          )
                                              .animate(
                                                target: (state as QuizLoadedState).userStartedQuiz
                                                    ? 0
                                                    : 1,
                                              )
                                              .blur(),

                                          //* Start Button
                                          Offstage(
                                            offstage: state.userStartedQuiz,
                                            child: Center(
                                              child: SizedBox(
                                                height: 36,
                                                width: MediaQuery.sizeOf(context).width * 0.5,
                                                child: CupertinoButton.filled(
                                                  padding: EdgeInsets.zero,
                                                  child: Text(
                                                    'Start Quiz',
                                                    style: s14W600(context).copyWith(
                                                      color:
                                                          context.myColors.scaffoldBackgroundColor,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    context
                                                        .read<QuizBloc>()
                                                        .add(const StartQuizEvent());
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      //* Dot Indicator
                      _DotIndicator(
                        quizStateModels: quizStateModels,
                        currentQuestion: previousPage.value,
                      ),

                      BlocBuilder<QuizBloc, QuizState>(
                        builder: (context, state) {
                          final questionStatusList =
                              (state as QuizLoadedState).questions.map((e) => e.status).toList();

                          if (!questionStatusList.contains(QuestionStatus.unanswered)) {
                            return SliverPadding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                              sliver: SliverSizedBox(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(500)),
                                  child: CupertinoButton(
                                    color: context.myColors.primaryColor,
                                    child: Text(
                                      'Submit',
                                      style: s16W700(context).copyWith(
                                          color: context.myColors.scaffoldBackgroundColor),
                                    ),
                                    onPressed: () {
                                      context.read<QuizBloc>().add(const FinishQuizEvent());
                                    },
                                  ),
                                ),
                              ),
                            );
                          }

                          return const SliverSizedBox();
                        },
                      )
                    ],
                  ),
                  BlocBuilder<QuizBloc, QuizState>(
                    builder: (context, state) {
                      state as QuizLoadedState;
                      if (isPageAnimating.value) {
                        return const SizedBox(
                          height: double.infinity,
                          width: double.infinity,
                          child: ColoredBox(
                            color: Colors.transparent,
                          ),
                        );
                      }

                      return const SizedBox();
                    },
                  )
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}
