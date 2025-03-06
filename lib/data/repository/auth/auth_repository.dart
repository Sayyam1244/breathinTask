import 'dart:developer';

import 'package:breathin/data/repository/user/user_repository.dart';
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

  // static Future continueWithGoogle() async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return 'Sign-in aborted by user';
  //     }

  //     GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     // check if firebase user is already registered
  //     log(userCredential.user!.uid);
  //     final val = await UserServices.getUser(docId: userCredential.user!.uid);
  //     if (val is String) {
  //       return 'User not registered';
  //     }
  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }

  // static Future createUserFromGoogle() async {
  //   try {
  //     GoogleSignIn googleSignIn = GoogleSignIn();
  //     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       return 'Sign-in aborted by user';
  //     }

  //     GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     OAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //     UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);

  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
}
