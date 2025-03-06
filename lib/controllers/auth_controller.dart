import 'dart:developer';

import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/dashboard/dashboard_screen.dart';

class AuthController {
  final AuthRepository authRepository;
  static AuthController get to => Get.find();
  AuthController({
    required this.authRepository,
  });

  Future<void> login(String email, String password) async {
    showLoading();
    log(email);
    final res = await authRepository.login(email: email, password: password);
    if (res is UserModel) {
      if (res.lang == null) {
        launchScreen(const SelectedLanguage());
      } else {
        launchScreen(const DashboardScreen());
      }
    } else {
      showToast(res);
    }
    dismiss();
  }

  Future<void> register(String email, String password) async {
    showLoading();
    final res = await authRepository
        .createUser(UserBody(email: email, password: password));
    if (res is UserModel) {
      launchScreen(const SelectedLanguage());
    } else {
      showToast(res);
    }
    dismiss();
  }
}
