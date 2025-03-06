import 'dart:developer';

import 'package:breathin/imports.dart';

class UserRepository {
  Future createUser(UserBody userBody) async {
    try {
      log(userBody.toJson().toString());
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userBody.uid)
          .set(userBody.toJson());
      return await getUser();
    } catch (e) {
      return e.toString();
    }
  }

  Future updateUser(UserBody userBody) async {
    try {
      log(userBody.toJson().toString());
      userBody.uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userBody.uid)
          .update(userBody.toJson());
      return await getUser();
    } catch (e) {
      return e.toString();
    }
  }

  Future getUser({String? docId}) async {
    try {
      final res = await FirebaseFirestore.instance
          .collection('users')
          .doc(docId ?? FirebaseAuth.instance.currentUser?.uid)
          .get();
      if (res.exists) {
        return UserModel.fromJson(res.data()!);
      } else {
        return "User does not exist";
      }
    } catch (e) {
      return e.toString();
    }
  }
}
