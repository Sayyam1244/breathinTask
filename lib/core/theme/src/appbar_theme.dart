import 'package:breathin/imports.dart';

AppBarTheme appBarThemeLight(BuildContext context) => AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 16.sp,
      color: backgroundColorLight,
      surfaceTintColor: backgroundColorLight,
      shadowColor: backgroundColorLight,
      titleTextStyle: TextStyle(
        color: textColorBlack,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),
      centerTitle: false,
    );
