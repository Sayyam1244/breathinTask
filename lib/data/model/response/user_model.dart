import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String lang;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.email,
    required this.lang,
    required this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      lang: json['lang'],
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }
}
