import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'navigator_observer.dart';
import 'routes/main_shell.dart';
import 'routes/splash/splash.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  routerNeglect: true,
  initialLocation: const SplashRoute().location,
  observers: [MyNavigatorObserver()],
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
