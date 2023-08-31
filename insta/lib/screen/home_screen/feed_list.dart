import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedList extends StatelessWidget {
  const FeedList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: feedDataList.length,
      itemBuilder: (context, index) => FeedItem(feedData: feedDataList[index]),
    );
  }
}

class FeedItem extends StatelessWidget {
  final FeedData feedData;

  const FeedItem({required this.feedData, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(feedData.username),
                ],
              ),
              const Icon(Icons.more_vert),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          color: Colors.grey.shade300,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.chat_bubble,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.paperplane,
                    size: 28,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bookmark,
                  size: 28,
                ))
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: Text(
            '좋아요 ${feedData.likeCount}개',
            style: TextStyle(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 14,),
          child: Row(
            children: [
              Text(
                feedData.username,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 5,),
              Text(feedData.content),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        )
      ],
    );
  }
}

class FeedData {
  final String username;
  final int likeCount;
  final String content;

  FeedData(
      {required this.username, required this.likeCount, required this.content});
}


final List<FeedData> feedDataList = [
  FeedData(username: 'user1', likeCount: 50, content: 'content1'),
  FeedData(username: 'user2', likeCount: 23, content: 'content2'),
  FeedData(username: 'user3', likeCount: 45, content: 'content3'),
  FeedData(username: 'user4', likeCount: 12, content: 'content4'),
  FeedData(username: 'user5', likeCount: 10, content: 'content5'),
  FeedData(username: 'user6', likeCount: 12, content: 'content6'),
  FeedData(username: 'user7', likeCount: 14, content: 'content7'),
  FeedData(username: 'user8', likeCount: 34, content: 'content8'),
];
