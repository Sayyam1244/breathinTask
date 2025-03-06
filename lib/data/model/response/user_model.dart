import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? lang;
  final DateTime modifiedAt;

  UserModel({
    required this.uid,
    required this.email,
    this.lang,
    required this.modifiedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      lang: json['lang'],
      modifiedAt: (json['modifiedAt'] as Timestamp).toDate(),
    );
  }
}
