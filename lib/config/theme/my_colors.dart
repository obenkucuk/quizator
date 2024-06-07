import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class MyColors extends ThemeExtension<MyColors> with EquatableMixin {
  final Color primaryColor;
  final Color seconderyColor;
  final Color? canvasColor;
  final Color? scaffoldBackgroundColor;
  final Color? fillColor;

  final List<Color> gradientColors;

  const MyColors({
    required this.primaryColor,
    required this.seconderyColor,
    this.canvasColor,
    this.scaffoldBackgroundColor,
    this.fillColor,
    required this.gradientColors,
  });

  @override
  ThemeExtension<MyColors> copyWith({
    Color? primaryColor,
    Color? canvasColor,
    Color? scaffoldBackgroundColor,
    Color? fillColor,
    List<Color>? gradientColors,
    Color? seconderyColor,
  }) {
    return MyColors(
      primaryColor: primaryColor ?? this.primaryColor,
      canvasColor: canvasColor ?? this.canvasColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      fillColor: fillColor ?? this.fillColor,
      gradientColors: gradientColors ?? this.gradientColors,
      seconderyColor: seconderyColor ?? this.seconderyColor,
    );
  }

  @override
  ThemeExtension<MyColors> lerp(
    covariant ThemeExtension<MyColors>? other,
    double t,
  ) {
    if (other is! MyColors) {
      return this;
    }
    return MyColors(
      primaryColor: Color.lerp(primaryColor, other.primaryColor, t)!,
      canvasColor: Color.lerp(canvasColor, other.canvasColor, t),
      scaffoldBackgroundColor:
          Color.lerp(scaffoldBackgroundColor, other.scaffoldBackgroundColor, t),
      fillColor: Color.lerp(fillColor, other.fillColor, t),
      gradientColors: gradientColors,
      seconderyColor: Color.lerp(seconderyColor, other.seconderyColor, t)!,
    );
  }

  static const MyColors light = MyColors(
    primaryColor: Color(0xff7C4DFF),
    seconderyColor: Color(0xffFF7B5D),
    canvasColor: Color.fromARGB(255, 255, 255, 255),
    scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
    fillColor: Color(0xFFF4F6FC),
    gradientColors: [
      Color(0xff7C4DFF),
      Color(0xffd664ea),
    ],
  );

  static const MyColors dark = MyColors(
    primaryColor: Color(0xff7C4DFF),
    seconderyColor: Color(0xffFF7B5D),
    canvasColor: Color.fromARGB(0, 0, 0, 0),
    scaffoldBackgroundColor: Color.fromARGB(255, 36, 36, 43),
    fillColor: Color(0xFFF4F6FC),
    gradientColors: [
      Color(0xff7C4DFF),
      Color(0xffd664ea),
    ],
  );

  @override
  List<Object?> get props => [
        primaryColor,
        seconderyColor,
        canvasColor,
        scaffoldBackgroundColor,
        fillColor,
        gradientColors,
      ];
}

extension MyColorsExtension on BuildContext {
  MyColors get myColors => Theme.of(this).extension<MyColors>()!;
}



///NOT: doğayla beğendik
// static const Color simSiyah = Color.fromARGB(255, 52, 51, 51);
//   static const Color kirikSiyah = Color.fromARGB(255, 36, 36, 43);