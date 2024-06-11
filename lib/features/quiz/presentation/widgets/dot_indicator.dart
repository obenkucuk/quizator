import 'package:flutter/material.dart';
import 'package:quizator/config/theme/my_colors.dart';

import '../bloc/quiz_bloc.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.quizStateModels,
    required this.currentQuestion,
  });

  final List<QuizStateModel> quizStateModels;
  final int currentQuestion;

  @override
  Widget build(BuildContext context) {
    const size = 12.0;

    return Center(
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: quizStateModels.length,
        scrollDirection: Axis.horizontal,
        cacheExtent: 100,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 8),
        itemBuilder: (
          BuildContext context,
          int index,
        ) {
          final state =
              List.generate(quizStateModels.length, (index) => quizStateModels[index].status);

          return SizedBox(
            width: size,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: state[index].color,
                borderRadius: BorderRadius.circular(size),
                border: index == currentQuestion
                    ? Border.all(
                        width: 1,
                        color: context.myColors.primaryColor,
                      )
                    : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
