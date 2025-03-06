import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/dashboard/dashboard_screen.dart';

class UserController {
  final UserRepository userRepository;
  static UserController get to => Get.find();
  UserController({
    required this.userRepository,
  });
  UserModel? _user;
  UserModel? get user => _user;
  set user(UserModel? user) {
    _user = user;
  }

  Future<void> updateLang(String lang) async {
    showLoading();
    final res = await userRepository.updateUser(UserBody(lang: lang));
    if (res is UserModel) {
      user = res;
      launchScreen(const DashboardScreen());
    } else {
      showToast(res);
    }
    dismiss();
  }
}
