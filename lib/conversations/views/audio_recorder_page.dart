// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, unused_field, unused_local_variable

import 'dart:async';

import 'package:bodsquare_sdk/conversations/views/audio_player_preview.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:bodsquare_sdk/r.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:record/record.dart';
// import 'package:permission_handler/permission_handler.dart'

class AudioRecorder extends StatefulWidget {
  final void Function(String path) onStop;
  final String conversationId;
  final String channelName;

  const AudioRecorder(
      {Key? key,
      required this.onStop,
      required this.conversationId,
      required this.channelName})
      : super(key: key);

  @override
  _AudioRecorderState createState() => _AudioRecorderState();
}

class _AudioRecorderState extends State<AudioRecorder> {
  bool _isRecording = false;
  bool _isPaused = false;
  int _recordDuration = 0;
  Timer? _timer;
  Timer? _ampTimer;
  final _audioRecorder = Record();
  Amplitude? _amplitude;

  @override
  void dispose() {
    _timer?.cancel();
    _ampTimer?.cancel();
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    try {
      // await Permission.microphone.request();
      // await Permission.storage.request();

      if (await _audioRecorder.hasPermission()) {
        // We don't do anything with this but printing
        final isSupported = await _audioRecorder.isEncoderSupported(
          AudioEncoder.aacLc,
        );
        if (kDebugMode) {
          // //log('${AudioEncoder.aacLc.name} supported: $isSupported');
        }

        // final devs = await _audioRecorder.listInputDevices();

        await _audioRecorder.start();

        bool isRecording = await _audioRecorder.isRecording();
        setState(() {
          _isRecording = isRecording;
          _recordDuration = 0;
        });

        _startTimer();
      }
    } catch (e) {
      if (kDebugMode) {
        //log(e.toString());
      }
    }
  }

  Future<void> _stop() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    final path = await _audioRecorder.stop();

    widget.onStop(path!);

    setState(() => _isRecording = false);
    Navigator.pop(context);

    showModalBottomSheet(
        context: context,
        isDismissible: true,
        shape: bottomsheetRadius,
        builder: (context) => AudioPlayerPreview(
              source: path,
              onDelete: () {
                //log('deleted');
                Navigator.pop(context);
              },
              conversationId: widget.conversationId,
              channelName: widget.channelName,
            ),
        isScrollControlled: true);
  }

  Future<void> _pause() async {
    _timer?.cancel();
    _ampTimer?.cancel();
    await _audioRecorder.pause();

    setState(() => _isPaused = true);
  }

  Future<void> _resume() async {
    _startTimer();
    await _audioRecorder.resume();

    setState(() => _isPaused = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black87, borderRadius: borderRadiusTopLR24),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.center,

        children: [
          const SizedBox(height: 18),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            TextButton(
                onPressed: () => Navigator.pop(context),
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.all(8),
                  // tapTargetSize: MaterialTapTargetSize.shrinkWrap
                ),
                child: SvgPicture.asset(
                  R.svg.asset.file_preview_cancel.assetName,
                  package: 'bodsquare_sdk',
                )),
          ]),
          // SizedBox(height: 200),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildRecordStopControl(),
              const SizedBox(width: 20),
              _buildPauseResumeControl(),
              const SizedBox(width: 20),
              _buildText(),
            ],
          ),

          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildRecordStopControl() {
    late Icon icon;
    late Color color;

    if (_isRecording || _isPaused) {
      icon = const Icon(Icons.stop, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = Icon(Icons.mic, color: theme.primaryColor, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            _isRecording ? _stop() : _start();
          },
        ),
      ),
    );
  }

  Widget _buildPauseResumeControl() {
    if (!_isRecording && !_isPaused) {
      return const SizedBox.shrink();
    }

    late Icon icon;
    late Color color;

    if (!_isPaused) {
      icon = const Icon(Icons.pause, color: Colors.red, size: 30);
      color = Colors.red.withOpacity(0.1);
    } else {
      final theme = Theme.of(context);
      icon = const Icon(Icons.play_arrow, color: Colors.red, size: 30);
      color = theme.primaryColor.withOpacity(0.1);
    }

    return ClipOval(
      child: Material(
        color: color,
        child: InkWell(
          child: SizedBox(width: 56, height: 56, child: icon),
          onTap: () {
            _isPaused ? _resume() : _pause();
          },
        ),
      ),
    );
  }

  Widget _buildText() {
    if (_isRecording || _isPaused) {
      return _buildTimer();
    }

    return Text(
      "Tap the microphone to record",
      style: satoshiRegular14.copyWith(color: Theme.of(context).primaryColor),
    );
  }

  Widget _buildTimer() {
    final String minutes = _formatNumber(_recordDuration ~/ 60);
    final String seconds = _formatNumber(_recordDuration % 60);

    return Text(
      '$minutes : $seconds',
      style: const TextStyle(color: Colors.red),
    );
  }

  String _formatNumber(int number) {
    String numberStr = number.toString();
    if (number < 10) {
      numberStr = '0$numberStr';
    }

    return numberStr;
  }

  void _startTimer() {
    _timer?.cancel();
    _ampTimer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() => _recordDuration++);
    });

    _ampTimer =
        Timer.periodic(const Duration(milliseconds: 200), (Timer t) async {
      _amplitude = await _audioRecorder.getAmplitude();
      setState(() {});
    });
  }
}
