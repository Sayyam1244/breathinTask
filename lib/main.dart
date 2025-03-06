import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/auth/auth_screen.dart';
import 'core/helper/get_di.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Map<String, Map<String, String>> languages = await di.init();
  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.shortestSide > 600;
    final bool isLargeTablet = MediaQuery.of(context).size.shortestSide > 800;
    Size designSize;
    if (isLargeTablet) {
      designSize = const Size(1024, 1366);
    } else if (isTablet) {
      designSize = const Size(768, 1024);
    } else {
      designSize = const Size(411.4, 866.3);
    }

    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetBuilder<LocalizationController>(builder: (localizeController) {
        return ScreenUtilInit(
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
          fontSizeResolver: (size, util) =>
              _fontSizeResolver(size, isTablet, isLargeTablet, util),
          builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: TextScaler.noScaling),
            child: GetMaterialApp(
              title: AppConstants.appName,
              debugShowCheckedModeBanner: false,
              locale: localizeController.locale,
              translations: Messages(languages: languages),
              fallbackLocale: Locale(
                AppConstants.languages[0].languageCode,
                AppConstants.languages[0].countryCode,
              ),
              themeMode: ThemeMode.light,
              theme: light(context),
              builder: FlutterSmartDialog.init(
                loadingBuilder: (string) => const Loading(),
                builder: (context, child) {
                  return child ?? const SizedBox();
                },
              ),
              home: const AuthScreen(),
            ),
          ),
        );
      });
    });
  }

  double _fontSizeResolver(size, isTablet, isLargeTablet, ScreenUtil util) {
    double scaleFactor = 1.0;
    if (isTablet || isLargeTablet) {
      scaleFactor = 1.0;
    } else {
      scaleFactor = util.scaleText;
    }
    return size * scaleFactor;
  }
}
