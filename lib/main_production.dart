import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
// ignore: depend_on_referenced_packages
// import 'package:package_info_plus/package_info_plus.dart';
import 'package:quizator/injection_container.dart';
import 'package:quizator/services/http_service/my_chopper_service.dart';
import 'package:quizator/services/log/my_logger.dart';
import 'app.dart';
import 'config/flavor/flavor_model.dart';
import 'config/flavor/flavors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final packageInfo = await PackageInfo.fromPlatform();

  await MyChopperService.instance.init();
  initContainer();
  final packageInfo = await PackageInfo.fromPlatform();

  // final firebase = await Firebase.initializeApp();

  getIt<MyTalkerLogger>().log(
    '\nApp Name: ${packageInfo.appName}\n, Version: ${packageInfo.version}\n, Bundle ID: ${packageInfo.packageName}\n',
  );

  const flavorModel = FlavorModel(
    flavor: Flavors.PRODUCTION,
    name: 'Github CV',
  );

  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 100,
              ),
              Text(
                'Oops... something went wrong',
              ),
            ],
          ),
        ),
      ),
    );
  };

  runApp(
    const MyApp(flavorModel: flavorModel),
  );
}
