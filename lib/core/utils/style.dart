import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Padding
EdgeInsets paddingSmall = EdgeInsets.all(10.sp);
EdgeInsets paddingMedium = EdgeInsets.all(14.sp);
EdgeInsets paddingDefault = EdgeInsets.all(20.sp);
EdgeInsets paddingHorizontal = EdgeInsets.symmetric(horizontal: 20.sp);
EdgeInsets paddingVertical = EdgeInsets.symmetric(vertical: 20.sp);

// Spacing
double spacingExtraSmall = 4.sp;
double spacingSmall = 8.sp;
double spacingMedium = 12.sp;
double spacingDefault = 16.sp;
double spacingLarge = 24.sp;
double spacingExtraLarge = 32.sp;

double get radiusSmall => 8.sp;
double get radiusDefault => 12.sp;
double get radiusCircular => 32.sp;

BorderRadius get borderRadiusSmall => BorderRadius.circular(radiusSmall);
BorderRadius get borderRadiusDefault => BorderRadius.circular(radiusDefault);
BorderRadius get borderRadiusCircular => BorderRadius.circular(radiusCircular);

// Text Styles (using Theme.of(context).textTheme)
TextStyle displayLarge(BuildContext context) =>
    Theme.of(context).textTheme.displayLarge!;
TextStyle displayMedium(BuildContext context) =>
    Theme.of(context).textTheme.displayMedium!;
TextStyle displaySmall(BuildContext context) =>
    Theme.of(context).textTheme.displaySmall!;
TextStyle headlineLarge(BuildContext context) =>
    Theme.of(context).textTheme.headlineLarge!;
TextStyle headlineMedium(BuildContext context) =>
    Theme.of(context).textTheme.headlineMedium!;
TextStyle headlineSmall(BuildContext context) =>
    Theme.of(context).textTheme.headlineSmall!;
TextStyle titleLarge(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!;
TextStyle titleMedium(BuildContext context) =>
    Theme.of(context).textTheme.titleMedium!;
TextStyle titleSmall(BuildContext context) =>
    Theme.of(context).textTheme.titleSmall!;
TextStyle bodyLarge(BuildContext context) =>
    Theme.of(context).textTheme.bodyLarge!;
TextStyle bodyMedium(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!;
TextStyle bodySmall(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!;
TextStyle labelLarge(BuildContext context) =>
    Theme.of(context).textTheme.labelLarge!;
TextStyle labelMedium(BuildContext context) =>
    Theme.of(context).textTheme.labelMedium!;
TextStyle labelSmall(BuildContext context) =>
    Theme.of(context).textTheme.labelSmall!;
