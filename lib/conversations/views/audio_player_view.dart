import 'dart:async';

import 'package:audioplayers/audioplayers.dart' as ap;
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioPlayer extends StatefulWidget {
  /// Path from where to play recorded audio
  final String source;

  /// Callback when audio file should be removed
  /// Setting this to null hides the delete button
  // final VoidCallback onDelete;

  const AudioPlayer({
    Key? key,
    required this.source,
    // required this.onDelete,
  }) : super(key: key);

  @override
  AudioPlayerState createState() => AudioPlayerState();
}

class AudioPlayerState extends State<AudioPlayer> {
  static const double _controlSize = 56;
  // static const double _deleteBtnSize = 24;

  final _audioPlayer = ap.AudioPlayer();
  late StreamSubscription<void> _playerStateChangedSubscription;
  late StreamSubscription<Duration?> _durationChangedSubscription;
  late StreamSubscription<Duration> _positionChangedSubscription;
  Duration? _position;
  Duration? _duration;

  @override
  void initState() {
    _playerStateChangedSubscription =
        _audioPlayer.onPlayerComplete.listen((state) async {
      await stop();
      setState(() {});
    });
    _positionChangedSubscription = _audioPlayer.onPositionChanged.listen(
      (position) => setState(() {
        _position = position;
      }),
    );
    _durationChangedSubscription = _audioPlayer.onDurationChanged.listen(
      (duration) => setState(() {
        _duration = duration;
      }),
    );

    super.initState();
  }

  @override
  void dispose() {
    _playerStateChangedSubscription.cancel();
    _positionChangedSubscription.cancel();
    _durationChangedSubscription.cancel();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildControl(),
              _buildSlider(Get.width),
              // IconButton(
              //   icon: const Icon(Icons.delete,
              //       color: Color(0xFF73748D), size: _deleteBtnSize),
              //   onPressed: () {
              //     stop().then((value) => widget.onDelete());
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildControl() {
    Icon icon;
    Color color;

    if (_audioPlayer.state == ap.PlayerState.playing) {
      icon = const Icon(Icons.pause, color: zero066FF, size: 30);
      color = zero066FF.withOpacity(0.1);
    } else {
      icon = const Icon(Icons.play_arrow, color: zero066FF, size: 30);
      color = zero066FF.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child:
              SizedBox(width: _controlSize, height: _controlSize, child: icon),
          onTap: () {
            if (_audioPlayer.state == ap.PlayerState.playing) {
              pause();
              setState(() {
                icon = const Icon(Icons.play_arrow, color: zero066FF, size: 30);
              });
            } else {
              play();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSlider(double widgetWidth) {
    bool canSetValue = false;
    final duration = _duration;
    final position = _position;

    if (duration != null && position != null) {
      canSetValue = position.inMilliseconds > 0;
      canSetValue &= position.inMilliseconds < duration.inMilliseconds;
    }

    // double width = widgetWidth - _controlSize - _deleteBtnSize;
    // width -= _deleteBtnSize;

    return SizedBox(
      // width: width,
      child: Slider(
        activeColor: zero066FF,
        inactiveColor: zero066FF.withOpacity(.3),
        onChanged: (v) {
          if (duration != null) {
            final position = v * duration.inMilliseconds;
            _audioPlayer.seek(Duration(milliseconds: position.round()));
          }
        },
        value: canSetValue && duration != null && position != null
            ? position.inMilliseconds / duration.inMilliseconds
            : 0.0,
      ),
    );
  }

  Future<void> play() async {
    // log(widget.source);
    // _audioPlayer.setSourceUrl(
    //   widget.source,
    // );

    try {
      if (widget.source.contains('http')) {
        await _audioPlayer.play(
          ap.UrlSource(
            widget.source,
          ),
        );
      } else {
        await _audioPlayer.play(ap.DeviceFileSource(widget.source));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    // return await _audioPlayer.play(
    //   ap.UrlSource(
    //     widget.source,
    //   ),
    // );
  }

  Future<void> pause() => _audioPlayer.pause();

  Future<void> stop() => _audioPlayer.stop();
}
