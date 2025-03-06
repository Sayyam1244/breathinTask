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

  // Stream<bool> get bufferingStream => _audioPlayer.bufferingStream;

  // Stream<double> get volumeStream => _audioPlayer.volumeStream;

  // Stream<int> get sequenceStream =>
  //     _audioPlayer.sequenceStateStream.map((state) => state?.currentIndex ?? 0);

  // Stream<int> get indexStream => _audioPlayer.currentIndexStream;

  // Stream<void> get completionStream => _audioPlayer.processingStateStream
  //     .where((state) => state == ProcessingState.completed);

  // Stream<void> get errorStream =>
  //     _audioPlayer.playbackEventStream.where((event) =>
  //         event.processingState == ProcessingState.idle &&
  //         event.updatePosition == Duration.zero);
}
