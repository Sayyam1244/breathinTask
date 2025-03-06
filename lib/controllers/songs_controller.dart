import 'package:breathin/imports.dart';

class SongsController extends GetxController {
  final SongsRepository songsRepository;

  SongsController({required this.songsRepository});
  static SongsController get to => Get.find();
  //
  List<SongModel> _songs = [];

  List<SongModel> get songs => _songs;

  set songs(List<SongModel> value) {
    _songs = value;
    update();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  Future<void> getSongs() async {
    isLoading = true;
    await Future.delayed(const Duration(seconds: 2));
    final res = await songsRepository.getSongs();
    if (res is List<SongModel>) {
      songs = res;
    } else {
      showToast(res);
    }
    isLoading = false;
  }
}
