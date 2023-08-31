import 'package:flutter/material.dart';
import 'package:flutter_ui_insta/screen/search_screen/search_grid.dart';
import 'package:flutter_ui_insta/screen/search_screen/search_text_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: [
          SearchTextBar(),
          SearchGrid(),
        ],
      )),
    );
  }
}


