import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late Timer timer;
  late Duration time;

  @override
  void initState() {
    super.initState();
    time = Duration(minutes: 1);
    timer = Timer.periodic(const Duration(seconds: 1), update);
  }

  void update(Timer timer) {
    if (time.inSeconds > 0) {
      time -= Duration(seconds: 1);
    } else {
      timer.cancel();
    }
    setState(() {});
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(time.toString()));
  }
}
