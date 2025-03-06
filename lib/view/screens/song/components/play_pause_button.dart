import 'package:breathin/core/helper/audio_player_helper.dart';
import 'package:breathin/imports.dart';
import 'package:just_audio/just_audio.dart';

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: AudioPlayerHelper.instance.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;

        if (processingState == ProcessingState.completed) {
          AudioPlayerHelper.instance.stop();
        }

        return Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              playing == true && processingState != ProcessingState.completed
                  ? Icons.pause_rounded
                  : Icons.play_arrow_rounded,
              color: context.theme.colorScheme.primary,
              size: 40.sp,
            ),
            onPressed: () {
              if (playing == true &&
                  processingState != ProcessingState.completed) {
                AudioPlayerHelper.instance.pause();
              } else {
                AudioPlayerHelper.instance.resume();
              }
            },
          ),
        );
      },
    );
  }
}
