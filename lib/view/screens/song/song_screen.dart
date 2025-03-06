import 'dart:async';
import 'dart:ui';
import 'package:breathin/core/helper/audio_player_helper.dart';
import 'package:breathin/imports.dart';
import 'package:breathin/view/screens/song/components/audio_slider.dart';
import 'package:breathin/view/screens/song/components/play_pause_button.dart';
import 'package:just_audio/just_audio.dart';

class SongScreen extends StatefulWidget {
  const SongScreen({super.key, required this.songModel});
  final SongModel songModel;

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  bool initialLoading = true;
  late final StreamSubscription<PlayerState> _playerStateSubscription;

  @override
  void initState() {
    super.initState();

    AudioPlayerHelper.instance.play(widget.songModel.url);
    _playerStateSubscription =
        AudioPlayerHelper.instance.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.ready) {
        if (mounted) {
          setState(() {
            initialLoading = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    AudioPlayerHelper.instance.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(allowBack: true),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.songBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Stack(
            children: [
              Center(
                child: Image.asset(
                  Images.songIllustration,
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    20.verticalSpace,
                    Text(
                      widget.songModel.name,
                      style: headlineLarge(context).copyWith(fontSize: 30.sp),
                    ),
                    4.verticalSpace,
                    Text(
                      widget.songModel.author,
                      style: bodySmall(context),
                    ),
                    20.verticalSpace,
                    if (!initialLoading) ...[
                      const AudioSlider(),
                      const PlayPauseButton(),
                    ],
                    if (initialLoading) const LinearProgressIndicator(),
                    24.verticalSpace,
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
