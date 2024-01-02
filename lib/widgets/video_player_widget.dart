import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer(
      {required this.video, super.key, required this.onNewVideoPressed});

  State<CustomVideoPlayer> createState() => _CustomVideoPlayer();
}

class _CustomVideoPlayer extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  initializeController() async {
    final videoController = VideoPlayerController.file(File(widget.video.path));
    await videoController.initialize();
    setState(() {
      this.videoController = videoController;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AspectRatio(
      aspectRatio: videoController!.value.aspectRatio,
      child: Stack(children: [
        VideoPlayer(videoController!),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Slider(
            value: videoController!.value.position.inSeconds.toDouble(),
            onChanged: (double val) {
              videoController!.seekTo(Duration(seconds: val.toInt()));
            },
            min: 0,
            max: videoController!.value.duration.inSeconds.toDouble(),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ,
        ),
      ]),
    );
  }
}
