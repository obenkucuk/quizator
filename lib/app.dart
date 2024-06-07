import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config/flavor/flavor_model.dart';
import 'config/router/router.dart';
import 'config/theme/bloc/theme_bloc.dart';
import 'config/theme/my_theme_data.dart';

class MyApp extends StatelessWidget {
  final FlavorModel flavorModel;
  const MyApp({
    super.key,
    required this.flavorModel,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return CustomPaint(
            foregroundPainter:
                flavorModel.flavor.debugShowCheckedModeBanner ? bannerPainter(flavorModel) : null,
            child: Theme(
              data: lightTheme,
              child: CupertinoApp.router(
                routerConfig: router,
                title: flavorModel.name,
                scrollBehavior: CustomScrollBehaviour(),
                localizationsDelegates: const [
                  DefaultMaterialLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  DefaultWidgetsLocalizations.delegate,
                ],
              ),
            ),
          );
        },
      ),
    );

    //  MaterialApp.router(
    //           routerConfig: router,
    //           title: 'Rehab ACL',
    //           theme: lightTheme,
    //           themeMode: state.themeMode,
    //           darkTheme: ThemeData.dark().copyWith(extensions: [MyColors.dark]),
    //           themeAnimationCurve: Curves.easeInOutCubicEmphasized,
    //           themeAnimationDuration: const Duration(milliseconds: 500),
    //           builder: (context, child) {
    //             return ScrollConfiguration(
    //               behavior: CustomScrollBehaviour(),
    //               child: child ?? const SizedBox.shrink(),
    //             );
    //           },
    //         ),
  }

  CustomPainter bannerPainter(FlavorModel flavorModel) => BannerPainter(
        message: flavorModel.flavor.bannerName,
        textDirection: TextDirection.ltr,
        location: BannerLocation.topEnd,
        layoutDirection: TextDirection.ltr,
        color: flavorModel.flavor.bannerColor,
      );
}

@immutable
final class CustomScrollBehaviour extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    if (kIsWeb) return super.getScrollPhysics(context);

    if (Platform.isAndroid) {
      return const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      );
    } else if (Platform.isIOS) {
      return super.getScrollPhysics(context);
    } else {
      return super.getScrollPhysics(context);
    }
  }
}
