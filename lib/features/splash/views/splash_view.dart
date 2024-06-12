import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizator/config/router/routes/main_shell.dart';
import 'package:quizator/config/theme/text_styles.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future.delayed(const Duration(seconds: 2)).then((_) {
          const HomeRoute().go(context);
        });
      },
    );

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text('QUIZATOR', style: s20W700(context)),
              const Spacer(),
              const CupertinoActivityIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
