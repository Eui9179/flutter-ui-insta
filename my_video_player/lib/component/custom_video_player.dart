import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_video_player/component/custom_icon_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const CustomVideoPlayer({
    required this.video,
    required this.onNewVideoPressed,
    super.key,
  });

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer>
    with SingleTickerProviderStateMixin {
  Duration controlShowDuration = const Duration(milliseconds: 250);
  VideoPlayerController? videoController;
  Timer? timer;
  bool showControls = false;

  @override
  void initState() {
    super.initState();
    initializeController();
  }

  @override
  void dispose() {
    videoController?.removeListener(videoControllerListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (videoController == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() => showControls = !showControls);
        if (showControls) {
          timer = Timer(
            const Duration(seconds: 3),
            hideControls,
          );
        } else {
          timer?.cancel();
        }
      },
      child: AspectRatio(
        aspectRatio: videoController!.value.aspectRatio,
        child: Stack(children: [
          VideoPlayer(videoController!),
          AnimatedOpacity(
            opacity: showControls ? 1 : 0,
            duration: controlShowDuration,
            curve: Curves.easeIn,
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  renderTimeTextFromDuration(videoController!.value.position),
                  Expanded(
                    child: Slider(
                      onChanged: (double val) {
                        videoController!.seekTo(Duration(
                          microseconds: val.toInt(),
                        ));
                      },
                      value: videoController!.value.position.inMicroseconds
                          .toDouble(),
                      min: 0,
                      max: videoController!.value.duration.inMicroseconds
                          .toDouble(),
                    ),
                  ),
                  renderTimeTextFromDuration(videoController!.value.duration),
                ],
              ),
            ),
          ),
          // if (showControls)
          AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn,
            duration: controlShowDuration,
            child: showControls
                ? Align(
                    key: const Key('add-video-button'),
                    alignment: Alignment.topRight,
                    child: CustomIconButton(
                      onPressed: widget.onNewVideoPressed,
                      iconData: Icons.photo_camera_back,
                    ),
                  )
                : const SizedBox(key: Key('empty')),
          ),
          AnimatedSwitcher(
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeIn,
            duration: controlShowDuration,
            child: showControls
                ? Align(
                    alignment: Alignment.center,
                    child: Row(
                      key: const Key('video-controller'),
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomIconButton(
                          onPressed: onReversePressed,
                          iconData: Icons.rotate_left,
                        ),
                        CustomIconButton(
                          onPressed: onPlayPressed,
                          iconData: videoController!.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                        ),
                        CustomIconButton(
                          onPressed: onForwardPressed,
                          iconData: Icons.rotate_right,
                        ),
                      ],
                    ),
                  )
                : const SizedBox(key: Key('empty')),
          ),
        ]),
      ),
    );
  }

  initializeController() async {
    final videoController = VideoPlayerController.file(
      File(widget.video.path),
    );

    await videoController.initialize();

    videoController.addListener(videoControllerListener);

    setState(() => this.videoController = videoController);
  }

  void videoControllerListener() => setState(() {});

  void onReversePressed() {
    final currentPosition = videoController!.value.position;

    Duration position = Duration();

    if (currentPosition.inSeconds > 3) {
      position = currentPosition - const Duration(seconds: 3);
    }

    videoController!.seekTo(position);
    resetTimer();
  }

  void onForwardPressed() {
    final maxPosition = videoController!.value.duration;
    final currentPosition = videoController!.value.position;

    Duration position = const Duration();

    if ((maxPosition - const Duration(seconds: 3)).inSeconds >
        currentPosition.inSeconds) {
      position = currentPosition + const Duration(seconds: 3);
    }

    videoController!.seekTo(position);
    resetTimer();
  }

  void onPlayPressed() {
    if (videoController!.value.isPlaying) {
      videoController!.pause();
    } else {
      videoController!.play();
    }
    resetTimer();
  }

  @override
  void didUpdateWidget(covariant CustomVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.video.path != widget.video.path) {
      initializeController();
    }
  }

  Widget renderTimeTextFromDuration(Duration duration) {
    return Text(
      '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}',
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  void resetTimer() {
    timer?.cancel();
    timer = Timer(
      const Duration(seconds: 3),
      hideControls,
    );
  }

  void hideControls() {
    setState(() => showControls = false);
  }
}
