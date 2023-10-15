import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_video_player/component/custom_video_player.dart';

class RenderVideo extends StatelessWidget {
  final XFile video;
  final GestureTapCallback onNewVideoPressed;

  const RenderVideo({
    super.key,
    required this.video,
    required this.onNewVideoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomVideoPlayer(
        video: video,
        onNewVideoPressed: onNewVideoPressed,
      ),
    );
  }
}
