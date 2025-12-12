import 'dart:async' show Timer;

typedef TimerFactory = Timer Function(Duration, void Function(Timer));