import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_video_player/component/custom_video_player.dart';

class RenderVideo extends StatelessWidget {
  final XFile video;
  const RenderVideo({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomVideoPlayer(video: video),
    );
  }
}
