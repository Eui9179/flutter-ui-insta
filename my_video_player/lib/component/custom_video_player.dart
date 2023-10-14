import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;

  const CustomVideoPlayer({
    required this.video,
    super.key,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  VideoPlayerController? videoController;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  @override
  void dispose() {
    super.dispose();
    videoController?.removeListener(videoControllerListener);
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
            onChanged: (double val) {
              videoController!.seekTo(Duration(seconds: val.toInt()));
            },
            value: videoController!.value.position.inMilliseconds.toDouble(),
            min: 0,
            max: videoController!.value.duration.inMilliseconds.toDouble(),
          ),
        )
      ]),
    );
  }

  initializeController() async {
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    videoController.addListener(videoControllerListener);

    setState(() {
      this.videoController = videoController;
      this.videoController!.play();
    });
  }

  void videoControllerListener() {
    setState(() {});
  }
}
