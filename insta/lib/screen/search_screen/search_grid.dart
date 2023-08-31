import 'package:flutter/material.dart';

final gridItems = List.generate(30, (index) => Colors.grey.shade300);

class SearchGrid extends StatelessWidget {
  const SearchGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.zero,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: gridItems
          .map((color) => Container(
        color: color,
      ))
          .toList(),
    );
  }
}