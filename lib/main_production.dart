import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:package_info_plus/package_info_plus.dart';
import 'app.dart';
import 'config/flavor/flavor_model.dart';
import 'config/flavor/flavors.dart';
import 'services/log/my_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final packageInfo = await PackageInfo.fromPlatform();

  myLogger.log(
    '\nApp Name: ${packageInfo.appName}\n, Version: ${packageInfo.version}\n, Bundle ID: ${packageInfo.packageName}\n,',
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
