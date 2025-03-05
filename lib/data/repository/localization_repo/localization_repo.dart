import 'package:breathin/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalizationRepo {
  final SharedPreferences prefs;

  LocalizationRepo({
    required this.prefs,
  });

  List<Locale> get availableLanguages {
    return AppConstants.languages
        .map((lang) => Locale(lang.languageCode, lang.countryCode))
        .toList();
  }

  Locale loadCurrentLanguage() {
    return Locale(
      prefs.getString(AppConstants.languageCode) ??
          AppConstants.languages[0].languageCode,
      prefs.getString(AppConstants.countryCode) ??
          AppConstants.languages[0].countryCode,
    );
  }

  Future<void> saveLanguage(Locale locale) async {
    await prefs.setString(AppConstants.languageCode, locale.languageCode);
    await prefs.setString(AppConstants.countryCode, locale.countryCode!);
  }
}
