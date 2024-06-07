// ignore_for_file: avoid_redundant_argument_values

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_colors.dart';

final _scaffoldBackgroundColor = MyColors.light.scaffoldBackgroundColor;
final _textColor = MyColors.dark.scaffoldBackgroundColor;
final _cupertinoTextStyle = GoogleFonts.notoSans();
final _textStyle = GoogleFonts.notoSans();

//* MY THEME DATA classında getter ile veya fonksiyon ile yapınca amı götü dağıtıp fazla rebuilde sebep oluyor.
ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme(
    primary: MyColors.light.primaryColor,
    onPrimary: Colors.white,
    secondary: MyColors.light.seconderyColor,
    onSecondary: Colors.purple,
    error: Colors.red,
    onError: Colors.redAccent,
    surface: Colors.indigo,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  ),

  canvasColor: MyColors.light.canvasColor,
  primaryColor: MyColors.light.primaryColor,
  scaffoldBackgroundColor: _scaffoldBackgroundColor,
  //* splash: efektini kapatmak için ve highlight: tıklandığında oluşan yuvarlak efekti kapatmak için
  splashColor: Colors.transparent,
  highlightColor: Colors.transparent,

  primaryIconTheme: const IconThemeData(color: Colors.black),
  iconTheme: const IconThemeData(color: Colors.black, size: 24),

  typography: Typography.material2021(platform: defaultTargetPlatform),
  extensions: const <ThemeExtension<dynamic>>[MyColors.light],

  dividerTheme: DividerThemeData(
    color: MyColors.light.primaryColor,
    thickness: 0.5,
    space: 0,
    indent: 0,
    endIndent: 0,
  ),

  // appBarTheme: const AppBarTheme(
  //   elevation: 0,
  //   surfaceTintColor: Colors.transparent,
  //   titleTextStyle: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.black,
  //   ),
  //   iconTheme: IconThemeData(color: Colors.white, size: 24),
  // ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: MyColors.light.primaryColor,
    elevation: 0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: MyColors.light.canvasColor,
    unselectedItemColor: MyColors.light.canvasColor,
  ),

  appBarTheme: AppBarTheme(color: MyColors.light.canvasColor),

  drawerTheme: DrawerThemeData(
    elevation: 0,
    backgroundColor: _scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: MyColors.light.fillColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.pink,
        width: 2,
      ),
    ),
    //* Tıklanıp yazı yazılmaya başlandığı zaman
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: MyColors.light.primaryColor,
        width: 2,
      ),
    ),
    //* Hiç tıklanmadığında olan görünüm
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    ),
    labelStyle: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: _textColor),
    hintStyle: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: _textColor),
    errorStyle: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red),
  ),

  buttonTheme: const ButtonThemeData(
    padding: EdgeInsets.zero,
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minWidth: 0,
    height: 0,
  ),

  cupertinoOverrideTheme: CupertinoThemeData(
    primaryContrastingColor: Colors.black,
    scaffoldBackgroundColor: _scaffoldBackgroundColor,
    barBackgroundColor: CupertinoColors.systemGrey6,
    applyThemeToAll: true,
    textTheme: CupertinoTextThemeData(
      primaryColor: MyColors.light.primaryColor,
      textStyle: _cupertinoTextStyle,
      actionTextStyle: _cupertinoTextStyle,
      pickerTextStyle: _cupertinoTextStyle,
      navTitleTextStyle: _cupertinoTextStyle,
      navActionTextStyle: _cupertinoTextStyle,
      navLargeTitleTextStyle: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w900,
        color: _textColor,
      ),
    ),
  ),

  /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
  textTheme: TextTheme(
    /// Label TextTheme
    labelSmall: _textStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: _textColor),
    labelMedium: _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: _textColor),
    labelLarge: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: _textColor),

    /// Body TextTheme
    bodySmall: _textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: _textColor),
    bodyMedium: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: _textColor),
    bodyLarge: _textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: _textColor),

    /// Title TextTheme
    titleSmall: _textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: _textColor),
    titleMedium: _textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: _textColor),
    titleLarge: _textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: _textColor),

    /// Headline TextTheme
    headlineSmall:
        _textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: _textColor),
    headlineMedium:
        _textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w400, color: _textColor),
    headlineLarge:
        _textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: _textColor),

    /// Display TextTheme
    displaySmall: _textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, color: _textColor),
    displayMedium:
        _textStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, color: _textColor),
    displayLarge: _textStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, color: _textColor),
  ),
);


// @immutable
// final class MyThemeData extends Equatable {
//   MyThemeData({
//     this.myColors = const MyColors(primaryColor: Color(0xff7C4DFF)),
//   }) {
//     print('MyThemeData constructor şakkır şukur');
//   }

//   final MyColors myColors;

//   @override
//   List<Object?> get props => [myColors];

//   ThemeData get light {
//     print('getter içi');
//     // final canvasColor = MyColors.light.canvasColor;
//     final scaffoldBackgroundColor = MyColors.light.scaffoldBackgroundColor;
//     final textColor = MyColors.dark.scaffoldBackgroundColor;
//     final cupertinoTextStyle = GoogleFonts.notoSans();
//     final textStyle = GoogleFonts.notoSans();

//     return ThemeData(
//       colorScheme: ColorScheme(
//         primary: myColors.primaryColor,
//         onPrimary: Colors.white,
//         secondary: Colors.black,
//         onSecondary: Colors.purple,
//         error: Colors.red,
//         onError: Colors.redAccent,
//         background: Colors.green,
//         onBackground: Colors.purpleAccent,
//         surface: Colors.indigo,
//         onSurface: Colors.black,
//         brightness: Brightness.dark,
//       ),

//       canvasColor: MyColors.light.canvasColor,
//       primaryColor: myColors.primaryColor,
//       scaffoldBackgroundColor: scaffoldBackgroundColor,
//       //* splash: efektini kapatmak için ve highlight: tıklandığında oluşan yuvarlak efekti kapatmak için
//       splashColor: Colors.transparent,
//       highlightColor: Colors.transparent,

//       primaryIconTheme: const IconThemeData(color: Colors.black),
//       iconTheme: const IconThemeData(color: Colors.black, size: 24),

//       typography: Typography.material2021(platform: defaultTargetPlatform),
//       extensions: <ThemeExtension<dynamic>>[
//         MyColors.light,
//         WoltModalSheetThemeData(
//           modalElevation: 0,
//           bottomSheetShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
//           ),
//         ),
//       ],

//       dividerTheme: DividerThemeData(
//         color: myColors.primaryColor,
//         thickness: 0.5,
//         space: 0,
//         indent: 0,
//         endIndent: 0,
//       ),

//       // appBarTheme: const AppBarTheme(
//       //   elevation: 0,
//       //   surfaceTintColor: Colors.transparent,
//       //   titleTextStyle: TextStyle(
//       //     fontSize: 20,
//       //     fontWeight: FontWeight.w600,
//       //     color: Colors.black,
//       //   ),
//       //   iconTheme: IconThemeData(color: Colors.white, size: 24),
//       // ),

//       bottomNavigationBarTheme: BottomNavigationBarThemeData(
//         backgroundColor: myColors.primaryColor,
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: myColors.canvasColor,
//         unselectedItemColor: myColors.canvasColor,
//       ),

//       appBarTheme: AppBarTheme(color: MyColors.light.canvasColor),

//       drawerTheme: DrawerThemeData(
//         elevation: 0,
//         backgroundColor: scaffoldBackgroundColor,
//         shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//       ),

//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: MyColors.light.fillColor,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(
//             color: Colors.pink,
//             width: 2,
//           ),
//         ),
//         //* Tıklanıp yazı yazılmaya başlandığı zaman
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(
//             color: myColors.primaryColor,
//             width: 2,
//           ),
//         ),
//         //* Hiç tıklanmadığında olan görünüm
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: Colors.grey,
//             width: 1,
//           ),
//         ),
//         focusedErrorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: Colors.red,
//             width: 2,
//           ),
//         ),
//         disabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: const BorderSide(
//             color: Colors.grey,
//             width: 1,
//           ),
//         ),
//         labelStyle: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
//         hintStyle: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
//         errorStyle:
//             textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.red),
//       ),

//       cupertinoOverrideTheme: CupertinoThemeData(
//         primaryContrastingColor: Colors.black,
//         scaffoldBackgroundColor: scaffoldBackgroundColor,
//         barBackgroundColor: CupertinoColors.systemGrey6,
//         applyThemeToAll: true,
//         textTheme: CupertinoTextThemeData(
//           primaryColor: myColors.primaryColor,
//           textStyle: cupertinoTextStyle,
//           actionTextStyle: cupertinoTextStyle,
//           pickerTextStyle: cupertinoTextStyle,
//           navTitleTextStyle: cupertinoTextStyle,
//           navActionTextStyle: cupertinoTextStyle,
//           navLargeTitleTextStyle: TextStyle(
//             fontSize: 36,
//             fontWeight: FontWeight.w900,
//             color: textColor,
//           ),
//         ),
//       ),

//       /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
//       textTheme: TextTheme(
//         /// Label TextTheme
//         labelSmall: textStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
//         labelMedium:
//             textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
//         labelLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),

//         /// Body TextTheme
//         bodySmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
//         bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
//         bodyLarge: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textColor),

//         /// Title TextTheme
//         titleSmall: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
//         titleMedium:
//             textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
//         titleLarge: textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),

//         /// Headline TextTheme
//         headlineSmall:
//             textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: textColor),
//         headlineMedium:
//             textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w400, color: textColor),
//         headlineLarge:
//             textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: textColor),

//         /// Display TextTheme
//         displaySmall:
//             textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, color: textColor),
//         displayMedium:
//             textStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, color: textColor),
//         displayLarge:
//             textStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, color: textColor),
//       ),
//     );
//   }

//   // ThemeData get dark {
//   //   // final canvasColor = MyColors.dark.canvasColor;
//   //   final scaffoldBackgroundColor = MyColors.dark.scaffoldBackgroundColor;

//   //   final textColor = MyColors.light.scaffoldBackgroundColor;
//   //   final cupertinoTextStyle = GoogleFonts.inconsolata();
//   //   final textStyle = GoogleFonts.inconsolata();

//   //   return ThemeData(
//   //     colorScheme: ColorScheme(
//   //       primary: myColors.primaryColor,
//   //       onPrimary: Colors.white,
//   //       secondary: Colors.amber,
//   //       onSecondary: Colors.purple,
//   //       error: Colors.red,
//   //       onError: Colors.redAccent,
//   //       background: Colors.green,
//   //       onBackground: Colors.purpleAccent,
//   //       surface: Colors.indigo,
//   //       onSurface: Colors.yellow,
//   //       brightness: Brightness.dark,
//   //     ),

//   //     primaryColor: myColors.primaryColor,
//   //     scaffoldBackgroundColor: scaffoldBackgroundColor,

//   //     typography: Typography.material2021(platform: defaultTargetPlatform),
//   //     extensions: const <ThemeExtension<dynamic>>[MyColors.dark],

//   //     drawerTheme: DrawerThemeData(
//   //       elevation: 0,
//   //       backgroundColor: scaffoldBackgroundColor,
//   //       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
//   //     ),

//   //     dividerTheme: DividerThemeData(
//   //       color: myColors.primaryColor,
//   //       thickness: 0.5,
//   //       space: 0,
//   //       indent: 0,
//   //       endIndent: 0,
//   //     ),

//   //     cupertinoOverrideTheme: CupertinoThemeData(
//   //       brightness: Brightness.dark,
//   //       barBackgroundColor: scaffoldBackgroundColor,
//   //       applyThemeToAll: true,
//   //       scaffoldBackgroundColor: scaffoldBackgroundColor,
//   //       textTheme: CupertinoTextThemeData(
//   //         primaryColor: myColors.primaryColor,
//   //         textStyle: cupertinoTextStyle,
//   //         actionTextStyle: cupertinoTextStyle,
//   //         pickerTextStyle: cupertinoTextStyle,
//   //         navTitleTextStyle: cupertinoTextStyle,
//   //         navActionTextStyle: cupertinoTextStyle,
//   //         navLargeTitleTextStyle: TextStyle(
//   //           fontSize: 36,
//   //           fontWeight: FontWeight.w900,
//   //           color: MyColors.light.scaffoldBackgroundColor,
//   //         ),
//   //       ),
//   //     ),

//   //     /// where "light" is FontWeight.w300, "regular" is FontWeight.w400 and "medium" is FontWeight.w500.
//   //     textTheme: TextTheme(
//   //       /// Label TextTheme
//   //       labelSmall: textStyle.copyWith(fontSize: 11, fontWeight: FontWeight.w500, color: textColor),
//   //       labelMedium:
//   //           textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w500, color: textColor),
//   //       labelLarge: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),

//   //       /// Body TextTheme
//   //       bodySmall: textStyle.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
//   //       bodyMedium: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: textColor),
//   //       bodyLarge: textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: textColor),

//   //       /// Title TextTheme
//   //       titleSmall: textStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w500, color: textColor),
//   //       titleMedium:
//   //           textStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: textColor),
//   //       titleLarge: textStyle.copyWith(fontSize: 22, fontWeight: FontWeight.w500, color: textColor),

//   //       /// Headline TextTheme
//   //       headlineSmall:
//   //           textStyle.copyWith(fontSize: 24, fontWeight: FontWeight.w400, color: textColor),
//   //       headlineMedium:
//   //           textStyle.copyWith(fontSize: 28, fontWeight: FontWeight.w400, color: textColor),
//   //       headlineLarge:
//   //           textStyle.copyWith(fontSize: 32, fontWeight: FontWeight.w400, color: textColor),

//   //       /// Display TextTheme
//   //       displaySmall:
//   //           textStyle.copyWith(fontSize: 36, fontWeight: FontWeight.w400, color: textColor),
//   //       displayMedium:
//   //           textStyle.copyWith(fontSize: 45, fontWeight: FontWeight.w400, color: textColor),
//   //       displayLarge:
//   //           textStyle.copyWith(fontSize: 57, fontWeight: FontWeight.w400, color: textColor),
//   //     ),
//   //   );
//   // }
// }

