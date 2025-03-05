import 'package:breathin/imports.dart';

class LocalizationController extends GetxController implements GetxService {
  final LocalizationRepo localizationRepo;
  LocalizationController({required this.localizationRepo}) {
    loadCurrentLanguage();
  }

  Locale _locale = Locale(
    AppConstants.languages[0].languageCode,
    AppConstants.languages[0].countryCode,
  );
  final bool _isLtr = true;
  List<LanguageModel> _languages = [];
  int _selectedIndex = 0;

  Locale get locale => _locale;
  bool get isLtr => _isLtr;
  List<LanguageModel> get languages => _languages;
  int get selectedIndex => _selectedIndex;

  Future<void> setLanguage(Locale locale) async {
    await Get.updateLocale(locale);
    _locale = locale;
    saveLanguage(_locale);
    update();
  }

  void loadCurrentLanguage() async {
    Locale locale = localizationRepo.loadCurrentLanguage();
    await setLanguage(locale);

    _languages = List.from(AppConstants.languages);

    _selectedIndex = AppConstants.languages.indexWhere(
      (language) => language.countryCode == locale.countryCode,
    );

    update();
  }

  void saveLanguage(Locale locale) async {
    await localizationRepo.saveLanguage(locale);
  }

  void setSelectIndex(int index) {
    _selectedIndex = index;
    update();
  }

  void searchLanguage(String query) {
    if (query.isEmpty) {
      _languages = List.from(AppConstants.languages);
    } else {
      _selectedIndex = -1;
      _languages = AppConstants.languages
          .where((language) =>
              language.languageName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    update();
  }

  static LocalizationController get find => Get.find();
}
