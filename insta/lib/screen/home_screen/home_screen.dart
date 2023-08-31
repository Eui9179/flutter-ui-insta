import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feed_list.dart';
import 'story_area.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          StoryArea(),
          FeedList(),
        ],
      ),
    );
  }
}