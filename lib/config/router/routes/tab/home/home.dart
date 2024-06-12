part of '../../main_shell.dart';

const _homeShellBranchData = TypedStatefulShellBranch<HomeShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomeRoute>(
      path: '/quiz',
      name: 'Quiz',
      routes: [
        TypedGoRoute<SingleQuizRoute>(
          path: 'single-quiz',
          name: 'Single Quiz',
          routes: [],
        ),
        TypedGoRoute<QuizScoreRoute>(
          path: 'quiz-score',
          name: 'Quiz Score',
          // routes: const [],
        ),
        TypedGoRoute<QuizCategoriesRoute>(
          path: 'categories',
          name: 'Quiz Categories',
          // routes: const [],
        ),
      ],
    ),
  ],
);

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeView();
  }
}

class QuizCategoriesRoute extends GoRouteData {
  const QuizCategoriesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const QuizCategoriesView();
  }
}

class SingleQuizRoute extends GoRouteData {
  const SingleQuizRoute({required this.category});

  final int category;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return QuizScreen(category: category);
  }
}

class QuizScoreRoute extends GoRouteData {
  const QuizScoreRoute({required this.correctQuestionCount, required this.totalQuestionCount});

  final int correctQuestionCount;
  final int totalQuestionCount;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return QuizScoreView(
      correctQuestionCount: correctQuestionCount,
      totalQuestionCount: totalQuestionCount,
    );
  }
}
