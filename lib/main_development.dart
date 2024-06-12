import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quizator/injection_container.dart';
import 'package:quizator/services/http_service/my_chopper_service.dart';
import 'package:quizator/services/log/my_logger.dart';
import 'app.dart';
import 'config/flavor/flavor_model.dart';
import 'config/flavor/flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyChopperService.instance.init();
  initContainer();

  if (!kDebugMode) usePathUrlStrategy();

  final packageInfo = await PackageInfo.fromPlatform();

  // final firebase = await Firebase.initializeApp();

  getIt<MyTalkerLogger>().log(
    '\nApp Name: ${packageInfo.appName}\n, Version: ${packageInfo.version}\n, Bundle ID: ${packageInfo.packageName}\n',
  );

  // Bloc.observer = TalkerBlocObserver(
  //   talker: getIt<Talker>(),
  //   settings: const TalkerBlocLoggerSettings(
  //     // printChanges: false,
  //     printClosings: true,
  //     printCreations: true,
  //     // printEvents: true,
  //     // printTransitions: true,
  //     printStateFullData: false,
  //   ),
  // );

  const flavorModel = FlavorModel(
    flavor: Flavors.DEVELOPMENT,
    name: 'Rehab ACL',
  );

  runApp(
    const MyApp(flavorModel: flavorModel),
  );
}
