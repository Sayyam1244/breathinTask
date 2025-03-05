import 'package:cloud_firestore/cloud_firestore.dart';

class UserBody {
  final String uid;
  final String email;
  final String password;
  final String? lang;

  UserBody({
    required this.uid,
    required this.email,
    this.lang,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'lang': lang,
      'createdAt': FieldValue.serverTimestamp(),
    };
  }
}
