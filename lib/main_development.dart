import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_settings.dart';
import 'app.dart';
import 'config/flavor/flavor_model.dart';
import 'config/flavor/flavors.dart';
import 'services/log/my_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initContainer();

  if (!kDebugMode) usePathUrlStrategy();

  final packageInfo = await PackageInfo.fromPlatform();

  // final firebase = await Firebase.initializeApp();

  myLogger.log(
    '\nApp Name: ${packageInfo.appName}\n, Version: ${packageInfo.version}\n, Bundle ID: ${packageInfo.packageName}\n',
  );

  Bloc.observer = TalkerBlocObserver(
    talker: myLogger.talker,
    settings: const TalkerBlocLoggerSettings(
      // printChanges: false,
      printClosings: true,
      printCreations: true,
      // printEvents: true,
      // printTransitions: true,
      printStateFullData: false,
    ),
  );

  const flavorModel = FlavorModel(
    flavor: Flavors.DEVELOPMENT,
    name: 'Rehab ACL',
  );

  runApp(
    const MyApp(flavorModel: flavorModel),
  );
}