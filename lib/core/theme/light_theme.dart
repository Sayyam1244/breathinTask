import 'package:breathin/imports.dart';

import 'src/appbar_theme.dart';
import 'src/input_decoration_theme.dart';
import 'src/text_theme.dart';
import 'src/dialog_theme.dart';

ThemeData light(BuildContext context) => ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      brightness: Brightness.light,
      dividerColor: borderColorLight,
      sliderTheme: SliderThemeData(
        trackHeight: 1.0,
        activeTrackColor: primaryColor,
        thumbColor: primaryColor,
        overlayColor: primaryColor.withOpacity(0.3),
        valueIndicatorColor: primaryColor,
        valueIndicatorTextStyle: bodySmall(context).copyWith(
          color: textColorBlack,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        primary: primaryColor,
        seedColor: primaryColor,
        secondary: primaryColor,
        background: backgroundColorLight,
        onBackground: textColorBlack,
        error: redColor,
      ).copyWith(
          //
          ),
      textTheme: textThemeLight(context),
      appBarTheme: appBarThemeLight(context),
      inputDecorationTheme: inputDecorationThemeLight(context),
      dialogTheme: dialogTheme(context),
    );
