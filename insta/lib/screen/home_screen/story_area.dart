import 'package:flutter/material.dart';

class StoryArea extends StatelessWidget {
  const StoryArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children:
          List.generate(10, (index) => UserStory(username: 'user$index'))),
    );
  }
}

class UserStory extends StatelessWidget {
  final String username;

  const UserStory({
    required this.username,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          Text(
            username,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}