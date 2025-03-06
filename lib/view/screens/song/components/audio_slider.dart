// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:breathin/core/helper/audio_player_helper.dart';
import 'package:breathin/imports.dart';

class AudioSlider extends StatefulWidget {
  const AudioSlider({super.key});

  @override
  _AudioSliderState createState() => _AudioSliderState();
}

class _AudioSliderState extends State<AudioSlider> {
  double _sliderValue = 0;
  bool _isDragging = false;
  late final StreamSubscription<Duration> _positionSubscription;

  @override
  void initState() {
    super.initState();
    _positionSubscription =
        AudioPlayerHelper.instance.positionStream.listen((duration) {
      if (mounted && !_isDragging) {
        setState(() {
          _sliderValue = duration.inSeconds.toDouble();
        });
      }
    });
  }

  @override
  void dispose() {
    _positionSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double maxDuration =
        AudioPlayerHelper.instance.duration?.inSeconds.toDouble() ?? 0;
    return Slider(
      value: _sliderValue.clamp(0, maxDuration),
      min: 0,
      max: maxDuration,
      onChanged: (value) {
        setState(() {
          _sliderValue = value;
        });
      },
      onChangeStart: (_) {
        _isDragging = true;
      },
      onChangeEnd: (value) {
        _isDragging = false;
        AudioPlayerHelper.instance.seek(Duration(seconds: value.toInt()));
      },
    );
  }
}
