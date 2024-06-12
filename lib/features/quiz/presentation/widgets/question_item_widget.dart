import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/core/extensions/string.dart';
import 'package:quizator/features/quiz/presentation/bloc/quiz_bloc.dart';

import '../../../../config/theme/text_styles.dart';
import '../../data/models/quiz_model.dart';

@immutable
final class QuestionItemWidget extends HookWidget {
  const QuestionItemWidget({
    super.key,
    required this.quizStateModel,
    required this.currentQuestionIndex,
  });

  final QuizStateModel quizStateModel;
  final int currentQuestionIndex;

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
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ],
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
                              child:
                                  Text((quizStateModel.questionModel.question ?? '').decodeHTML()),
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
                                child: CupertinoButton(
                                  color: answer == quizStateModel.selectedAnswer
                                      ? Colors.orange
                                      : context.myColors.primaryColor,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  disabledColor: answer == quizStateModel.selectedAnswer
                                      ? Colors.orange.withOpacity(0.5)
                                      : CupertinoColors.quaternarySystemFill,
                                  padding: EdgeInsets.zero,
                                  onPressed: (quizStateModel.status == QuestionStatus.expired ||
                                          quizStateModel.duration <= Duration.zero)
                                      ? null
                                      : () {
                                          context.read<QuizBloc>().add(
                                                AnswerQuestionEvent(
                                                  selectedAnswer: answer,
                                                  quizStateModel: quizStateModel,
                                                  index: currentQuestionIndex,
                                                ),
                                              );
                                        },
                                  child: Text(
                                    answer,
                                    style: s14W400.copyWith(
                                        color: context.myColors.scaffoldBackgroundColor),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ).animate(target: quizStateModel.status == QuestionStatus.expired ? 1 : 0).blur(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
