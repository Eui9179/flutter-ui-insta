import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_video_player/screen/render_empty.dart';
import 'package:my_video_player/screen/render_video.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? video;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: video == null
          ? RenderEmpty(onTap: onNewVideoPressed)
          : RenderVideo(video: video!),
    );
  }

  void onNewVideoPressed() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() => this.video = video);
    }
  }
}
