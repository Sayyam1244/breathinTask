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
      colorScheme: ColorScheme.fromSeed(
        primary: primaryColor,
        seedColor: primaryColor,
        secondary: primaryColor,
        background: backgroundColorLight,
        onBackground: textColorBlack,
      ).copyWith(
          //
          ),
      textTheme: textThemeLight(context),
      appBarTheme: appBarThemeLight(context),
      inputDecorationTheme: inputDecorationThemeLight(context),
      dialogTheme: dialogTheme(context),
    );
