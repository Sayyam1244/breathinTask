import 'package:breathin/imports.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingDefault,
      child: TextField(
        style: bodyMedium(context).copyWith(
          color: context.theme.colorScheme.onBackground,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIconConstraints: BoxConstraints(
            minWidth: 23.sp,
            minHeight: 17.sp,
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 6.sp),
            child: SvgPicture.asset(
              Images.searchIcon,
              color: context.theme.hintColor,
            ),
          ),
          hintText: 'search'.tr,
          hintStyle: bodyMedium(context).copyWith(
            color: context.theme.hintColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: context.theme.dividerColor,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(),
        ),
      ),
    );
  }
}
