import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



abstract class AppColors {
  static const secondary = Color(0xFF3B76F6);
  static const accent = Color(0xFFD6755B);
  static const textDark = Color(0xFF53585A);
  static const textLigth = Color(0xFFF5F5F5);
  static const textFaded = Color(0xFF9899A5);
  static const iconLight = Color(0xFFB1B4C0);
  static const iconDark = Color(0xFFB1B3C1);
  static const textHighlight = secondary;
  static const cardLight = Color(0xFFF9FAFE);
  static const cardDark = Color(0xFF303334);
}

abstract class _LightColors {
  static const background = Colors.white;
  static const card = AppColors.cardLight;
}

abstract class _DarkColors {
  static const background = Color(0xFF1B1E1F);
  static const card = AppColors.cardDark;
}

/// Reference to the application theme.
class AppTheme {
  static const accentColor = AppColors.accent;
  static final visualDensity = VisualDensity.adaptivePlatformDensity;

  final darkBase = ThemeData.dark();
  final lightBase = ThemeData.light();

  /// Light theme and its settings.
  static ThemeData light() => ThemeData(
    brightness: Brightness.light,
    // colorScheme: lightBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.mulishTextTheme().apply(bodyColor: AppColors.textDark),
    backgroundColor: _LightColors.background,
    // appBarTheme: lightBase.appBarTheme.copyWith(
    //   iconTheme: lightBase.iconTheme,
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 17,
    //     color: AppColors.textDark,
    //   ),
    //   systemOverlayStyle: SystemUiOverlayStyle.dark,
    // ),
    scaffoldBackgroundColor: _LightColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
    ),
    cardColor: _LightColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textDark),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconDark),
  );

  /// Dark theme and its settings.
  static ThemeData dark() => ThemeData(
    brightness: Brightness.dark,
    // colorScheme: darkBase.colorScheme.copyWith(secondary: accentColor),
    visualDensity: visualDensity,
    textTheme:
    GoogleFonts.interTextTheme().apply(bodyColor: AppColors.textLigth),
    backgroundColor: _DarkColors.background,
    // appBarTheme: darkBase.appBarTheme.copyWith(
    //   backgroundColor: Colors.transparent,
    //   elevation: 0,
    //   centerTitle: true,
    //   titleTextStyle: const TextStyle(
    //     fontWeight: FontWeight.bold,
    //     fontSize: 17,
    //   ),
    //   systemOverlayStyle: SystemUiOverlayStyle.light,
    // ),
    scaffoldBackgroundColor: _DarkColors.background,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
    ),
    cardColor: _DarkColors.card,
    primaryTextTheme: const TextTheme(
      headline6: TextStyle(color: AppColors.textLigth),
    ),
    iconTheme: const IconThemeData(color: AppColors.iconLight),
  );
}

// Text Styles

class MyTextStyles{
//  title(bold,largest), Heading(larger), subheading(large), body(normal),
  static const title1 = TextStyle(fontSize: 24);
  static const title2 = TextStyle(fontSize: 22);

  static const heading1 = TextStyle(fontSize: 20);
  static const heading2 = TextStyle(fontSize: 18);

  static const subheading1 = TextStyle(fontSize: 16);
  static const subheading2 = TextStyle(fontSize: 15);

  static const bodyText = TextStyle(fontSize: 13);

  static const iconText = TextStyle(fontSize: 11);

  static const smallText = TextStyle(fontSize: 10);

}