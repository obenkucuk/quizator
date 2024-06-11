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
    return QuizView(category: category);
  }
}
