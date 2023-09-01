import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  int _counter = 0;
  late ShakeDetector detector;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    detector = ShakeDetector.autoStart(
      onPhoneShake: () {
        setState(() => _counter++);
      },
      shakeThresholdGravity: 1.5,
    );

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              '흔들어서 카운트를 올려보세요'
                  .text
                  .bold
                  .isIntrinsic
                  .black
                  .make()
                  .pSymmetric(v: 5, h: 5)
                  .box
                  .color(Colors.grey.shade300)
                  .withRounded(value: 8)
                  .make()
                  .pSymmetric(h: 20, v: 20),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ],
          ),
        ));
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        detector.startListening();
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        detector.stopListening();
        break;
      case AppLifecycleState.detached:
        break;
    }
  }
}

class RedBox extends StatelessWidget {
  const RedBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container().box.color(Colors.red).size(20, 20).make();
  }
}
