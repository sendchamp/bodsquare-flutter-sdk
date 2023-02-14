import 'dart:io';

import 'package:bodsquare_sdk/conversations/controllers/conversations_controller.dart';
import 'package:bodsquare_sdk/helpers/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ViewVideoPagePage extends StatefulWidget {
  const ViewVideoPagePage({Key? key, required this.videoUrl, this.source})
      : super(key: key);

  final String videoUrl;
  final String? source;
  @override
  ViewVideoPagePageState createState() => ViewVideoPagePageState();
}

class ViewVideoPagePageState extends State<ViewVideoPagePage> {
  late VideoPlayerController _controller;
  final ConversationsController conversationsController = Get.find();

  @override
  void initState() {
    super.initState();
    if (widget.source != null && widget.source != '') {
      _controller = VideoPlayerController.file(File(widget.source ?? ''));
    } else {
      _controller = VideoPlayerController.network(widget.videoUrl);
    }
    _controller.addListener(() {
      setState(() {});
    });
    // _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ffffff,
          elevation: 0,
          foregroundColor: two92D32,
        ),
        body: Container(
          // height: Get.height * .5,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                // padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      VideoPlayer(_controller),
                      _ControlsOverlay(controller: _controller),
                      VideoProgressIndicator(
                        _controller,
                        allowScrubbing: true,
                        colors: const VideoProgressColors(
                          playedColor: zero066FF,
                          // bufferedColor: Colors.blue,
                          // backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Container(
              //   // height: 60,

              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           constraints: BoxConstraints(
              //             minHeight: 40,
              //           ),
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              //           decoration: BoxDecoration(
              //             color: f6F6F8,
              //             borderRadius: BorderRadius.circular(16.r),
              //           ),
              //           child: Center(
              //             child: TextField(
              //               controller:
              //                   conversationsController.textMessageController,
              //               minLines: 1,
              //               maxLines: 4,
              //               decoration: InputDecoration.collapsed(
              //                   hintText: 'Attach a message'),
              //             ),
              //           ),
              //         ),
              //       ),
              //       TextButton(
              //           onPressed: () {
              //             ;
              //           },
              //           style: TextButton.styleFrom(
              //             minimumSize: Size.zero,
              //             padding: EdgeInsets.all(8),
              //             // tapTargetSize: MaterialTapTargetSize.shrinkWrap
              //           ),
              //           child: SvgPicture.asset(
              //               R.svg.asset.send_message_icon.assetName)),
              //     ],
              //   ),
              // ),
            ],
          ),
        ));
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  // static const List<Duration> _exampleCaptionOffsets = <Duration>[
  //   Duration(seconds: -10),
  //   Duration(seconds: -3),
  //   Duration(seconds: -1, milliseconds: -500),
  //   Duration(milliseconds: -250),
  //   Duration(milliseconds: 0),
  //   Duration(milliseconds: 250),
  //   Duration(seconds: 1, milliseconds: 500),
  //   Duration(seconds: 3),
  //   Duration(seconds: 10),
  // ];
  static const List<double> _examplePlaybackRates = <double>[
    0.5,
    1.0,
    1.5,
    2.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  // color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: zero066FF,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
