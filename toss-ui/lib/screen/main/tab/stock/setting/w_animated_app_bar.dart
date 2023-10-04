import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:flutter/material.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController controller;

  const AnimatedAppBar(
    this.title, {
    super.key,
    required this.controller,
  });

  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar> {
  double scrollPosition = 0;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() => scrollPosition = widget.controller.position.pixels);
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;
  bool get isNotTriggered => !isTriggered;
  Duration get duration => 10.ms;

  double getValue(double initial, double target) {
    if (isTriggered) return target;
    if (scrollPosition < 0) return initial;
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
              onTap: () => Nav.pop(context),
              child: const Arrow(
                direction: AxisDirection.left,
              ),
            ).p(20),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.only(left: getValue(20, 50), top: getValue(50, 15)),
              child: AnimatedDefaultTextStyle(
                duration: duration,
                style: TextStyle(fontSize: getValue(30, 20), fontWeight: FontWeight.bold),
                child: widget.title.text.make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
