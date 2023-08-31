import 'package:flutter/material.dart';
import 'package:flutter_ui_insta/screen/home_screen/home_screen.dart';
import 'package:flutter_ui_insta/screen/search_screen/search_screen.dart';

class InstaBody extends StatelessWidget {
  final int index;

  const InstaBody({required this. index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return HomeScreen();
    }
    return SearchScreen();
  }
}
