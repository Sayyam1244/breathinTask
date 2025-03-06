import 'package:breathin/data/model/response/song_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SongsRepository {
  Future getSongs() async {
    try {
      final res = await FirebaseFirestore.instance.collection('songs').get();
      return res.docs.map((e) => SongModel.fromJson(e.data())).toList();
    } catch (e) {
      return e.toString();
    }
  }
}
