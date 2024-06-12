import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizator/features/home/presentation/views/quiz_categories_view.dart';
import 'package:quizator/features/home/presentation/views/home_view.dart';
import 'package:quizator/features/quiz/presentation/views/quiz_score_view.dart';
import 'package:quizator/injection_container.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../../features/quiz/presentation/views/quiz_screen.dart';
import '../../../features/tab_view_with_nav_bar/views/tab_view_with_nav_bar.dart';

import '../router.dart';

part 'main_shell.g.dart';
part 'tab/home/home.dart';
part 'tab/settings/settings.dart';

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    _homeShellBranchData,
    _settingsShellBranchData,
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) =>
      navigationShell;

  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;

  // static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey;

  static const String $restorationScopeId = 'restorationScopeId';

  static final List<NavigatorObserver> $observers = <NavigatorObserver>[
    getIt<TalkerRouteObserver>(),
  ];

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return TabViewWithNavBar(
      key: GlobalKey(debugLabel: 'TabViewWithNavBar'),
      navigationShell: navigationShell,
      children: children,
    );
  }
}
