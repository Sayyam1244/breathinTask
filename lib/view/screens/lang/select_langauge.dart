import 'package:breathin/controllers/user_controller.dart';
import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/dashboard/dashboard_screen.dart';
import 'package:breathin/view/screens/lang/components/langauge_tile.dart';

class SelectedLanguage extends StatefulWidget {
  const SelectedLanguage({super.key});

  @override
  State<SelectedLanguage> createState() => _SelectedLanguageState();
}

class _SelectedLanguageState extends State<SelectedLanguage> {
  final search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Padding(
        padding: paddingDefault,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'choose_language'.tr,
              style: headlineMedium(context).copyWith(
                color: context.theme.colorScheme.onBackground,
              ),
            ),
            4.verticalSpace,
            Text(
              'select_language'.tr,
              style: bodySmall(context)
                  .copyWith(color: context.theme.hintColor, fontSize: 13.sp),
            ),
            30.verticalSpace,
            CustomTextField(
              textcolor: context.theme.colorScheme.onBackground,
              onChanged: (v) {
                setState(() {});
              },
              controller: search,
              prefixIcon: Icons.search,
              hintText: 'search'.tr,
              hintSize: 16.sp,
              enabledBorder:
                  context.theme.inputDecorationTheme.enabledBorder!.copyWith(
                borderSide: BorderSide(
                  color: context.theme.dividerColor,
                ),
              ),
              focusBorder:
                  context.theme.inputDecorationTheme.enabledBorder!.copyWith(
                borderSide: BorderSide(
                  color: context.theme.colorScheme.onBackground,
                  width: 1,
                ),
              ),
            ),
            30.verticalSpace,
            Expanded(
              child: GetBuilder<LocalizationController>(
                builder: (localController) => ListView.separated(
                  itemCount: AppConstants.languages.length,
                  itemBuilder: (context, index) {
                    final item = AppConstants.languages[index];
                    if (item.languageName
                        .toLowerCase()
                        .contains(search.text.toLowerCase())) {
                      return LanguageTile(
                        item: item,
                        onTap: () {
                          localController.setLanguage(Locale(
                            item.languageCode,
                            item.countryCode,
                          ));
                        },
                        isSelected: item.languageCode ==
                            localController.locale.languageCode,
                      );
                    }
                    return null;
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      10.verticalSpace,
                ),
              ),
            ),
            30.verticalSpace,
            CustomButton(
              text: 'continue'.tr,
              onTap: () {
                UserController.to.updateLang(Get.locale!.languageCode);
              },
            ),
          ],
        ),
      ),
    );
  }
}
