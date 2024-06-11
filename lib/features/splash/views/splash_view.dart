import 'package:flutter/material.dart';
import 'package:quizator/config/router/routes/main_shell.dart';

class SplashView extends StatelessWidget {
  const SplashView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => const HomeRoute().go(context),
    );

    return const Scaffold(
      body: Center(
        child: Text('Splash'),
      ),
    );
  }
}
