import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  static ThemeController get find => Get.find();

  void setThemeMode(ThemeMode themeMode) {
    _themeMode = themeMode;
    update();
  }
}
