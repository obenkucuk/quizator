part of '../../main_shell.dart';

const _quizShellBranchData = TypedStatefulShellBranch<QuizShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<QuizRoute>(
      path: '/quiz',
      name: 'Quiz',
      routes: [
        TypedGoRoute<SingleQuizRoute>(
          path: 'single-quiz',
          name: 'Single Quiz',
          // routes: const [],
        ),
      ],
    ),
  ],
);

class QuizShellBranchData extends StatefulShellBranchData {
  const QuizShellBranchData();
}

class QuizRoute extends GoRouteData {
  const QuizRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Quiz Ana Sayfa'),
      ),
    );
  }
}

class SingleQuizRoute extends GoRouteData {
  const SingleQuizRoute({required this.yer});

  final String yer;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Scaffold(
      body: Center(
        child: Text('Quiz Sayfası'),
      ),
    );
  }
}
