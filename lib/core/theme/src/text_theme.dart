import 'package:breathin/imports.dart';

TextTheme textThemeLight(BuildContext context) {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 34.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Raglika',
    ),
    displayMedium: TextStyle(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Raglika',
    ),
    displaySmall: TextStyle(
      fontSize: 30.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: 'Raglika',
    ),
    headlineLarge: TextStyle(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Raglika',
    ),
    headlineMedium: TextStyle(
      fontSize: 26.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Raglika',
    ),
    headlineSmall: TextStyle(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Raglika',
    ),
    titleLarge: TextStyle(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Raglika',
    ),
    titleMedium: TextStyle(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Raglika',
    ),
    titleSmall: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w400,
      fontFamily: 'Helvetica',
    ),
    bodyLarge: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
    bodyMedium: TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
    bodySmall: TextStyle(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
    labelLarge: TextStyle(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
    labelMedium: TextStyle(
      fontSize: 8.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
    labelSmall: TextStyle(
      fontSize: 6.0.sp,
      fontWeight: FontWeight.normal,
      fontFamily: 'Helvetica',
    ),
  ).apply(
    displayColor: textColorWhite,
    bodyColor: textColorWhite,
  );
}
