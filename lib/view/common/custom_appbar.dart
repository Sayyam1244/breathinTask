import 'package:breathin/imports.dart';

AppBar customAppBar({
  bool allowBack = true,
  String? title,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    toolbarHeight: 60.sp,
    leadingWidth: allowBack ? 80.sp : 0,
    leading: allowBack ? const CustomBackButton() : const SizedBox.shrink(),
    title: title != null
        ? Text(
            title,
            style: headlineSmall(Get.context!).copyWith(
              color: Get.context!.theme.colorScheme.onBackground,
            ),
          )
        : null,
    actions: actions,
  );
}
