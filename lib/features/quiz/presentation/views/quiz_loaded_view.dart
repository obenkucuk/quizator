import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  const QuizLoadedView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final previousPage = useState(0);
    final scrollDirection = useState<ScrollDirection>(ScrollDirection.idle);

    useEffect(() {
      pageController.addListener(() {
        int currentPage = pageController.page?.round() ?? 0;
        if (previousPage.value != currentPage) {
          if (previousPage.value < currentPage) {
            log('Went to next page');
            scrollDirection.value = ScrollDirection.reverse;
          } else if (previousPage.value > currentPage) {
            log('Went to previous page');
            scrollDirection.value = ScrollDirection.forward;
          }
          previousPage.value = currentPage;
        }
      });
      return null;
    });

    return BlocBuilder<QuizBloc, QuizState>(
      // buildWhen: (previous, current) {
      //   return ((previous as QuizLoadedState).currentQuestionIndex !=
      //           (current as QuizLoadedState).currentQuestionIndex) ||
      //       ((current).userStartedQuiz != (previous).userStartedQuiz);
      // },
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (
            quizStateModels,
            currentQuestionIndex,
            userStartedQuiz,
            _,
          ) {
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
                  return previous.currentQuestionIndex != current.currentQuestionIndex &&
                      current.withPageAnimation;
                }

                return false;
              },
              child: CustomScrollView(
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
                            switch (notification.direction) {
                              case ScrollDirection.forward:
                                log('AAAAAA User scrolled forward');
                                break;
                              case ScrollDirection.reverse:
                                log('AAAAAA  User scrolled backward');
                                break;
                              case ScrollDirection.idle:
                                context.read<QuizBloc>().add(
                                      UpdateCurrentQuestionEvent(
                                        withAnimation: true,
                                        pageDirection: scrollDirection.value,
                                        pageIndex: previousPage.value,
                                      ),
                                    );
                                break;
                            }

                            return false;
                          },
                          child: PageView.builder(
                            padEnds: false,
                            onPageChanged: (page) {
                              previousPage.value = page;
                            },
                            itemCount: (state as QuizLoadedState).questions.length,
                            controller: pageController,
                            physics: userStartedQuiz
                                ? const BouncingScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              print('HER IYTEMSDCÖMANFKDANCVDNKAJNKLVJNDA');
                              final quizStateModel = quizStateModels[index];

                              return BlocBuilder<QuizBloc, QuizState>(
                                builder: (context, state) {
                                  return Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      //* Question

                                      QuestionItemWidget(
                                        currentQuestion: currentQuestionIndex,
                                        quizStateModel: quizStateModel,
                                        pageController: pageController,
                                      )
                                          .animate(
                                            target:
                                                (state as QuizLoadedState).userStartedQuiz ? 0 : 1,
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
                                                  style: s14W600.copyWith(
                                                    color: context.myColors.scaffoldBackgroundColor,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  context
                                                      .read<QuizBloc>()
                                                      .add(const StartQuizEvent());
                                                }),
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
                                  style: s16W700.copyWith(
                                      color: context.myColors.scaffoldBackgroundColor),
                                ),
                                onPressed: () {},
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
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}