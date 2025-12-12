import 'dart:async' show Timer;

import 'package:fokus/features/pomodoro/presentation/states/timer_state.dart';
import 'package:fokus/features/pomodoro/typedefs/timer_factory.dart';
// ignore: depend_on_referenced_packages
import 'package:state_notifier/state_notifier.dart';

class TimerNotifier extends StateNotifier<TimerState> {
  Timer? _timer;
  final TimerFactory _timerFactory;

  TimerNotifier({required Duration initial, TimerFactory? timerFactory})
    : _timerFactory = timerFactory ?? ((d, cb) => Timer.periodic(d, cb)),
      super(TimerState(remaining: initial, isRunning: false));

  void start() {
    if (state.isRunning || state.remaining <= Duration.zero) return;
    _timer = _timerFactory(const Duration(seconds: 1), _onTick);
    state = state.copyWith(isRunning: true);
  }

  void _onTick(Timer t) {
    final rem = state.remaining - const Duration(seconds: 1);
    if (rem > Duration.zero) {
      state = state.copyWith(remaining: rem);
    } else {
      _timer?.cancel();
      _timer = null;
      state = state.copyWith(remaining: Duration.zero, isRunning: false);
    }
  }

  void pause() {
    _timer?.cancel();
    _timer = null;
    state = state.copyWith(isRunning: false);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
