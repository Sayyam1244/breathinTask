import 'package:breathin/imports.dart';

class AuthRepository {
  final UserRepository userRepository;

  AuthRepository({required this.userRepository});
  Future login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userRepository.getUser(
          docId: FirebaseAuth.instance.currentUser!.uid);
    } catch (e) {
      return AuthExceptionHandler.handleAuthException(e);
    }
  }

  Future createUser(UserBody userBody) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userBody.email!, password: userBody.password!);
      userBody.uid = FirebaseAuth.instance.currentUser!.uid;

      return await userRepository.createUser(userBody);
    } catch (e) {
      return AuthExceptionHandler.handleAuthException(e);
    }
  }
}
