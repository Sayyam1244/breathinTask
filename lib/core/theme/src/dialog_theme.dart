import 'package:breathin/imports.dart';

DialogTheme dialogTheme(BuildContext context) => DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: borderRadiusDefault),
      backgroundColor: context.theme.scaffoldBackgroundColor,
    );
