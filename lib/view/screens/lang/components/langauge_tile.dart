import 'package:breathin/imports.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.item,
    required this.onTap,
    required this.isSelected,
  });

  final LanguageModel item;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: paddingSmall,
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: context.theme.dividerColor,
                )
              : null,
          borderRadius: borderRadiusSmall,
        ),
        child: Row(
          children: [
            Image.asset(
              item.imageUrl,
              width: 30.sp,
              height: 30.sp,
            ),
            20.horizontalSpace,
            Text(
              item.languageName,
              style: bodyMedium(context).copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            const Spacer(),
            if (isSelected) const Icon(Icons.check_circle_sharp)
          ],
        ),
      ),
    );
  }
}
