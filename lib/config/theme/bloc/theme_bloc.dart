// ignore_for_file: library_private_types_in_public_api

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'theme_event.dart';
part 'theme_state.dart';
part 'theme_bloc.freezed.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState()) {
    on<ChangeTheme>(_changeTheme);
    on<ChangeThemeWith>(_changeThemeWith);
  }

  void _changeTheme(ChangeTheme event, Emitter<ThemeState> emit) {
    // print(state.themeMode);
    emit(
      ThemeState(
        themeMode: state.themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
      ),
    );
  }

  void _changeThemeWith(ChangeThemeWith event, Emitter<ThemeState> emit) {
    //       if (state.themeMode == themeMode) return;

    //   state = state.copyWith(themeMode: themeMode);
    // }

    // void changePrimaryColor(Color primaryColor) {
    //   if (state.myThemeData.myColors.primaryColor == primaryColor) return;

    //   state = state.copyWith(
    //     myThemeData: MyThemeData(
    //       myColors: MyColors(primaryColor: primaryColor),
    //     ),
    //   );
    // }
  }
}
