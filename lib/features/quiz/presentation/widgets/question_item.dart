import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/core/extensions/string.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';

import '../../../../config/theme/text_styles.dart';
import '../../data/models/quiz_model.dart';

@immutable
final class QuestionItem extends HookWidget {
  const QuestionItem({
    super.key,
    required this.pageController,
    required this.quizStateModel,
  });

  final PageController pageController;
  final QuizStateModel quizStateModel;

  @override
  Widget build(BuildContext context) {
    final difficulty = quizStateModel.questionModel.difficulty ?? Difficulty.unknown;

    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Difficulty',
                        style: s16W700.copyWith(
                          color: context.myColors.primaryColor,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: ' : ', style: s16W700),
                          TextSpan(
                            text: difficulty.name.toTitleCase(),
                            style: s16W700.copyWith(color: difficulty.color),
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Divider(thickness: 1),
                    ),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text((quizStateModel.questionModel.question ?? '').decodeHTML()),
                        ),
                      ],
                    ),
                    const Spacer(),
                    ...List.generate(
                      quizStateModel.answerList.length,
                      (index) {
                        final answer = quizStateModel.answerList[index].decodeHTML();

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: SizedBox(
                            height: 36,
                            child: CupertinoButton.filled(
                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                              padding: EdgeInsets.zero,
                              child: Text(
                                answer,
                                style: s14W400.copyWith(
                                    color: context.myColors.scaffoldBackgroundColor),
                              ),
                              onPressed: () {
                                context.read<QuizBloc>().add(
                                      AnswerQuestionEvent(
                                        selectedAnswer: answer,
                                        quizStateModel: quizStateModel,
                                        index: pageController.page?.round() ?? 0,
                                      ),
                                    );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
