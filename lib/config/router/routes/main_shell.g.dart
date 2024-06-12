// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_shell.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: MainShellRouteData.$restorationScopeId,
      navigatorContainerBuilder: MainShellRouteData.$navigatorContainerBuilder,
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/quiz',
              name: 'Quiz',
              factory: $HomeRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'single-quiz',
                  name: 'Single Quiz',
                  parentNavigatorKey: SingleQuizRoute.$parentNavigatorKey,
                  factory: $SingleQuizRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'quiz-score',
                  name: 'Quiz Score',
                  parentNavigatorKey: QuizScoreRoute.$parentNavigatorKey,
                  factory: $QuizScoreRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'categories',
                  name: 'Quiz Categories',
                  factory: $QuizCategoriesRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/education',
              name: 'Education',
              factory: $SettingsRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  String get location => GoRouteData.$location(
        '/quiz',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SingleQuizRouteExtension on SingleQuizRoute {
  static SingleQuizRoute _fromState(GoRouterState state) => SingleQuizRoute(
        category: int.parse(state.uri.queryParameters['category']!),
      );

  String get location => GoRouteData.$location(
        '/quiz/single-quiz',
        queryParams: {
          'category': category.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QuizScoreRouteExtension on QuizScoreRoute {
  static QuizScoreRoute _fromState(GoRouterState state) => QuizScoreRoute(
        correctQuestionCount:
            int.parse(state.uri.queryParameters['correct-question-count']!),
        totalQuestionCount:
            int.parse(state.uri.queryParameters['total-question-count']!),
      );

  String get location => GoRouteData.$location(
        '/quiz/quiz-score',
        queryParams: {
          'correct-question-count': correctQuestionCount.toString(),
          'total-question-count': totalQuestionCount.toString(),
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $QuizCategoriesRouteExtension on QuizCategoriesRoute {
  static QuizCategoriesRoute _fromState(GoRouterState state) =>
      const QuizCategoriesRoute();

  String get location => GoRouteData.$location(
        '/quiz/categories',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsRouteExtension on SettingsRoute {
  static SettingsRoute _fromState(GoRouterState state) => const SettingsRoute();

  String get location => GoRouteData.$location(
        '/education',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
