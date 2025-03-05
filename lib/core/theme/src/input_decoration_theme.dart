import 'package:breathin/imports.dart';

InputDecorationTheme inputDecorationThemeLight(BuildContext context) =>
    InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: border(color: backgroundColorLight),
      disabledBorder: border(),
      focusedBorder: border(color: backgroundColorLight),
      errorStyle:
          bodyMedium(context).copyWith(color: context.theme.colorScheme.error),
      errorBorder: border(color: context.theme.colorScheme.error),
      focusedErrorBorder: border(color: context.theme.colorScheme.error),
      hintStyle: bodyMedium(context).copyWith(color: context.theme.hintColor),
      filled: true,
      fillColor: backgroundColorLight.withOpacity(0.2),
      contentPadding: EdgeInsets.all(18.sp),
    );

InputBorder border({Color? color}) => OutlineInputBorder(
      borderSide: BorderSide(color: color ?? primaryColor, width: 1.sp),
      borderRadius: borderRadiusDefault,
    );
