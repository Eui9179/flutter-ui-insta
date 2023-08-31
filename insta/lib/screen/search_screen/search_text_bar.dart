import 'package:flutter/material.dart';

class SearchTextBar extends StatelessWidget {
  const SearchTextBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: TextField(
          cursorColor: Colors.black,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: '검색',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
              ),
              contentPadding: const EdgeInsets.all(0),
              filled: true,
              fillColor: Colors.grey.shade200),
        ),
      ),
    );
  }
}