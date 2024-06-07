import 'package:flutter/material.dart';

import '../../services/log/my_logger.dart';

// import '../log/talker.dart';

@immutable
class MyNavigatorObserver extends NavigatorObserver {
  MyNavigatorObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    myLogger.info('DID-PUSH        ${route.settings.name}');

    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    myLogger.info('DID-POP        ${route.settings.name}');
    super.didPop(route, previousRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    myLogger.info('DID-REMOVE        ${route.settings.name}');
    super.didRemove(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    myLogger.info('DID-REPLACE        ${oldRoute?.settings.name}');
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }
}
