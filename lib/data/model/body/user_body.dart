import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserBody {
  String? uid;
  final String? email;
  final String? password;
  final String? lang;

  UserBody({
    this.uid,
    this.email,
    this.lang,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      if (email != null) 'email': email,
      if (lang != null) 'lang': lang,
      'modifiedAt': FieldValue.serverTimestamp(),
    };
  }
}
