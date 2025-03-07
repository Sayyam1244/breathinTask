import 'package:just_audio/just_audio.dart';

class AudioPlayerHelper {
  static final AudioPlayerHelper _instance = AudioPlayerHelper._internal();
  static final AudioPlayer _audioPlayer = AudioPlayer();
  static AudioPlayerHelper get instance => _instance;

  AudioPlayerHelper._internal();

  Future<void> play(String audioPath) async {
    await _audioPlayer.setUrl(audioPath);
    await _audioPlayer.play();
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
  }

  Future<void> resume() async {
    await _audioPlayer.play();
  }

  Future<void> seek(Duration duration) async {
    await _audioPlayer.seek(duration);
  }

  Stream<Duration?> get durationStream => _audioPlayer.durationStream;

  Stream<Duration> get positionStream => _audioPlayer.positionStream;

  Stream<PlayerState> get playerStateStream => _audioPlayer.playerStateStream;
  Duration? get duration => _audioPlayer.duration;
  Duration? get currentDuration => _audioPlayer.position;
}
