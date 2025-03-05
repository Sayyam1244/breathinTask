import 'package:breathin/imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, Map<String, String>>> init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);

  // Repos
  Get.lazyPut<UserRepository>(() => UserRepository(), fenix: true);
  Get.lazyPut<LocalizationRepo>(() => LocalizationRepo(prefs: Get.find()),
      fenix: true);
  Get.lazyPut<AuthRepository>(() => AuthRepository(userRepository: Get.find()),
      fenix: true);
  // Controllers
  Get.lazyPut<ThemeController>(() => ThemeController(), fenix: true);
  Get.lazyPut<LocalizationController>(
      () => LocalizationController(localizationRepo: Get.find()),
      fenix: true);

  // Retrieving localized data
  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }

  return languages;
}
