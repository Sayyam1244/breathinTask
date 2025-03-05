import 'package:breathin/imports.dart';

AppBar customAppBar() {
  return AppBar(
    toolbarHeight: 40.sp,
    leadingWidth: 80.sp,
    leading: const CustomBackButton(),
  );
}
