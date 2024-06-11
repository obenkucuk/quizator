import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../../injection_container.dart';
import 'routes/main_shell.dart';
import 'routes/splash/splash.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routerNeglect: true,
  initialLocation: const SplashRoute().location,
  observers: [
    getIt<TalkerRouteObserver>(),
  ],
  navigatorKey: rootNavigatorKey,
  debugLogDiagnostics: true,
  overridePlatformDefaultLocation: true,
  routes: [
    $splashRoute,
    $mainShellRouteData,
  ],
  errorBuilder: (context, state) {
    return const Scaffold(
      body: Center(
        child: Text('Error Page'),
      ),
    );
  },
);
