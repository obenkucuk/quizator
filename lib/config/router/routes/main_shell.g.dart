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
              factory: $QuizRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'single-quiz',
                  name: 'Single Quiz',
                  parentNavigatorKey: SingleQuizRoute.$parentNavigatorKey,
                  factory: $SingleQuizRouteExtension._fromState,
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

extension $QuizRouteExtension on QuizRoute {
  static QuizRoute _fromState(GoRouterState state) => const QuizRoute();

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
        yer: state.uri.queryParameters['yer']!,
      );

  String get location => GoRouteData.$location(
        '/quiz/single-quiz',
        queryParams: {
          'yer': yer,
        },
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
