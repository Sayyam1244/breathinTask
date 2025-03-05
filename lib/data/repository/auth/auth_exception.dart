import 'package:breathin/imports.dart';

class AuthExceptionHandler {
  static final Map<String, String> _errorMessages = {
    'wrong-password':
        'The password you entered is incorrect. Please try again.',
    'invalid-email': 'The email address you entered is not valid.',
    'user-disabled':
        'Your account has been disabled. Please contact support for assistance.',
    'user-not-found': 'There is no account associated with this email address.',
    'email-already-in-use':
        'An account with this email address already exists.',
    'operation-not-allowed':
        'Email/password accounts are not enabled. Please enable them in the Firebase Console under the Auth tab.',
    'weak-password': 'The password is too weak. Please choose a stronger one.',
    'account-exists-with-different-credential':
        'An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.',
    'invalid-credential': 'The provided credential is invalid.',
    'invalid-verification-code': 'The verification code is invalid.',
    'invalid-verification-id': 'The verification ID is invalid.',
    'user-mismatch':
        'The provided credential does not correspond to this user.',
    'expired-action-code': 'The action code has expired.',
    'too-many-requests': 'Too many requests, please try again after some time.',
    'network-request-failed': 'No internet connection.',
  };

  static String handleAuthException(e) {
    if (e is! FirebaseAuthException) {
      return e.toString();
    }
    return _errorMessages[e.code] ??
        'An unknown error occurred. Please try again later.';
  }
}
