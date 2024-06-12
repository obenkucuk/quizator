part of '../views/quiz_loaded_view.dart';

class _DotIndicator extends StatelessWidget {
  const _DotIndicator({
    required this.quizStateModels,
    required this.currentQuestion,
  });

  final List<QuizStateModel> quizStateModels;
  final int currentQuestion;

  @override
  Widget build(BuildContext context) {
    return SliverSizedBox(
      height: 16,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: quizStateModels.length,
          scrollDirection: Axis.horizontal,
          cacheExtent: 100,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, int index) {
            final status = quizStateModels.map((e) => e.status).toList();

            return Padding(
              padding: EdgeInsets.symmetric(vertical: index == currentQuestion ? 0 : 2),
              child: SizedBox(
                width: index == currentQuestion ? 16 : 12,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: status[index].color,
                    borderRadius: BorderRadius.circular(500),
                    border: index == currentQuestion
                        ? Border.all(
                            width: 1,
                            color: context.myColors.primaryColor,
                          )
                        : null,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
