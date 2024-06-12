import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/config/theme/my_colors.dart';
import 'package:quizator/config/theme/text_styles.dart';

class QuizScoreView extends StatelessWidget {
  const QuizScoreView({
    super.key,
    required this.correctQuestionCount,
    required this.totalQuestionCount,
  });

  final int correctQuestionCount;
  final int totalQuestionCount;

  @override
  Widget build(BuildContext context) {
    final ratio = (correctQuestionCount / totalQuestionCount);
    final emoji = ratio > 0.8
        ? '🥰'
        : ratio > 0.4
            ? '😎'
            : '😢';

    return CupertinoPageScaffold(
      child: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: 'You got ',
                  style: s16W700(context).copyWith(
                    color: context.myColors.primaryColor,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '$correctQuestionCount',
                      style: s20W700(context).copyWith(color: Colors.green),
                    ),
                    TextSpan(
                      text: '\n out of $totalQuestionCount questions correct',
                      style: s16W700(context).copyWith(
                        color: context.myColors.primaryColor,
                      ),
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(emoji, style: s24W400(context).copyWith(fontSize: 48)),
              const Spacer(),
              CupertinoButton(
                color: context.myColors.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
                child: Text(
                  'Go Home',
                  style: s16W700(context).copyWith(color: context.myColors.scaffoldBackgroundColor),
                ),
                onPressed: () => const HomeRoute().go(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
