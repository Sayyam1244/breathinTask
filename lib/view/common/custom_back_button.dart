import 'package:breathin/imports.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: context.theme.dividerColor),
        borderRadius: borderRadiusSmall,
      ),
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: Padding(
          padding: EdgeInsets.only(left: 8.sp),
          child: Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
