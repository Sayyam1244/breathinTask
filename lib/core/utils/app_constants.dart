import 'package:breathin/data/model/language.dart';

import 'images.dart';

class AppConstants {
  //app
  static const String appName = 'Breathin';

  // Shared Key
  static const String theme = 'theme';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';
  static const String topic = 'notify';
  static const String token = 'token';
  static const String localizationKey = 'X-localization';
  static const String storageKey = 'notes_data';
  static const String onboardingSkip = 'onboarding_skip';
  static const String emailPass = 'email_pass';

  // Language
  static List<LanguageModel> languages = [
    LanguageModel(
      imageUrl: Images.englishFlag,
      languageName: 'English',
      countryCode: 'US',
      languageCode: 'en',
    ),
    LanguageModel(
      imageUrl: Images.frenchFlag,
      languageName: 'French',
      countryCode: 'FR',
      languageCode: 'fr',
    ),
    LanguageModel(
      imageUrl: Images.spanishFlag,
      languageName: 'Spanish',
      countryCode: 'ES',
      languageCode: 'es',
    ),
  ];
}
