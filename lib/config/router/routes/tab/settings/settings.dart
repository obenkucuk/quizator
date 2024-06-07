part of '../../main_shell.dart';

const _settingsShellBranchData = TypedStatefulShellBranch<SettingsShellBranchData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SettingsRoute>(
      path: '/education',
      name: 'Education',
      // routes: [
      //   TypedGoRoute<AnimeDetailRoute>(
      //     path: ':malId',
      //     name: 'Anime Detail',
      //   ),
      // ],
    ),
  ],
);

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();

  // static final GlobalKey<NavigatorState> $navigatorKey = tabNavigatorKeys.elementAt(1);
}

class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CupertinoPageScaffold(
      key: UniqueKey(),
      child: const Center(
        child: Text('Settings'),
      ),
    );
  }
}

// class AnimeDetailRoute extends GoRouteData {
//   final int? malId;

//   const AnimeDetailRoute({this.malId});

//   static GlobalKey<NavigatorState> $parentNavigatorKey = navigatorKey;

//   @override
//   Widget build(BuildContext context, GoRouterState state) {
//     return const Scaffold(
//       body: Center(
//         child: Text('AnimeDetailRoute'),
//       ),
//     );
//   }
// }
