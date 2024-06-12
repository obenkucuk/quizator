part of '../views/quiz_loaded_view.dart';

class _QuestionDurationIndicatorWidget extends StatelessWidget {
  const _QuestionDurationIndicatorWidget({required this.currentQuestionIndex});

  final int currentQuestionIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverCrossAxisGroup(
            slivers: [
              SliverToBoxAdapter(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: context.myColors.primaryColor, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(500)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: LinearProgressIndicator(
                      color: context.myColors.primaryColor,
                      backgroundColor: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(500)),
                      value: (state as QuizLoadedState)
                              .questions[currentQuestionIndex]
                              .duration
                              .inSeconds /
                          10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
